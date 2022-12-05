
binDir=./bin/


echo "windows x86 64  webdavgo_x64.exe"
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build main.go
rm -rf $binDir/webdavgo_x64.exe
mv main.exe $binDir/webdavgo_x64.exe

echo "windows x86 32  webdavgo_x86.exe"
CGO_ENABLED=0 GOOS=windows GOARCH=386 go build main.go
rm -rf $binDir/webdavgo_x86.exe
mv main.exe $binDir/webdavgo_x86.exe

echo "windows arm 64  webdavgo_arm_x64.exe"
CGO_ENABLED=0 GOOS=windows GOARCH=arm64 go build main.go
rm -rf $binDir/webdavgo_arm_x64.exe
mv main.exe $binDir/webdavgo_arm_x64.exe

echo "linux x86 64  webdavgo_x64"
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go
rm -rf $binDir/webdavgo_x64
mv main $binDir/webdavgo_x64

echo "linux x86 32  webdavgo_x86"
CGO_ENABLED=0 GOOS=linux GOARCH=386 go build main.go
rm -rf $binDir/webdavgo_x86
mv main $binDir/webdavgo_x86

echo "linux arm 64  webdavgo_x64"
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build main.go
rm -rf $binDir/webdavgo_arm_x64
mv main $binDir/webdavgo_arm_x64



echo "macos x86 64   webdavgo_darwin_x64"
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build main.go
rm -rf $binDir/webdavgo_darwin_x64
mv main $binDir/webdavgo_darwin_x64

echo "macos arm 64  webdavgo_darwin_arm_x64"
CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build main.go
rm -rf $binDir/webdavgo_darwin_arm_x64
mv main $binDir/webdavgo_darwin_arm_x64

echo "clean ... "
rm -rf __debug_bin*

echo "git  ... "
git add .

git commit -m "编译后自动提交-$RANDOM"
# git pull
git push -u origin master 