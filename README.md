```bash
# build image
docker build -t asp-net-app:latest .

# create container and port mapping
docker create --name aspnet-container -p 8080:80 -it asp-net-app:latest

# start container
docker start -ai aspnet-container

# creat and run container
docker run --name aspnet-container -p 8080:80 -it asp-net-app:latest

# start remote debugger in the container
docker exec -it aspnet-container "C:\Program Files\Microsoft Visual Studio 15.0\Common7\IDE\Remote Debugger\x64\msvsmon.exe" /nostatus /silent /noauth /anyuser /nosecuritywarn

# stop remote debugger
docker exec -it aspnet-container powershell.exe Stop-Process -Name msvsmon

# stop container
docker stop aspnet-container
```
