
# 本仓库不再维护，更新的内容前往：[ZJDoc/Deploy](https://github.com/ZJDoc/Deploy)

# 网络指南

[![Documentation Status](https://readthedocs.org/projects/zj-network-guide/badge/?version=latest)](https://zj-network-guide.readthedocs.io/zh_CN/latest/?badge=latest) [![standard-readme compliant](https://img.shields.io/badge/standard--readme-OK-green.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme) [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-yellow.svg)](https://conventionalcommits.org) [![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

> 计算机网络相关概念、工具

学习计算机网络基础知识以及相关工具

## 内容列表

- [本仓库不再维护，更新的内容前往：ZJDoc/Deploy](#本仓库不再维护更新的内容前往zjdocdeploy)
- [网络指南](#网络指南)
  - [内容列表](#内容列表)
  - [背景](#背景)
  - [安装](#安装)
    - [文档工具安装](#文档工具安装)
  - [用法](#用法)
  - [主要维护人员](#主要维护人员)
  - [参与贡献方式](#参与贡献方式)
  - [许可证](#许可证)

## 背景

计算机网络内容复杂，除了常见的基本概念（比如`IP`，局域网，路由器等）外，还包括了相关工具的配置和使用（比如`nginx`，`ngrok`等）。在生活工作中不太会碰到相关问题，所以经常学完就丢，记录下来以便快速查询和学习

## 安装

### 文档工具安装

```
$ pip install -r requirements.txt
```

## 用法

有两种文档使用方式

1. 在线浏览文档：[网络指南](https://zj-network-guide.readthedocs.io/zh_CN/latest/?badge=latest)

2. 本地浏览文档，实现如下：

    ```
    $ git clone https://github.com/zjZSTU/network-guide.git
    $ cd network-guide
    $ mkdocs serve
    ```
   启动本地服务器后即可登录浏览器`localhost:8000`

## 主要维护人员

* zhujian - *Initial work* - [zjZSTU](https://github.com/zjZSTU)

## 参与贡献方式

欢迎任何人的参与！打开[issue](https://github.com/zjZSTU/git-guide/issues)或提交合并请求。

注意:

* `GIT`提交，请遵守[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.4/)规范
* 语义版本化，请遵守[Semantic Versioning 2.0.0](https://semver.org)规范
* `README`编写，请遵守[standard-readme](https://github.com/RichardLitt/standard-readme)规范

## 许可证

[Apache License 2.0](LICENSE) © 2019 zjZSTU
