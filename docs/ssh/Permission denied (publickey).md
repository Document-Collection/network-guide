
# Permission denied (publickey)

## 问题描述

使用`Docker Jenkins`，在本地生成私钥，把公钥放置到远程，还是出现了权限错误：

```
Permission denied (publickey).
```

## 解决

参考[[ssh-add]添加私钥缓存](./[ssh-add]添加私钥缓存.md)和[[ssh-agent]代理设置]([ssh-agent]代理设置.md)，使用工具`ssh-agent`设置代理即可