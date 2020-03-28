+++
title = "Aiicy架构"

date = 2020-01-23
lastmod = 2020-01-23
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.
weight = 51

[menu.docs]
    parent = "design"
+++

Aiicy 总体为三层，架构图如下图所示，`灰色`表示还在计划或开发中

## 服务管理层(master)

* docker：通过docker容器运行服务

* native：运行服务相关可执行文件

服务管理层用于启动和管理各服务，支持以docker容器的方式或直接运行可执行文件方式启动和管理服务

{{< figure library="true" src="design_cn.png" title="架构图" lightbox="true" >}}

## 服务层

* `aiicy-function`：运行并管理函数运行实例

    * `aiicy-function-python3`：提供 `python3` grpc 服务调用支持

* `aiicy-hub`：消息路由，传递消息

    * `MQTT`：提供对 `mqtt` 协议支持
    * `TCP(SSL)`：支持 `TCP` 和 `TCP + SSL`
    * `Websocket`：支持 `Websocket` 和 `Websocket + SSL`

服务层的各服务用于为应用层提供支持，`aiicy-function` 根据配置文件启用应用层各功能模块；`aiicy-hub` 为Aiicy服务与嵌入式硬件交互，各功能模块间交互以及功能模块与Aiicy底层交互提供消息路由；媒体流服务接收并处理来自浏览器或嵌入式设备等的音频、视频流。

## 应用层

* `NLU`：提供离线自然语言理解功能，传入自然语言文本，进行文本意图分析，文本关键词提取以及关键词分类