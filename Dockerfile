FROM alpine
LABEL Author Titor<foolsecret@163.com>

WORKDIR /
COPY  ./repositories  /etc/apk/

RUN apk update && \
    apk upgrade && \
    apk add --no-cache vim \
            git \
            tzdata

#
# 设置时区
#
RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime && \
    echo "Asia/shanghai" > /etc/timezone && \
    apk del tzdata


WORKDIR /
VOLUME  /root/

ENTRYPOINT [ "/bin/sh" ]
# CMD ["/bin/sh"]