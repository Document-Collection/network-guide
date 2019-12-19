
# [SSH]连接卡住

使用`ssh`远程连接卡住，打印详细信息如下：

```
。。。
。。。
debug1: SSH2_MSG_KEXINIT sent
debug1: SSH2_MSG_KEXINIT received
debug1: kex: algorithm: curve25519-sha256@libssh.org
debug1: kex: host key algorithm: ecdsa-sha2-nistp256
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
```

解决方法是重新删除`~/.ssh/known_hosts`保存的服务器公钥

```
$ ssh-keygen -f "/home/zj/.ssh/known_hosts" -R 207.xxx.xx.97
```