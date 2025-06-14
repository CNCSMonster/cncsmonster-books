# WSL（Windows Subsystem for Linux）


## 一. 参考资料

1. GPT

2. [Winux之路-WSL 2的使用及填坑 - 知乎 (](https://zhuanlan.zhihu.com/p/224753478)[zhihu.com](http://zhihu.com)[)](https://zhuanlan.zhihu.com/p/224753478)

3. [史上最全的WSL安装教程 - 知乎 (](https://zhuanlan.zhihu.com/p/386590591)[zhihu.com](http://zhihu.com)[)](https://zhuanlan.zhihu.com/p/386590591)

## 二. 简介

WSL（Windows Subsystem for Linux）是Windows的一个功能，允许在Windows计算机上运行Linux环境，而无需使用虚拟机或双引导。WSL旨在为希望同时使用Windows和Linux的开发人员提供无缝高效的体验。

WSL有两个主要版本：WSL 1和WSL 2。WSL 2是默认的发行版类型，它使用虚拟化技术在轻量级实用工具虚拟机（VM）中运行Linux内核。通过WSL 2运行的Linux发行版将共享同一网络命名空间、设备树、CPU/内核/内存/交换空间等，但有自己的PID命名空间、装载命名空间、用户命名空间等[\[1\]](https://learn.microsoft.com/zh-cn/windows/wsl/about)。

WSL的优势包括：

* 资源消耗较少：相较于虚拟机，WSL作为系统层的一部分，消耗更少的资源，并且与系统更紧密地集成[\[2\]](https://zhuanlan.zhihu.com/p/34885179)。

* 高度兼容性：WSL提供了对Linux内核的支持，使得绝大多数在完整Linux系统中可用的功能和工具都可以在WSL中使用，如Bash shell、命令行工具、编程语言解释器等[\[2\]](https://zhuanlan.zhihu.com/p/34885179)。

* 与Windows应用程序的互操作性：WSL允许用户在同一组文件上使用Windows应用程序和Linux工具，方便开发人员进行跨平台开发[\[2\]](https://zhuanlan.zhihu.com/p/34885179)。

目前，WSL支持多个Linux发行版，包括Ubuntu、Kali Linux、openSUSE等，用户可以在Microsoft Store中下载并安装自己喜欢的发行版[\[3\]](https://zh.wikipedia.org/zh-hans/%E9%80%82%E7%94%A8%E4%BA%8ELinux%E7%9A%84Windows%E5%AD%90%E7%B3%BB%E7%BB%9F)。

总之，WSL为开发人员提供了在Windows环境中运行Linux的便利性和灵活性，使得开发人员可以同时享受Windows和Linux的优势。

## 三. 使用

1. windows上win+s,搜索"功能",找到"启动或关闭windows功能“, 选择 开启`适用于linux的windows子系统` 功能以及`虚拟机平台` 功能

2. 下载或者更新wsl,使用 `wsl --install` 命令,下载更新wsl, 使用`wsl --set-default-version <Version>` 命令切换版本到wsl2,

3. 查看能够下载使用的发行版`wsl --list --online`

4. 下载并启动发行版: `wsl --install -d <发行版本>` ,常用的发行版比如

5. 查看当前可用linux子系统以及该系统使用的wsl版本: `wsl -l -v`

6. 删除某个wsl启动的linux子系统: `wsl --unregister <发行版名称>`

7. 设计wsl开机自启动:

   wsl本身不会开机自启动,但是启动速度快,

   尤其是正在不需要开多个子系统以及本身机器资源丰富的情况下，不需要设置开机自启动

8. 使用指定用户进入指定wsl子系统:`wsl -d <子系统发行版名称> --user <用户名>`

9. wsl中 使用 `sudo hwclock -s` 命令同步时间。有的命令需要时间同步才能执行成功,比如apt-get update

## 四. Q&A


### A. 如何在wsl中 为什么监听777端口提示"bind: permission denied"？如何解决?

1. wsl2中开启服务监听777端口 提示"bind: permission denied"

   在WSL2中，当您尝试监听TCP端口时，出现"bind: permission denied"错误通常是由于权限限制导致的。WSL2默认情况下会限制非特权用户对低于1024的端口进行绑定。

   要解决这个问题，您可以尝试以下方法：

   - 使用高于1024的端口：尝试将要监听的端口更改为大于1024的端口号，例如7777或8888。

   - 使用sudo或管理员权限：在命令前加上sudo或者以管理员身份运行WSL2终端。

2. 修改WSL2的配置文件（仅限高级用户）：您可以修改WSL2的配置文件，以允许非特权用户绑定低于1024的端口。打开/etc/wsl.conf文件（如果不存在则创建），添加以下内容：
   ```
   [network]
   generateResolvConf = false
   bindNonprivilegedPort = true
   保存文件并重启WSL2。
   ```
   请注意，修改WSL2的配置文件需要管理员权限。如果您不熟悉这方面的操作，请谨慎进行，并确保了解所做更改的后果

3. 低于1024的端口有什么特别意义?

   ```
   在计算机网络中，1024以下的端口号被称为"特权端口"（privileged ports）或"系统端口"（well-known ports）。这些端口号在操作系统中具有特殊的意义，并且通常需要具有管理员或root权限才能绑定或使用。

   特权端口用于一些常见的网络服务和协议，例如Web服务器（端口号80）、Secure Shell（SSH，端口号22）、域名系统（DNS，端口号53）等。这些端口号在操作系统中已经被预留，以便于标准化网络通信。

   默认情况下，WSL2和许多其他操作系统会限制非特权用户对特权端口的绑定和使用，这是出于安全考虑。这样可以防止普通用户意外或故意占用或干扰这些关键服务。

   因此，当尝试在WSL2中绑定低于1024的端口时，可能会出现"bind: permission denied"错误，除非您以管理员身份运行WSL2或修改WSL2配置以允许非特权用户绑定这些端口。
   ```

### B. wsl中突然无法访问网络是为什么? 如何解决?

在wsl使用过程中，笔者发现突然所有外部网络都无法访问了，如下尝试ping github.com无法ping通

```shell
❯ ping github.com
ping: connect: Network is unreachable
```

原因不明，重启wsl后解决