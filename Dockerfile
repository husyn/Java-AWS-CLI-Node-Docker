# syntax = docker/dockerfile:1.0-experimental
FROM node:12.16.1-alpine

LABEL maintainer="Hussain Mansoor"

RUN apk add --update npm
RUN apk add openjdk11

RUN apk add --no-cache \
    python3 \
    py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install \
    awscli \
    && rm -rf /var/cache/apk/*

RUN apk add --no-cache  --repository http://dl-cdn.alpinelinux.org/alpine/edge/main --repository  http://dl-cdn.alpinelinux.org/alpine/edge/community docker

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
RUN export JAVA_HOME