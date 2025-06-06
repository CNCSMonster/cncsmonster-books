### 提示词

```
docker有哪些网络模式
```

### 反馈

Docker提供了多种网络模式，用于配置容器之间和容器与外部网络之间的通信。以下是Docker中常用的网络模式：

1. **桥接模式（Bridge）**：桥接模式是Docker默认的网络模式。在桥接模式下，Docker会创建一个虚拟的网络桥接接口（bridge），并将容器连接到这个桥接接口上。每个容器都会分配一个IP地址，并可以通过容器名称或IP地址相互通信。

2. **主机模式（Host）**：主机模式下，容器与宿主机共享网络命名空间。容器将直接使用宿主机的网络接口，不进行网络地址转换（NAT），也不会创建额外的网络接口。这种模式下容器的网络性能会更好，但容器之间的端口冲突可能会出现。

3. **无网络模式（None）**：无网络模式下，容器没有网络接口，完全与外部网络隔离。这种模式适用于那些不需要网络连接的容器，比如批处理任务或与外部网络无关的服务。

4. **容器模式（Container）**：容器模式允许多个容器共享一个网络命名空间。这意味着这些容器可以使用相同的网络配置，包括IP地址和端口。这种模式适用于需要共享网络栈的容器，比如微服务架构中的多个容器。

5. **自定义网络模式（Custom）**：除了上述内置的网络模式，Docker还提供了自定义网络模式的功能。使用自定义网络模式，可以创建具有自定义网络配置的网络，包括子网、网关和DNS等。这种模式适用于复杂的网络拓扑和多容器应用程序的部署。

通过选择适当的网络模式，可以实现容器之间的通信和与外部网络的连接。不同的网络模式适用于不同的应用场景，根据实际需求选择合适的网络模式可以提供更好的网络性能、安全性和灵活性。