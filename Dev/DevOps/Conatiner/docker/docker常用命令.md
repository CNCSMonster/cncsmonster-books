## 一.如何拉取镜像

`docker pull <image-label>`

if with no version tag,use latest in default

## 二.如何从镜像启动容器,如何停止容器

(1). 启动容器

`docker run [-it] [--name <container-name>] [-d] <image-name>`

参数说明:

* -d :后台运行容器中命令,启动容器后回到主进程,容器独立运行

* 

* 

(2). 停止容器

`docker stop <container-name>|<container-id>`

停止后的容器内容信息不会被删除,可以再次启动:

`docker start <container-name>|<container-id>`

## 三.如何进入容器

1. 启动时交互式进入容器
   `docker exec -it <image-name> <bash-path>`

    默认使用`/bin/bash`

   这种方式进入容器一旦通过`exit`之类的方式登出,则容器将终止

2. 交互式进入运行中的容器

   `docker exec -it <container-name> <bash-path>`

   用这种方式可以多次进入一个容器,在容器中开始的主进程的工作结束前容器都不会因为登出而结束

## 四.如何查看容器信息,镜像信息

a. 查看所有运行中的容器: `docker ps`

b. 查看所有未清除的容器: `docker ps -a`

c. **查看某个容器具体信息** : `docker inspect <container-name/id>`

d. 查看镜像信息 : `docker images`

e. **查看指定容器的内存、硬盘、网络、cpu等资源的使用情况** 
```
# 使用docker stats
```
f. 查看指定容器占据的硬盘大小
   
```bash
# 把容器commit成镜像
# 然后查看镜像大小
```

## 五.删除镜像,删除容器

1. 删除镜像: `docker rmi <image-name[:version-tag]>`

   注意:要成功删除镜像,需要删除使用到该镜像的所有容器先.
   其次,删除镜像有时候需要指定具体的tag,如果删除了指定tag的某个镜像,
   比如删除了redis:1.0,但是如果该镜像有其他的名字比如redis:1,实际上底层是同一个镜像的话,该镜像的内容并不会从docker的存储区种删除.
   只有一个镜像失去了它所有的指向方式(所有标签)的时候才会被实际删除

2. 删除容器: `docker rm <container-name>/<container-id>`

   注意:容器要先stop,之后才能删除

## 六.使用docker build编译Dockerfile为镜像

`docker build -t <image-name> .`

这里面的`.`表示以当前路径为打包开始的路径,则docker build执行打包镜像操作的时候,使用的相对地址就是就是用`.` 指定的基地址 来确定绝对地址

> 编译镜像的过程中往往需要下下载软件,很多软件下载时往往需要科学上网才能在合理时间内下载成功


## 七. 把容器commit成镜像

```sh
docker commit <container-name> <image-name>
```