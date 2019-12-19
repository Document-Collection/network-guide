
# [ssh-copy-id]复制公钥到远程服务器

创建密钥后，需要添加公钥内容追加到远程服务器的`authorized_keys`文件

创建密码参考：[[ssh]生成密钥](https://zj-git-guide.readthedocs.io/zh_CN/latest/authentication/[ssh]%E7%94%9F%E6%88%90%E5%AF%86%E9%92%A5.html)

添加到远程服务器有两种方式：

1. 使用命令`ssh-copy-id`
2. 手动复制公钥到远程

## `ssh-copy-id`

命令`ssh-copy-id`使用本地公钥认证远程服务器

```
$ ssh-copy-id -i ~/.ssh/id_rsa.pub lab305@192.168.0.144 
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/zj/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
Received disconnect from 192.168.0.144 port 22:2: Too many authentication failures
Connection to 192.168.0.144 closed by remote host.
```

参数`-i`输入本地公钥文件

本次连接失败，因为服务器设置了认证次数，参考[[Ubuntu 18.04][SSH]Too many authentication failures](https://zj-linux-guide.readthedocs.io/zh_CN/latest/ssh/[Ubuntu%2018.04][SSH]Too%20many%20authentication%20failures.html)

## 手动复制

使用命令`>>`追加到文件末尾

```
$ cat id_rsa.pub >> authorized_keys
```