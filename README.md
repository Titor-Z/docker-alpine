<img src="https://wiki.alpinelinux.org/images/alogo.png">

# **Alpine Docker Image** <br><br>

> **SLOGAN**：
> <br>适合国内开发者的Alpine基础镜像。 

<br>

## 什么是 **Alpine Docker Image** 呢 ?
Alpine Docker image —— 在alpine的官方image基础之上，加入了平时开发中常用的几个功能，并对系统进行了基本的设置。

我们不破坏官方的Alpine Docker，只是做了开发中最基础的拓展，让Alpine可以作为你的基础Image镜像，也可以作为本地项目开发环境的底层管理系统来使用。

<br>

## 镜像标签说明
- `latest`、`version-*.*.*` <br>
基础镜像版本。只包含系统基础设置，文件体积最小，适合用来做为基础镜像使用。<br>
如若要使用最新的版本，使用时可忽略标签 或 使用 `latest` 标签。

- `dev`、`dev-*.*.*` <br>
开发环境版本。包含常用软件和基础系统设置。文件体积偏大，适合作为本地开发环境或者服务器开发环境的实例使用。<br>
如若要使用最新的版本，请使用 `dev` 标签。

<br>

## 为何创建该资源呢 ？

**以下是平时开发常遇到的问题：**
1. 官方镜像可以直接运行实例，但未提供外挂宿主机磁盘（也可能是我不会用），不便向实例提供宿主文件。
2. 日常做测试时，需要安装基本的vim软件进行内部编辑。
3. 默认的apk源为官方地址，国内下载速度会受影响。
4. 系统的默认时区不是中国，其他软件在运行中或做日志记录时会出现时区上的问题。
5. 在远程服务器上希望通过alpine虚拟实例来管理开发环境，既不影响服务器的本地环境，也不需要学习服务器的其他shell指令，即可完成操作。

除了以上问题，在服务器文件的管理上，如果使用系统自带的GIT进行管理文件，可能会因为GIT版本的问题出现异常，如果将系统所需的所有软件安装到实例中，就可以通过Docker实例管理服务器开发环境。

为了方便自己的使用，也方便大家的使用，因此创建了当前的Image资源。大家需要的第三方软件可能会不一样，因此本Image只做了最基本的修改，满足80%的人基础所需。我希望当前的Image尽可能轻量，因此只对系统做一丢丢的扩展，大家可以在当前的镜像基础上改进成自己所需的新镜像。

<br>

## 相比官方镜像，做了那些更改呢 ？
- 添加 `Vim`， 方便进入容器实例后快速更改和查看文件内容。
- 添加 `Git`，方便通过实例中的GIT管理宿主机资源。
- 添加 `Tzdata 时区数据库`（临时使用），设置服务器的默认时区为： `Asia/shanghai` 。
- 添加 `Tencent镜像源`， 替换系统默认的系统源，系统下载和更新会更快。
- 添加 `/root/对外挂载`，可以在实例化容器时，外挂资源到实例容器的 `root用户根目录（即/root/）`下。

<br>

## 如何使用 ?

**用法1:** <br>
在Dockerfile中作为基础镜像使用：

```dockerfile
FROM  foolsecret/alpine
RUN   apk add mysql

EXPOSE 3306
VOLUME /root/mysql/

CMD ["mysql"]
```

作为基础镜像使用，编写你自己的Dockerfile即可。
以上代码仅供参考。


**用法2：** <br>
作为容器实例使用：

```bash
docker run \
  -it \
  --name MyAlpine \
  -v ${HOME}/:/root/ \
  foolsecret/alpine:dev
```
常用在服务器环境搭建（如PHP composer安装文件，npm依赖安装，Git文件下载等等），如果你不喜欢Ubuntu、CentOS的package管理工具，或你不希望破坏宿主机的本地环境，那你可以将当前的实例作为本地宿主机的开发系统。如果你对Alpine系统更加熟悉的话，那上手是很快的。

优势在于，可以向容器内挂载外部宿主机文件，在容器内部对宿主机文件进行操作，而不会破坏宿主机的系统环境。

<br>

## 其他

### 资源信息
- <kbd>**Github**</kbd> [https://github.com/Titor-Z/docker-alpine](https://github.com/Titor-Z/docker-alpine)
- <kbd>**HomePage**</kbd> [https://titor-z.github.io/docker-alpine](https://titor-z.github.io/docker-alpine)
- <kbd>**DockerHub**</kbd> [https://hub.docker.com/r/foolsecret/alpine](https://hub.docker.com/r/foolsecret/alpine)

<br>

### 联系我们
大家可以在GitHub上提 `issue`，或者 `forwork` 构建自己的镜像，鼓励大家 `commit`。

<br>

### 版权信息
本镜像和官方Github资源免费开源，遵循 _MIT_ 协议，任何人和组织可以无偿使用。