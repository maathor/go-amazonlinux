FROM amazonlinux:latest 

USER root

RUN yum -y install curl zip aws-cli gzip tar git

WORKDIR ~

ENV GOLANG_VERSION 1.11.2
RUN curl -O https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz
RUN gzip go1.11.2.linux-amd64.tar.gz
RUN ls
RUN tar -xvf go1.11.2.linux-amd64.tar.gz
RUN mv go /usr/local

ENV GOPATH $HOME/workspace
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin
RUN mkdir $HOME/workspace