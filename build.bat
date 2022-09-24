SET binDir=.\bin\

SET CGO_ENABLED=0
:  ====== x86 64
echo "windows x86 64  webdav.exe"
SET GOARCH=amd64
SET GOOS=windows
go build  main.go
del %binDir%webdav.exe & move main.exe %binDir%webdav.exe

echo "linux x86 64 webdav"
SET GOARCH=amd64
SET GOOS=linux
go build  main.go
del %binDir%webdav & move main %binDir%webdav

echo "macos x86 64 webdav"
SET GOARCH=amd64
SET GOOS=darwin
go build  main.go
del %binDir%webdav_darwin & move main %binDir%webdav_darwin

:  ====== x86 32
echo "windows x86 32 webdav32.exe"
SET GOARCH=386
SET GOOS=windows
go build  main.go
del %binDir%webdav32.exe & move main.exe %binDir%webdav32.exe


echo "linux x86 32 webdav32"
SET GOARCH=386
SET GOOS=linux
go build  main.go
del %binDir%webdav32 & move  main  %binDir%webdav32

echo "macos 32 ... jump "
:  ======

echo "windows arm  webdavArm.exe"
SET GOARCH=arm
SET GOOS=windows
go build  main.go
del %binDir%webdavArm.exe & move  main.exe  %binDir%webdavArm.exe

echo "linux arm  webdavArm"
SET GOARCH=arm
SET GOOS=linux
go build  main.go
del %binDir%webdavArm & move  main  %binDir%webdavArm


echo "macos arm64  .. pls go to macos"






PAUSE >nul
