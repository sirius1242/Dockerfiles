## Dockerized MCDReforged

[MCDReforged](https://github.com/Fallen-Breath/MCDReforged) 的 docker 化，基于 Debian-bullseye，包含 python3, openjdk-17-jre, 使用 pip 安装最新版 mcdreforged 以及部分 mcdr 插件需要的依赖。

由于使用 openjdk-17，因此可以运行 Minecraft 1.17 及以上的版本。

### Usage：

已经打包好的 docker image 在 [sirius1242/mcdr](https://hub.docker.com/repository/docker/sirius1242/mcdr)，可以直接 docker pull sirius1242/mcdr

首先用 `sudo docker run -it --rm -v $MCDReforged_DIR:/mcdr sirius1242/mcdr /bin/bash` 后，进行 mcdr 初始化及其他相关操作，此时 $MCDReforged_DIR，即容器内的 /mcdr 目录相当于 mcdreforged 基础目录，在其中使用 `python3 -m mcdreforged init` 进行初始化，并将 minecraft server 的 jar 文件以及 forge/fabric 等启动器 jar 文件移入 server/ 目录。若 minecraft 服务器还未进行初始化，请先进行启动器安装或 minecraft 服务器初次运行以获得启动器文件及 eula.txt 文件等。对 eula.txt 文件及 server.properties 等文件进行更改后可以退出 container，此时 container 会自动删除。

之后将 MCDR 的插件和配置等放入挂载目录中对应的位置，使用 `sudo docker run -dt -v $MCDReforged_DIR:/mcdr -p 25565:25565 sirius1242/mcdr` 来启动容器。但在后台的服务器无法进行交互，我更推荐使用交互式 terminal，在 tmux 中使用 `sudo docker run -it -v $MCDReforged_DIR:/mcdr -p 25565:25565 sirius1242/mcdr` 来进行后续的交互式控制，

[MCDR 插件仓库](https://github.com/MCDReforged/PluginCatalogue)
