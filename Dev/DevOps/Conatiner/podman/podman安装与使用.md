## 坑点 1: 为一个用户安装了 podman 后，其他用户无法使用

环境:

```
PRETTY_NAME="Ubuntu 24.04 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04 LTS (Noble Numbat)"
```

安装方式: apt

在某个用户 u 安装了 podman 之后,切换到用户 gitea
执行如下命令报错:

```shell
gitea@VM-8-17-ubuntu:~$ podman --version
ERRO[0000] XDG_RUNTIME_DIR directory "/run/user/1003" is not owned by the current user
```

检查发现 `1003` 是 用户 u 的 uid, 而 用户 gitea 的 uid 是 `1004`.

解决方法: 暂无
