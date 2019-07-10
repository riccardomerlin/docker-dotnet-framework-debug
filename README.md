Debug .Net Framework MVC apps running in Docker
===============================================
In this example we will see how to debug a traditional .Net
Framework MVC app that runs in a Docker container.

Get started
-----------
1. Clone this repo and from the root folder execute the following
commands from the shell to get the app running in a Docker container.
   ```bash
   # build image
   docker build -t asp-net-app:latest .

   # create and run container
   docker run --name aspnet-container -p 8080:80 -it asp-net-app:latest
   ```
1. On another shell start the remote debugger in the container.
   ```bash
   # start remote debugger in the container
   docker exec -it aspnet-container "C:\Program Files\Microsoft Visual Studio 15.0\Common7\IDE\Remote Debugger\x64\msvsmon.exe" /nostatus /silent /noauth /anyuser /nosecuritywarn
   ```

1. Open up your browser and load `http://localhost:8080`. You should
see the page shown below.
1. Now, open up `/asp-net-app.sln` in Visual Studio 2017.
1. From the top menu select `Debug > Attach to process...`.
1. On the "attach ro process" window > Connection target > click on `Find`.
1. If the debugger is running (see step 1) yuo should get a result.
1. Select the remote debugger found.
1. Tick `Show processes for all users`.
1. select `w3wp.exe` and click `Attach`.
1. Set a breakpoint on `HomeController.cs > About()` action.
1. Go back to the browser page and click the `About` page link.
1. Visual Studio debugger should stop on the breakpoint set.

Other actions
-------------
```bash
# stop remote debugger
docker exec -it aspnet-container powershell.exe Stop-Process -Name msvsmon

# stop container
docker stop aspnet-container

# create container and port mapping
docker create --name aspnet-container -p 8080:80 -it asp-net-app:latest

# start container
docker start -ai aspnet-container
```
