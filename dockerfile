FROM microsoft/aspnet

# install remote debugger
RUN Invoke-WebRequest -OutFile c:\vs_remotetools.exe -Uri https://download.visualstudio.microsoft.com/download/pr/7dc739dc-7ac6-4d3e-9a1a-8545ec7b4b2b/5ad9ec4cc15ad30e7560dfb8620ad4bf/vs_remotetools.exe;
RUN & 'c:\vs_remotetools.exe' /install /quiet

# RUN msbuild asp-net-app.sln /p:DeployOnBuild=true /p:PublishProfile=DebugFolderProfile
COPY ./asp-net-app/bin/Debug/Publish/ /inetpub/wwwroot

# EXPOSE 4022 4023 80
