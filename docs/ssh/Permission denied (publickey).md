
# Permission denied (publickey)

## 问题描述

使用`Docker Jenkins`，在本地生成私钥，把公钥放置到远程，还是出现了权限错误：

```
$ git ls-remote -h -- git@x48.xx.xx.9:/data/repositories/xxx.git HEAD
Permission denied (publickey).
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
```

## 解决一

参考[[ssh-add]添加私钥缓存](./[ssh-add]添加私钥缓存.md)和[[ssh-agent]代理设置]([ssh-agent]代理设置.md)，使用工具`ssh-agent`设置代理即可

## 解决二

设置私钥文件为`600`权限（**很重要!!!**）