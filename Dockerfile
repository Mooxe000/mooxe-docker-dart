FROM mooxe/base:dev

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

# update
RUN apt-fast update && \
    apt-fast upgrade -y

RUN apt-fast install -y apt-transport-https

# RUN sh -c 'curl \
# https://dl-ssl.google.com/linux/linux_signing_key.pub \
# | apt-key add -' && \
#     sh -c 'curl \
# https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list \
# > /etc/apt/sources.list.d/dart_stable.list'

ADD Install /root/Install
# RUN apt-key add /root/Install/linux_signing_key.pub && \
#     cat /root/Install/dart_stable.list > \
#       /etc/apt/sources.list.d/dart_stable.list
RUN dpkg -i /root/Install/*.deb
RUN rm -rf /root/Install

# RUN apt-fast update && \
#     apt-fast install -y dart

RUN echo '\
export PATH="$PATH:/usr/lib/dart/bin"\n\
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub/"\
' >> ~/.bashrc

# ============
# Clean
# ============
RUN \
    apt-fast autoremove -y && \
    apt-fast autoclean
    # rm -rf /var/lib/apt/lists/*
