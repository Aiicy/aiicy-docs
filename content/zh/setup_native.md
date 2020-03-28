+++
title = "Native"

date = 2019-06-13
lastmod = 2019-06-13
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.
weight = 11

[menu.docs]
    parent = "setup"
    identifier = "setup_native"
+++

从源码编译安装Aiicy用于开发与测试

## 1.准备环境

### 1.1 Go

编译Aiicy及其模块需要安装并配置好[Go开发环境](https://golang.org/)，推荐`go1.12`及以上版本

### 1.2 Python

运行 `nlu` 等Aiicy自带应用，需要python环境，推荐 python `3.6.8`

推荐使用[pyenv](https://github.com/pyenv/pyenv)和[pyenv-virtualenv](https://github.com/pyenv/pyenv-virtualenv)安装和管理python环境

用`pyenv` 安装 python `3.6.8`：

```bash
pyenv install 3.6.8
```

用`pyenv-virtualenv` 为Aiicy创建python环境：

```bash
pyenv virtualenv 3.6.8 aiicy
```

在终端中启用刚创建的环境：

```bash
# 启用
pyenv activate aiicy
# 停用
#pyenv deactivate aiicy
```

安装python依赖： 

```bash
pip install --upgrade pip # 更新pip
pip install -r requirements.txt # 安装依赖
```

{{% alert note %}}
在使用诸如`tuna`的pip镜像源时，可能找不到某个依赖的对应版本，建议通过官方源安装
{{% /alert %}}

## 2.获取源码

从 [Aiicy GitHub](https://github.com/aiicy/aiicy) 下载Aiicy源码：

```bash
git clone https://github.com/aiicy/aiicy.git
```

## 3.编译并安装

在Aiicy目录下：

```bash
make install MODE=native PREFIX=out
```

这会编译 `aiicy` 及 `aiicy-hub`，`aiicy-function` 等服务模块和Aiicy自带应用

生成的服务模块`二进制文件`保存在 `out/` 目录下，如 linux amd64平台上路径为 `out/linux/amd64`

服务模块的`配置文件`和Aiicy`自带应用`会安装到 `out/var/db/aiicy` 目录下

## 4.获取数据

至此已经完成了Aiicy在native模式下的安装与环境配置，现在获取Aiicy运行所需的数据

{{% button href="dataset_native.md" %}}获取数据{{% /button %}}
