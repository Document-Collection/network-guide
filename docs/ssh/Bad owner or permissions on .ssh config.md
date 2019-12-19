
# Bad owner or permissions on .ssh config

## 问题复现

```
$ git push origin dev 
Bad owner or permissions on /home/zj/.ssh/config
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

## 问题解决

参考：[Bad owner or permissions on .ssh/config的解决](https://blog.csdn.net/zcc_heu/article/details/79017606)

设置`config`文件权限为`600`即可

```
$ chmod 600 config 
```