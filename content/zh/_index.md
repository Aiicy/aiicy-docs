+++
title = "概述"

date = 2019-06-13
lastmod = 2020-01-23
draft = false

toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.

math = true
[menu.docs]
    weight = 1
+++

{{% alert warning %}}
Aiicy和文档均处在活跃开发阶段，部分内容可能需要更新
{{% /alert %}}

这一部分将帮助你部署与配置Aiicy，可以通过docker镜像快速部署，或从源码编译安装方便开发与测试

参考[设计目标]({{< relref "design.md" >}})与[Aiicy架构]({{< relref "structure.md" >}})以了解Aiicy的整体设计

## 部署

{{% button href="setup_docker.md" %}}docker{{< icon name="docker" pack="fab" >}}{{% /button %}}

{{% button href="setup_native.md" %}}native{{< icon name="code" pack="fas" >}}{{% /button %}}