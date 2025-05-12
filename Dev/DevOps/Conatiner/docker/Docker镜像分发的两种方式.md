
1. 通过 registry 服务分发
2. 通过打包传输解压镜像文件分发
    ```
    docker save -o myimage.tar myimage:tag
    # 从压缩文件恢复镜像
    docker load -i myimage.tar
    ```
