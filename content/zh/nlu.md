+++
title = "扩展自然语言理解"

date = 2019-06-24
lastmod = 2019-07-05
toc = true  # Show table of contents? true/false
type = "docs"  # Do not modify.
weight = 41

[menu.docs]
    parent = "advanced"
+++

扩展Homo能理解的自然语言的范围

# 1. 术语解释

* `意图`：一句话的意思，目的。如 “你好” 的意图是 `问候`
* `实体`：一个词或短语，多为语句中的关键词。如 “今天天气不错” 包含实体 `今天` 和 `天气`，`今天` 表示时间，`天气` 表示一种事物。

# 2. 添加原始训练数据

`nlu/data/rasa/raw_data.txt` 为Homo自带的原始示例训练数据，格式如下：

```
text,intent
现在几点了|inform_time
几点了|inform_time
你叫什么名字|ask_name
你叫什么|ask_name

text,intent,food
我想吃火锅啊|restaurant_search|火锅
找个吃拉面的店|restaurant_search|拉面
```

每段第一行为接下来的数据格式，段之间用换行符(回车)隔开

* `text` 为 `文本`，`intent` 为 `文本` 对应的 `意图`

* `food` 为 `实体` 所属分类的代号，与 `文本` 中的 `实体` 一一对应

如 "我想吃火锅啊" 的文本 `text` 为 `我想吃火锅啊` 

对应的意图 `intent` 为 `restaurant_search`，即 `搜索饭店` 

实体 `火锅` 所属分类代号为 `food`，即 `食物`

# 3. 生成训练数据

原始训练数据的格式方便人进行理解和编辑，这一步根据原始训练数据生成训练数据

运行 `nlu/` 下的脚本 `gen_nlu.sh`：

```bash
cd nlu
./gen_nlu.sh
```
或直接运行python脚本：

```bash
cd nlu
python -m scripts.trainsfer_raw_to_rasa
```

生成训练数据在`nlu/data/train_nlu/train_file.json`

# 4. 训练自然语言理解模型

根据之前扩展的训练数据训练自然语言理解模型

运行 `nlu/` 下的脚本 `train_nlu.sh`：

```bash
cd nlu
./train_nlu.sh
```

或直接运行：

```bash
cd nlu
rm -rf models/rasa/ini
python -m rasa_nlu.train \
       -c configs/rasa/config_jieba_mitie_sklearn.yml \
       --data data/rasa/train_file_new.json \
       --project rasa \
       --fixed_model_name ini \
       --path models
```

* `-c`：配置文件，包括使用的MITIE模型和生成的模型文件
* `--data`：用来做意图识别和实体识别的训练数据的示例数据，即之前扩展的训练数据
* `--project`：生成的模型上层目录名
* `--fixed_model_name`：生成的模型文件名
* `--path`：生成的模型文件存放的路径

训练自然语言理解模型成功后，Homo会使用新训练的模型