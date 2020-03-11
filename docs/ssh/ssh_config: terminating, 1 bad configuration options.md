
# /etc/ssh/ssh_config: terminating, 1 bad configuration options

## 问题复现

使用`ssh`登录远程服务器，遇到如下问题：

```
$ ssh root@47.240.173.235 -vv
OpenSSH_7.2p2 Ubuntu-4ubuntu2.4, OpenSSL 1.0.2g  1 Mar 2016
debug1: Reading configuration data /etc/ssh/ssh_config
/etc/ssh/ssh_config: line 1: Bad configuration option: maxstartups
debug1: /etc/ssh/ssh_config line 19: Applying options for *
/etc/ssh/ssh_config: terminating, 1 bad configuration options
```

尝试使用`git`克隆远程仓库，也遇到以下问题

```
$ git clone git@47.xxx.xxx.235:/data/repositories/hello.git
Cloning into 'hello'...
/etc/ssh/ssh_config: line 1: Bad configuration option: maxstartups
/etc/ssh/ssh_config: terminating, 1 bad configuration options
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```

## 问题解析

参考：[ssh: Bad configuration option: usedns](https://www.cnblogs.com/minglee/p/11210203.html)

搜索`/etc/ssh/ssh_config`，第一行内容如下：

```
/etc/ssh$ cat ssh_config 
MaxStartups 100
...
```

上面这个命令是为了扩大服务端`ssh`的连接限制而添加的。又搜索了`sshd_config`文件，发现如下内容：

```
$ cat sshd_config | grep Max -i
#MaxStartups 10:30:60
```

所以之前的修改错了，取消`ssh_config`中的修改；将`MaxStartups 30`重新添加到`sshd_config`

```
$ cat sshd_config | grep Max -i
MaxStartups 30
#MaxStartups 10:30:60
```

重启`ssh/sshd`

```
$ sudo systemctl restart ssh
$ sudo systemctl restart sshd
```