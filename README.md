## Alpine Docker Image Source

Alpine Docker image. 是在alpine的官方image基之上，加入了平时开发中常用的几个功能和中国的时区设置。

### 更改内容如下：
- Vim 方便进入容器实例后快速更改和查看文件内容。
- Git 方便通过Git clone 远程资源代码，同时也方便本地源码的管理。
- Tzdata 时区数据库（临时使用），设置服务器的正确时区（本镜像默认使用 Asia/shanghai 时区）。
- Tencent镜像源 更改系统默认的系统源，使用腾讯的开源镜像源（系统下载和更新会更快）

__PS:__ 综上所述，本镜像添加了Vim、Git功能模块。设置系统默认时区为中国上海（东8区），更改为国内的腾讯镜像源。


