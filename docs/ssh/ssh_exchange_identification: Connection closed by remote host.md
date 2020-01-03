# ssh_exchange_identification: Connection closed by remote host

连接远程服务器时，老是连接失败

```
$ ssh -p 12xxx zj@xxx.xxx.xxx -vv
OpenSSH_7.2p2 Ubuntu-4ubuntu2.8, OpenSSL 1.0.2g  1 Mar 2016
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 19: Applying options for *
debug2: resolving "ngrok.zhujian.tech" port 12346
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to ngrok.zhujian.tech [148.70.133.9] port 12346.
debug1: Connection established.
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_rsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_rsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_dsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_dsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_ecdsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_ecdsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_ed25519 type -1
debug1: key_load_public: No such file or directory
debug1: identity file /home/lab305/.ssh/id_ed25519-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.8
ssh_exchange_identification: Connection closed by remote host
```

网上有很多的解答，参考

[ssh问题：ssh_exchange_identification: Connection closed by remote host](https://www.cnblogs.com/gaobo543013306/p/9382867.html)

[大量远程ssh连接请求--造成拒绝服务的问题](https://cloud.tencent.com/developer/article/1055038)

[ssh连接提示 "Connection closed by remote host"](https://blog.csdn.net/mjm26/article/details/52242398/)

当前我的问题则是服务器没有装`openssh-server`

```
$ sudo apt install openssh-server
```