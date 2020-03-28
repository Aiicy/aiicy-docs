+++
title = "设计目标"

date = 2020-01-23
lastmod = 2020-01-23
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.
weight = 50

[menu.docs]
    parent = "design"
    identifier = "design_goals"
+++

[Aiicy](https://aiicy.org) (读音 /ˈaɪsi/) 是一个面向物联网与用户终端的模块化自然交互与控制系统

### 模块化

Aiicy 的模块化是要实现安装与管理模块化的应用，如自然交互相关的自然语言理解(NLU)模块，VAD等模块并支持本地托管与离线运行，提供通用的应用接口，方便跨语言的应用开发

hub通过mqtt接入物联网设备，转发并传递消息，并计划实现基于rtsp的流媒体处理

Aiicy 计划实现基于浏览器的交互，并探索更通用，更自然的交互方式