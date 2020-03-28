+++
title = "自定义唤醒词"

date = 2019-06-13
lastmod = 2019-06-23
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.
weight = 40

[menu.docs]
    parent = "advanced"
+++

自定义唤醒Homo时的唤醒词

分别介绍如何创建中文和英文的唤醒词，以及如何本地训练语言模型或使用在线服务训练

## 1. 中文唤醒词

中文唤醒词，是类似 `小草同学`，`小贝同学` 的短语或词

这里假设我们要创建的唤醒词是 `小贝`

### 1.1 创建中文语料

创建文本文件 `xiaobei_online.txt`，写入要创建的中文唤醒词，和发音可能混淆的词（如果拼音相同只记录一个）：

```
小贝
小魏
巧倍
啊
呵呵
哈哈
么么哒
```

### 2.2 在线训练语言模型

在[http://www.speech.cs.cmu.edu/tools/lmtool-new.html](http://www.speech.cs.cmu.edu/tools/lmtool-new.html) 上训练上一步创建的`xiaobei_online.txt`，得到字典文件`*.dic` 和语言模型文件 `*.lm`，下载这两个文件

假设下载得到的文件是 `1234.lm` 和 `1234.dic`

编辑 `1234.dic`，对照字典 `sphinx/cmusphinx-zh-cn-5.2/zh_cn.dic` 中的发音，更改成与其同样格式的内容。原字典中不一定会有相同的词语，有的话，就按照原先的写，没有的话，就按照单个字的发音写：

```
小贝 x i ao b ei
小魏 x i ao w ei
巧倍 q i ao b ei
啊 a as
.
.
.
```

### 2.3 本地训练语言模型

这里不使用在线服务，本地训练语言模型


#### 2.3.1 安装 `CMUCLMTK`

获取源码：

```bash
svn co https://svn.code.sf.net/p/cmusphinx/code/trunk/cmuclmtk/
```

编译安装：

```bash
cd cmuclmtk/
./autogen.sh
make
sudo make install
```

#### 2.3.2 创建中文语料

和在线训练类似，需要创建中文语料文件，示例中文语料在 `sphinx/xiaobei_zh/xiaobei.txt`：

```
<s> 小贝 </s>

<s> 小魏 </s>

<s> 巧倍 </s>

<s> 啊 </s>

<s> 呵呵 </s>

<s> 哈哈 </s>

<s> 么么哒 </s>
```

#### 2.3.3 生成词汇表(vocabulary)文件

```bash
text2wfreq < xiaobei.txt | wfreq2vocab > xiaobei.vocab
```

生成文件`xiaobei.vocab`

#### 2.3.4 生成 arpa格式的语言模型

```bash
text2idngram -vocab xiaobei.vocab -idngram xiaobei.idngram < xiaobei.txt
idngram2lm -vocab_type 0 -idngram xiaobei.idngram -vocab xiaobei.vocab -arpa xiaobei.arpa
```

生成文件 `xiaobei.idngram` 和 `xiaobei.arpa`

#### 2.3.5 转换为 CMU的二进制格式 (DMP)

```bash
sphinx_lm_convert -i xiaobei.arpa -o xiaobei.lm.bin
```

得到的 `xiaobei.lm.bin` 就是我们需要的唤醒词语言模型

#### 2.3.6 创建对应的字典文件

和 [2.2 在线训练语言模型](#2-2-在线训练语言模型) 一样，创建字典文件`xiaobei.dic`：

```
小贝 x i ao b ei
小魏 x i ao w ei
巧倍 q i ao b ei
啊 a as
.
.
.
```

## 2. 中文语音唤醒优化

唤醒词最好用四字短语，如 `小贝同学`

可以用手机语音识别软件测试，如语音识别输入法，对着手机说：`小贝` 和 `小贝同学`，看手机上识别出的结果，可能的结果有：`小为`、`交杯`、`小类`、`小贝`、`小白` 和 `小贝同学`、`小飞同学`、`小薇同学`、`这位同学` 等

记录这些词到中文语料文件 `xiaobei_online.txt`（在线） 或 `xiaobei.txt` 中，重新训练语言模型

在嘈杂的环境中测试，统计识别出最多的结果，假设识别到最多的是 `小为`，把 `小为` 写入唤醒词判断中