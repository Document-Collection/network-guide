
# [SSH]客户端连接一段时间后卡死问题解决

在`Ubuntu`下经常需要通过`SSH`进行远程连接，使用过程中往往会遇到一个问题，就是命令行窗口在经过一段时间后就会卡死，无法输入命令

参考：

[连接远程ssh老是掉线解决办法](https://blog.csdn.net/qq_39846820/article/details/103371782)

[Linux下ssh连接时间过长客户端卡死问题](https://blog.csdn.net/zhangwei_2010/article/details/105239604)

其解决方案是通过定时发送心跳响应，保证客户端和服务器之间的连接

## 修改客户端

在客户端上修改文件`/etc/ssh/ssh_config`，添加如下内容：

```
# 添加
ServerAliveInterval 20
ServerAliveCountMax 999
```

每隔`20s`向服务器发送一次心跳；若超过`999`次请求都没有发送成功，则主动断开与服务器端的连接

## 修改服务端

在服务器上修改文件`/etc/ssh/sshd_config`，添加如下内容：

```
# 添加
ClientAliveInterval 30
ClientAliveCountMax 10
```

每隔`30s`向客户端发送一次心跳；若超过`10`次请求都没有发送成功，则主动断开与客户端的连接

## 更新

可同时修复上述两项配置文件，完成后重启`ssh`服务

```
# 重启客户端
$ sudo systemctl restart ssh
# 重启服务端
$ sudo systemctl restart sshd
```