# Alpine Docker Image Source

## 什么是Alpine Docker Image
Alpine Docker image. 是在alpine的官方image基础之上，加入了平时开发中常用的几个功能，并设置系统的默认时区为中国上海（东8区）。

我们不破坏官方的Alpine Docker，只是做了开发中最基础的拓展，让Alpine可以外挂宿主机文件。既可以作为你的基础Image镜像，也可以作为本地项目开发环境的底层管理系统来使用。

## 所做修改如下：
- Vim 方便进入容器实例后快速更改和查看文件内容。
- Git 方便通过Git clone 远程资源代码，同时也方便本地源码的管理。
- Tzdata 时区数据库（临时使用），设置服务器的正确时区（本镜像默认使用 Asia/shanghai 时区）。
- Tencent镜像源 更改系统默认的系统源，使用腾讯的开源镜像源（系统下载和更新会更快）

__PS:__ 
综上所述，本镜像添加了Vim、Git功能模块。设置系统默认时区为中国上海（东8区），更改为国内的腾讯镜像源。


## 如何使用

### 用法1:
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

### 用法2:
作为容器实例使用：

```bash
docker run \
  -it \
  --name MyAlpine \
  -v ${HOME}/:/root/ \
  foolsecret/alpine
```
常用在服务器环境搭建（如PHP composer安装文件，npm依赖安装，Git文件下载等等），如果你不喜欢Ubuntu、CentOS的package管理工具，或你不希望破坏宿主机的本地环境，那你可以将当前的实例作为本地宿主机的开发系统。如果你对Alpine系统更加熟悉的话，那上手是很快的。

优势在于，可以向容器内挂载外部宿主机文件，在容器内部对宿主机文件进行操作，而不会破坏宿主机的系统环境。