```bash
docker build -t asp-net-app:latest .

docker create --name aspnet-container -p 8080:80 -p 4022:4022 -it asp-net-app:latest

docker start -ai aspnet-container

# docker run --name aspnet-container -p 8080:80 -it asp-net-app:latest

docker exec -it aspnet-container "C:\Program Files\Microsoft Visual Studio 15.0\Common7\IDE\Remote Debugger\x64\msvsmon.exe" /nostatus /silent /noauth /anyuser /nosecuritywarn
```
