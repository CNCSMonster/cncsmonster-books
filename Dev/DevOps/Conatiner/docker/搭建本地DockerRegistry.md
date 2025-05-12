# 搭建与使用 本地DockerRegistry

## 参考
1. [official guide](https://distribution.github.io/distribution/)

## Case

```bash
#!/bin/bash

# 本脚本用于搭建一个本地的Docker Registry并展示如何使用它。

# 设置变量
REGISTRY_NAME="local-registry"
REGISTRY_PORT="5000"
CONTAINER_INNER_REGISTRY_PORT="5000"
# 指定镜像存储位置
STORAGE_PATH="/path/to/local/registry/storage"
IMAGE_NAME="my-image"
LOCAL_IMAGE_TAG="localhost:${REGISTRY_PORT}/${IMAGE_NAME}"

# 启动 Docker Registry 容器
echo "启动 Docker Registry..."
docker run -d -p "${REGISTRY_PORT}:${CONTAINER_INNER_REGISTRY_PORT}" --restart=always --name "${REGISTRY_NAME}" \
  -v "${STORAGE_PATH}:/var/lib/registry" \
  registry:2

# 等待几秒确保 Docker Registry 启动
sleep 3

# 检查 Registry 是否成功运行
echo "检查 Docker Registry 状态..."
curl -X GET http://localhost:${REGISTRY_PORT}/v2/_catalog

# 标记本地镜像以便推送到本地 Registry
echo "标记镜像为本地 Registry 格式..."
docker tag "${IMAGE_NAME}" "${LOCAL_IMAGE_TAG}"

# 推送镜像到本地 Registry
echo "推送镜像到本地 Registry..."
docker push "${LOCAL_IMAGE_TAG}"

# 从本地 Registry 拉取镜像
echo "从本地 Registry 拉取镜像..."
docker pull "${LOCAL_IMAGE_TAG}"

# 脚本结束
echo "本地 Docker Registry 配置完成。"
```