SET binDir="./bin/"

SET CGO_ENABLED=0
:  ====== x86 64
echo "windows x86 64  webdav.exe"
SET GOARCH=amd64
SET GOOS=windows
go build  main.go
del %binDir%webdav.exe & ren main.exe %binDir%webdav.exe

echo "linux x86 64 webdav"
SET GOARCH=amd64
SET GOOS=linux
go build  main.go
del %binDir%webdav & ren main %binDir%webdav

echo "macos x86 64 webdav"
SET GOARCH=amd64
SET GOOS=darwin
go build  main.go
del %binDir%webdav_darwin & ren main %binDir%webdav_darwin

:  ====== x86 32
echo "windows x86 32 webdav32.exe"
SET GOARCH=386
SET GOOS=windows
go build  main.go
del %binDir%webdav32.exe & ren main.exe %binDir%webdav32.exe


echo "linux x86 32 webdav32"
SET GOARCH=386
SET GOOS=linux
go build  main.go
del %binDir%webdav32 &ren  main  %binDir%webdav32

echo "macos 32 ... jump "
:  ======

echo "windows arm  webdavArm.exe"
SET GOARCH=arm
SET GOOS=windows
go build  main.go
del %binDir%webdavArm.exe & ren  main.exe  %binDir%webdavArm.exe

echo "linux arm  webdavArm"
SET GOARCH=arm
SET GOOS=linux
go build  main.go
del %binDir%webdavArm & ren  main  %binDir%webdavArm


echo "macos arm64  .. pls go to macos"




ECHO close
PAUSE >nul