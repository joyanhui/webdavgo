
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
CGO_ENABLED=0 GOOS=windows GOARCH=arm go build main.go
rm -rf $binDir/webdavgo_arm_x64.exe
mv main.exe $binDir/webdavgo_arm_x64.exe

echo "linux x86 64  webdavgo_x64"
CGO_ENABLED=0 GOOS=linux GOARCH=arm go build main.go
rm -rf $binDir/webdavgo_x64
mv main $binDir/webdavgo_x64

echo "linux x86 32  webdavgo_x86"
CGO_ENABLED=0 GOOS=linux GOARCH=arm go build main.go
rm -rf $binDir/webdavgo_x86
mv main $binDir/webdavgo_x86

echo "linux arm 64  webdavgo_x64"
CGO_ENABLED=0 GOOS=linux GOARCH=arm go build main.go
rm -rf $binDir/webdavgo_arm_x64
mv main $binDir/webdavgo_arm_x64

echo "clean ... "
rm -rf __debug_bin*