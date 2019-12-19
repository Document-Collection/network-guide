
# [SSH]远程连接

参考：

[SSH](https://help.ubuntu.com/community/SSH)

[OpenSSH Server](https://help.ubuntu.com/lts/serverguide/openssh-server.html.en)

[OpenSSH](https://baike.baidu.com/item/OpenSSH)

`SSH`(`Secure Shell`)是一个远程访问和数据传输的安全协议，其相比与`TELNET`等协议，它能够加密用户密码和数据，保证安全传输

`OpenSSH`是基于`SSH`协议实现的开源软件，包括了`ssh`(远程连接)、`scp`(远程传输)等等工具

## 安装

查看当前是否已运行`ssh`

    $ ps -aux | grep ssh

安装客户端

    sudo apt-get install openssh-client

安装服务端

    sudo apt-get install openssh-server

## 配置文件

参考：[How to Enable SSH on Ubuntu (18.04, 17.04, 16.04, 14.04 etc.)](https://thishosting.rocks/how-to-enable-ssh-on-ubuntu/)

系统配置文件在路径`/etc/ssh`文件夹下

    # 客户端配置
    ssh_config
    # 服务器设置
    sshd_config

里面列出了一些默认配置信息，比如使用端口号为`22`

也可以在用户路径下`~/.ssh/`新建配置文件`config`

如果修改配置文件需要重启服务

    $ sudo service ssh restart
    # 或
    $ sudo systemctl restart ssh

## 远程连接

参考：

[How To Use SSH to Connect to a Remote Server in Ubuntu ](https://www.digitalocean.com/community/tutorials/how-to-use-ssh-to-connect-to-a-remote-server-in-ubuntu)

使用`ssh`命令进行远程连接

    $ ssh
    usage: ssh [-1246AaCfGgKkMNnqsTtVvXxYy] [-b bind_address] [-c cipher_spec]
            [-D [bind_address:]port] [-E log_file] [-e escape_char]
            [-F configfile] [-I pkcs11] [-i identity_file] [-L address]
            [-l login_name] [-m mac_spec] [-O ctl_cmd] [-o option] [-p port]
            [-Q query_option] [-R address] [-S ctl_path] [-W host:port]
            [-w local_tun[:remote_tun]] [user@]hostname [command]

### 密码连接

最简单的连接格式，输入登录名和主机地址，然后输入登录密码即可

    ssh user@hostname
    
指定端口号

    ssh -p port [user@]hostname 

指定登录名

    ssh -l login_name hostname

#### 禁止密码连接

参考：[Disable Password Authentication](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring#disable-password-authentication)

### 密钥连接

参考：

[SSH/OpenSSH/Keys](https://help.ubuntu.com/community/SSH/OpenSSH/Keys)

首先本地生成公钥和私钥，参考[[SSH]生成密钥](./[SSH]生成密钥.md)

    $ ssh-keygen -t rsa -b 4096 -C "132.232.142.219" -f ~/.ssh/tencent_id_rsa
    Generating public/private rsa key pair.
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /home/zj/.ssh/tencent_id_rsa.
    Your public key has been saved in /home/zj/.ssh/tencent_id_rsa.pub.
    The key fingerprint is:
    SHA256:VJGQlDH
    ...
    ...

有两种方法将公钥传输到远程服务器

1. 使用命令`ssh-copy-id`

        ssh-copy-id <username>@<host>

2. 复制公钥到服务器`authorized_keys`文件

        $ pwd
        /home/ubuntu/.ssh
        $ file authorized_keys 
        authorized_keys: OpenSSH RSA public key

如果没有`authorized_keys`文件就新建，将公钥内容复制到上面

## `agent refused operation Permission denied (publickey) Error`

参考：[git使用错误记录及解决](https://segmentfault.com/a/1190000008733238)

私钥没有添加到缓存

    $ eval "$(ssh-agent -s)"
    $ ssh-add 指定私钥文件

## `known_hosts`

参考：[What is the difference between authorized_keys and known_hosts file for SSH?](https://security.stackexchange.com/questions/20706/what-is-the-difference-between-authorized-keys-and-known-hosts-file-for-ssh)

`known_hosts`存放在`~/.ssh`文件夹内，用于保存已连接过的服务器公钥，其目的是确保服务器连接的安全性，第一次连接时需要会询问你是否添加到

搜索已经连接过的服务器公钥

    $ ssh-keygen -F hostname [-f known_hosts_file] [-l]

    $ ssh-keygen -F 132.232.142.219
    # Host 132.232.142.219 found: line 10 
    |1|pi+zsVaxd0uefX2luX9dfHymHok=|HIEJX3xNsPOqV31fvg3nIfRkfmE= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItb...

当服务器重装后，会生成新的服务器公钥，需要删除客户端当前公钥然后重新设置

    # 错误消息
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    @    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
    Someone could be eavesdropping on you right now (man-in-the-middle attack)!
    It is also possible that a host key has just been changed.
    The fingerprint for the ECDSA key sent by the remote host is
    SHA256:8eHlAUPZtTc6WT+dXP4RHYw7fO8hO4lpzOH89hPUOR8.
    Please contact your system administrator.
    Add correct host key in /home/zj/.ssh/known_hosts to get rid of this message.
    Offending ECDSA key in /home/zj/.ssh/known_hosts:10
    remove with:
    ssh-keygen -f "/home/zj/.ssh/known_hosts" -R 132.232.142.219
    ECDSA host key for 132.232.142.219 has changed and you have requested strict checking.
    Host key verification failed.

删除本地存储公钥

    $ ssh-keygen -f "/home/zj/.ssh/known_hosts" -R 132.232.142.219
    # Host 132.232.142.219 found: line 10
    /home/zj/.ssh/known_hosts updated.
    Original contents retained as /home/zj/.ssh/known_hosts.old