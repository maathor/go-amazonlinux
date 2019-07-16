# go-amazonlinux

Description
Extends amazonlinux:latest, used to compile some projects written in go thant use kafka (producer / consumer)

# How to use this Docker image
This Docker image is intended to be used in conjunction with a gitlab-ci.yml on a gitlab runner

# Docker image details
Version latest
OS: amazonlinux

## Tools:

wget aws-cli tar git zlib-dev pthreads make gcc autoconf gcc-c++ docker-ce docker-ce-cli

## Versions:

librdkafka v0.11.5

go 1.11.2
