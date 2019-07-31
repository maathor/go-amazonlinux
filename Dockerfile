FROM amazonlinux:latest 

RUN yum -y install wget \
                    aws-cli \
                    tar \
                    git \
                    zlib-dev \
                    pthreads \
                    make \
                    gcc \
                    autoconf \
                    gcc-c++ \
                    docker-ce \
                    docker-ce-cli \
                    containerd.io \
                    pkgconfig-0.27.1-4.amzn2.x86_64 \
                    zip
RUN amazon-linux-extras install docker
# go part
ENV GOLANG_VERSION 1.11.2
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz

WORKDIR /tmp/
RUN wget "$GOLANG_DOWNLOAD_URL" -P /tmp/ && \
    tar -xzvf go"$GOLANG_VERSION".linux-amd64.tar.gz -C /usr/local && \
    rm go"$GOLANG_VERSION".linux-amd64.tar.gz

RUN mkdir -p /goproject
ENV GOPATH /goproject
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
RUN git clone https://github.com/edenhill/librdkafka.git
WORKDIR /tmp/librdkafka
RUN git checkout v1.1.0 && git checkout -b v1.1.0 && \
    ./configure --prefix=/usr --disable-lz4 --disable-ssl --disable-sasl && make && make install && \
    cd /tmp && rm -rf librdkafka
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib
ENV PKG_CONFIG_PATH $PKG_CONFIG_PATH:/usr/lib/pkgconfig/
WORKDIR /goproject/
VOLUME /goproject
