
## Ref

- ubuntu24上安装: https://www.sysgeek.cn/install-docker-ubuntu/


## Q&A

1. 问题`docker ps` 失败,
原因可能是 用户不在docker用户组中,使用如下命令把用户加入用户组
`sudo usermod -aG docker $USER`
如果使用了该命令还没有解决,可能是docker用户组不存在,`cat /etc/group |grep docker`确认
尝试如下操作:
```shell
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker
```

