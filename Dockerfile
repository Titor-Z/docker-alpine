FROM alpine

# 作者信息，维护者信息
LABEL Author Titor<foolsecret@163.com>
LABEL Maintainer Titor<foolsecret@163.com>

#
# 默认操作目录：
#   根目录下执行所有操作。
WORKDIR /

# 设置国内镜像源：MIRRORS.TENCENT.COM。
COPY  ./repositories  /etc/apk/

#
# 系统操作：
#   更新系统和系统依赖项，
#   安装 VIM编辑器，
#       Git 历史记录管理工具，
#       Tzdata 时区数据库。
RUN apk update && \
    apk upgrade && \
    apk add --no-cache vim \
            git \
            tzdata

#
# 设置时区：
#   设置默认系统时区为 中国上海，
#   删除Tzdata 时区数据库，减少空间占用。
RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime && \
    echo "Asia/shanghai" > /etc/timezone && \
    apk del tzdata


# 默认进入时的目录位置
WORKDIR /

# 对外挂载 /root/目录，
VOLUME  /root/

#
# 默认进入命令：
#   进入实例执行 /bin/sh （不然无法启动）
ENTRYPOINT [ "/bin/sh" ]
# CMD ["/bin/sh"]