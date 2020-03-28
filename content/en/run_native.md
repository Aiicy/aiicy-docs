+++
title = "Native"

date = 2019-06-14
lastmod = 2019-06-14
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.
weight = 22

[menu.docs]
    parent = "run"
    identifier = "run_native"
+++

## 1.运行

进入Aiicy根目录，启用python环境并运行：

```bash
# 启用python环境
pyenv activate aiicy
# 运行
./out/bin/aiicy start # Ctrl+c 退出
```

输出：

```
2020-02-06 15:20:45.034 INFO    master/master.go:60     mode: native; grace: 30000000000; pwd: /home/codist/data/Aiicy/out; api: unix://var/run/aiicy.sock      {"aiicy": "master"}
2020-02-06 15:20:45.034 INFO    master/master.go:72     engine started  {"aiicy": "master"}
2020-02-06 15:20:45.044 INFO    master/master.go:84     db inited       {"aiicy": "master"}
2020-02-06 15:20:45.044 INFO    api/server.go:85        api server is listening at: unix://var/run/aiicy/api.sock
2020-02-06 15:20:45.044 INFO    master/master.go:97     api server started      {"aiicy": "master"}
2020-02-06 15:20:45.044 INFO    master/master.go:104    server started  {"aiicy": "master"}
```

以 `native` 模式部署Aiicy时，除安装系统依赖(`pyenv` 和 `pyenv-virtualenv`等)，不需要使用 `root` 权限

避免在安装或运行过程使用 `root` 权限，防止文件权限被修改

## 2.测试

### 2.1MQTT连接测试

通过 `mqtt` 测试Aiicy自带应用是否已经配置好，`mqtt` 客户端建议使用 [MQTT.fx](https://mqttfx.jensd.de/index.php/download)

`Extras` -> `Edit Connections Profiles` 编辑连接，如图

{{< figure library="true" src="mqtt_connect.png" title="编辑连接" lightbox="true" >}}

点击 `Generate` 生成一个id，使用用户验证(`User Credentials`)，用户名和密码见配置文件

连接(`Connect`)到刚才编辑的配置，订阅 `t/nlu` 和 `t/py3hi`，如图

{{< figure library="true" src="mqtt_subscribe.png" title="订阅" lightbox="true" >}}

发送任意数据到 `t`，如图

{{< figure library="true" src="mqtt_publish.png" title="发送数据" lightbox="true" >}}

订阅界面会收到相应响应数据，证明 `aiicy-function` 服务正常加载了Aiicy自带的 `nlu` 应用

{{< figure library="true" src="mqtt_res.png" title="响应" lightbox="true" >}}