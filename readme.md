# webdavgo
> 一个轻量高性能简单可靠的webdav + httpFileSever（静态文件浏览服务） 的 实现

使用go 1.19 开发 区区不到百行代码

> 全平台兼容

x86下windowsxpSp3 32 windows11  docker_Centos7 macOS 13 Ventura 测试通过 

arm下 OpenWrt 测试通过

> 理论上也支持 MIPS和RISC-V 架构cpu，自己编译就好

可执行文件7M左右 占用内存10M左右

webdav可以加密码认证

静态文件功能 可以直接浏览器浏览下载文件

两者可以不同目录，webdav 和 静态文件服务 都可以单独关闭


#### 更新日志

##### v1.1 2002-9-24 11:11
新增 webdav 单独关闭 功能，可以单独做为webdav或者httpFileSever（静态文件浏览服务）使用
修复 配置文件中并不影响使用的一处拼写错误

## 使用方法
下载后直接运行
exe版本 是windows使用的，无后缀文件 是linux macos使用
win下直接执行
linux macos下 先`chmod +x webdav` 后 `./webdav` 启动即可

启动后会提示用户密码 和访问地址

gitee：https://gitee.com/joyanhui/webdavgo/releases/

github：https://github.com/joyanhui/webdavgo/tags

### 可以无配置文件启动
```
webdav地址：
http://YourHostAddress:18123/
httpFileSever地址：
http://YourHostAddress:18123/list/
文件路径：当前目录
无认证，请用nginx或者Caddy等添加认证功能，或者使用自定义配置文件
```
### 默认配置文件
```
webdav地址：
http://YourHostAddress:18123/

用户名：user 密码：123456
文件路径：当前目录

httpFileSever地址：
http://YourHostAddress:18123/list/
文件路径：当前目录
```



## 关于Windows直接挂载的问题
windows 映射目录即可 http://YourHostAddress:18123/

有密码的情况下，windows直接挂载有问题

部分版本windows挂载容量剩余显示和C盘一样，这是windows的问题

可以使用raidrive 挂载

## linux 和macos挂载
推荐 davfs2

## ios挂载 或 安卓挂载
推荐使用es文件管理器

测试过的一些app(IOS)： nPlayer  fileball

## 浏览器提示 Method Not Allowed 
请使用专业的webdav工具打开

浏览器只读模式直接访问请访问 http://YourHostAddress:18123/list/

## 配置文件说明

#### server_port
端口号  webdav 和 httpFileServer 公用一个端口
端口请尽量用高位端口防止冲突

#### webdav_user_name
webdav用户名，用户名为空的时候 webdav 无密码

#### webdav_user_psw
webdav 用户密码

#### webdav_file_path
webdav 服务对应的文件地址
支持相对目录和绝对目录，win下注意转义
例如
.  可执行文件当前目录
.. 上级目录
../.. 上两级目录
D:\\\\VM  D盘VM文件夹

#### list_server_path
文件服务的url路径
http://YourHostAddress:server_port/list_server_path/

#### list_file_path
文件服务 对应的物理地址，路径格式和webdav_file_path相同

## 无配置文件也可以启动
启动后 无用户密码，端口118123 路径 是可执行文件所在路径

## 文件路径和权限说明
支持软连接
对应路径需要有执行程序的用户的读写权限
## 服务器路径
可以自定义后缀，也是为了防止被扫描
## 端口说明
默认使用18123端口，可以自行修改。请确保无冲突 程序并不会处理端口冲突问题，否则程序会直接退出 无法启动

## 关于ssl
没有计划支持，因为免费ssl续签麻烦不打算用golang来搞，自己用nginx Caddy之类的套就好。
服务器管理软件也很多，也很多支持自动续期的
密码验证功能也建议关闭，转由nginx处理

## 其他问题

#### list_file_path 修改无效
浏览器缓存问题，清理缓存就ok

#### 生产环境使用

还是要套ssl。不套ssl 就接近裸奔

密码验证也尽量交给前端反代服务器来做。

自带的webdav密码功能，只能说应急用。

关于权限问题，你用什么用户运行，那么webdav 和httpFileSever就是什么权限。要方便就直接root/administrator ，要安全就低权限用户。

## 自己编译
基于 go 1.19
`go get golang.org/x/net/webdav`

其他参考即可 很简单 build.bat

## 用途

一开始为了解决 docker里面的关键性目录映射，而不想使用-v挂载。以及一直想做一个简单网盘。

突然想到最符合我需求的还是golang 

也用烦了群晖和unraid，加上我可怜的路由器 仅剩下8M flash，所以就搞起来这个。


当然也可以做私有盘使用，支持webdav协议的同步客户端 一大堆。什么自动备份之类的都不是问题。

所以后续 会继续更新下去。但是功能不会太繁琐，会一直本着 文件共享同步 和 分享的路线 轻量稳定的 路线发展。

个人主页：https://www.leiyanhui.com/

