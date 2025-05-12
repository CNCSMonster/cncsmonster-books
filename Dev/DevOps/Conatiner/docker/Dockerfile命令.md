# Dockerfile命令

## 参考资料

## Overview

* 什么是Dockerfile
* 如何编写Dockerfile
* Q&A

## 一. 什么是Dockerfile

Dockerfile 是 组织 Dockerfile命令的文件, Dockerfile命令用来指导docker build 构建docker 镜像的过程,一般Dockerfile命名为`Dockerfile`,也有命名为`dockerfile`的。
一般使用方式如:`docker build . -t <target-image-name>`
其中`.` 指示开始构建过程的时候以当前路径为初始构建环境路径,`-t <target-image-name`指定构建的镜像的名字,比如`hello:1.0`,比如`test`,镜像名可能包括版本号


## 二. 如何编写Dockerfile

### 1. Dockerfile命令语法格式

### 2. Dockerfile的结构:
一个Dockerfile至少包含一个FROM命令,一般放在最开头,用来指定镜像的基底,如
`FROM ubuntu:latest` 指定该镜像的构建基于`ubuntu:latest`镜像
一般会包含一个CMD命令指定从镜像启动容器的时候执行的程序,如`CMD ["echo","Hello World!"]`
所以可以编写一个简单的镜像的Dockerfile如下:

```
FROM ubuntu:latest

CMD ["echo","Hello World!"]
```


## 三. Q&A 

### 1. Dockerfile中是否能够使用环境变量? 是否能够使用外部设定的环境变量？

### 2. Dockerfile中COPY命令使用的参数中是否参数名能够使用环境变量参与组成?

### 3. Dockerfile中的RUN命令和CMD命令的区别是什么?

### 4. Dockerfile中

