# docker compose 使用

## Overview

* 参考资料

* 简介

* 常用命令和基础概念

* docker-compose.yml 与 .env 语法

* Q&A

## 一.参考资料

* [Docker Compose overview | Docker Docs](https://docs.docker.com/compose/)

## 二.简介

docker compose 是一种 命令行工具,能够用来管理多容器的docker应用的配置与执行。

一种获取方式是通过给 docker 加入插件的方式获取,这种方式能够使用`docker compose ...` 形式命令调用。新版本的docker下载后自带该插件

另一种获取docker compose的方式是下载单独的`docker-compose` 软件，往往用于老版本。

## 三.常用命令与基础概念

1. 配置文件:

   docker compose 使用`docker-compose.yml`文件配置要创建的容器以及网络,通过`.env` 文件 配置 `docker-compose.yml` 中用到的环境变量

   这两个文件要在同一个路径下

2. 启动与关闭

   `docker compose up -d #启动`

   `docker compose down #关闭`\
   这两个命令要在配置文件同一路径下输入

3. 查看是否已经根据配置启动了容器们

`docker compose ps`

## 四.docker-compose.yml 与.env 语法

### (一).`.env` 语法

```
<env> = <value>  
# 使用"#" 作为注释符
# <env> 为一个 字符字面量，可以称环境变量名,在该语句中 与<value>绑定
# <value> 一般为一个数 或者为一个字符串
# 可以在docker-compose.yaml中使用${<env>}的方式引用<value>绑定的值
```

### (二).docker-compose.yml语法

示例:

```
version: '3'
services:
  db:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: ${DB_PASS}
```

* 声明docker compose 的文件格式版本

  `version : "3"`

* 定义服务

  ```
  services:
      <服务名>:
          image: <镜像名>
          environment:
              <容器内环境变量名>:<变量值>
  ```

## 六.Q&A

### 1\. wsl中使用在wsl中下载的linux版本docker,使用docker compose up -d的时候报错`http: invalid Host header`

原因:未知,怀疑是 docker 本身的问题，

发生问题的版本`Docker Compose version v2.17.2` ,`Docker version 20.10.24, build 297e128`

解决方法，参考[Docker-compose ERROR \[internal\] booting buildkit, http: invalid Host header - Stack Overflow](https://stackoverflow.com/questions/77225539/docker-compose-error-internal-booting-buildkit-http-invalid-host-header)

更新docker版本`sudo snap refresh docker --channel=latest/edge` , 成功解决!