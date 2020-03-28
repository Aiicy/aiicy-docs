+++
title = "Native"

date = 2019-06-13
lastmod = 2019-06-14
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.
weight = 21

[menu.docs]
    parent = "dataset"
    identifier = "dataset_native"
+++

获取Aiicy运行所需的数据

## 1. 自然语言理解部分

### 1.1 中文维基百科MITIE模型

> 来自 [用Rasa NLU构建自己的中文NLU系统 - 羊肉泡馍与糖蒜](http://www.crownpku.com/2017/07/27/%E7%94%A8Rasa_NLU%E6%9E%84%E5%BB%BA%E8%87%AA%E5%B7%B1%E7%9A%84%E4%B8%AD%E6%96%87NLU%E7%B3%BB%E7%BB%9F.html)

Homo 训练自然语言理解模型需要大规模中文语料训练得到的词向量模型，采用中文维基百科作为语料来源，已经训练得到MITIE模型

下载(2018.3.21 | 316.4MB)：[百度网盘](https://pan.baidu.com/s/1kNENvlHLYWZIddmtWJ7Pdg)(提取码：p4vx)

放置到 `homo/nlu/data/rasa/total_word_feature_extractor_chi.dat`

文件校验码(md5)：

```
f6898090ebcd33aa0968f64e237b44ce  total_word_feature_extractor_zh.dat
```

### 1.2 Aiicy预训练NLU模型

下载预训练模型(2019.7.5 | 209.9KB)：[OneDrive](https://onedrive.live.com/embed?cid=EE5D25765B05D616&resid=EE5D25765B05D616%211161&authkey=ACFlUGJicN_sU-0)

文件校验码(md5)：

```
e18b0dc6fb7b4b1fab67f1e912dcdbf2  models-2019-07-05.zip
```

解压到 `homo/nlu/models`

该预训练模型只包含一些示范性的意图和实体识别，要扩展自然语言理解请阅读：[扩展自然语言理解]({{< relref "nlu.md" >}})