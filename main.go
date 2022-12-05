package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"strconv"

	"golang.org/x/net/webdav"
)

var webDavConfig map[string]interface{}
var fs_webdav = &webdav.Handler{}
var server_port_string string

func init() {

	ConfigData, err := os.ReadFile("webdavgo.json") // 读取文件
	var settingCfg string
	if err == nil {
		settingCfg = string(ConfigData)
	} else {
		//无配置文件的情况

		settingCfg = "{\"webdav_user_name\":\"admin\",\"webdav_user_psw\":\"admin\",\"webdav_server_port\":18123,\"webdav_file_path\":\".\",\"list_server_path\":\"/list/\",\"list_file_path\":\".\"}"
		fmt.Println("Use default configuration | 使用默认配置")
		fmt.Println("settingCfg", settingCfg)
	}
	json.Unmarshal([]byte(settingCfg), &webDavConfig) //转化到map
}
func main() {

	port_float64, _ := strconv.ParseFloat(fmt.Sprintf("%f", webDavConfig["webdav_server_port"]), 64) //从interface转化到float64 再到int 再到port_str
	server_port_string = fmt.Sprintf("%d", int(port_float64))

	//webdav_file_path 不为空的时候 启动 webdav
	if fmt.Sprintf("%s", webDavConfig["webdav_file_path"]) != "" {
		http.HandleFunc("/", web_dav) //启动webdav
		fmt.Println("webdav url: http://localhost:" + server_port_string + "/   file pach:" + fmt.Sprintf("%s", webDavConfig["webdav_file_path"]))
		if webDavConfig["webdav_user_name"] != "" {
			fmt.Println("webdav_user_name=", webDavConfig["webdav_user_name"], ", webdav_user_psw=", webDavConfig["webdav_user_psw"])
		}
	}

	//http.HandleFunc("/list2/", http_list1)
	list_server_path := fmt.Sprintf("%s", webDavConfig["list_server_path"])
	list_file_path := fmt.Sprintf("%s", webDavConfig["list_file_path"])
	if list_server_path != "" {
		http.Handle(list_server_path, http.StripPrefix(list_server_path, http.FileServer(http.Dir(list_file_path))))

		fmt.Println("weblist url: http://localhost:" + server_port_string + list_server_path + "   file pach:" + list_file_path)
	}

	http.ListenAndServe(":"+server_port_string, nil)

}

/* webdav */
func web_dav(w http.ResponseWriter, req *http.Request) {

	if webDavConfig["webdav_user_name"] != "" {
		// 获取用户名/密码
		webdav_user_name, webdav_user_psw, ok := req.BasicAuth()
		if !ok {
			w.Header().Set("WWW-Authenticate", `Basic realm="Restricted"`)
			w.WriteHeader(http.StatusUnauthorized)
			return
		}
		// 验证用户名/密码
		if webdav_user_name != fmt.Sprintf("%s", webDavConfig["webdav_user_name"]) || webdav_user_psw != fmt.Sprintf("%s", webDavConfig["webdav_user_psw"]) {
			http.Error(w, "WebDAV: need authorized!", http.StatusUnauthorized)
			return
		}
	}
	fs_webdav = &webdav.Handler{
		FileSystem: webdav.Dir(fmt.Sprintf("%s", webDavConfig["webdav_file_path"])), //路径
		LockSystem: webdav.NewMemLS(),
	}

	fs_webdav.ServeHTTP(w, req)
}
