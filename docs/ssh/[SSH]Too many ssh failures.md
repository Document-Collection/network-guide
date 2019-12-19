
# [SSH]Too many ssh failures

昨天不小心删除了`ubuntu`用户，导致系统无法登录

今天重装了系统，使用公共镜像`Ubuntu 18.04`，重装完成后进行登录发现如下错误

    $ ssh ubuntu@132.232.142.219
    Received disconnect from 132.232.142.219 port 22:2: Too many authentication failures
    Connection to 132.232.142.219 closed by remote host.
    Connection to 132.232.142.219 closed.

## 解决

先到控制台的云服务器页面，选择左侧的`SSH`密钥选项，删除之前设置的密钥

然后关闭实例，重新设置密钥，输入本地的公钥内容，再次启动实例后就能够登录了

## 调试

使用参数`-v`能够打印出登录进度的调试信息

    $ ssh -v ubuntu@132.232.142.219
    OpenSSH_7.2p2 Ubuntu-4ubuntu2.7, OpenSSL 1.0.2g  1 Mar 2016
    debug1: Reading configuration data /etc/ssh/ssh_config
    debug1: /etc/ssh/ssh_config line 19: Applying options for *
    debug1: Connecting to 132.232.142.219 [132.232.142.219] port 22.
    debug1: Connection established.
    debug1: identity file /home/zj/.ssh/id_rsa type 1
    debug1: key_load_public: No such file or directory
    debug1: identity file /home/zj/.ssh/id_rsa-cert type -1
    debug1: key_load_public: No such file or directory
    debug1: identity file /home/zj/.ssh/id_dsa type -1
    debug1: key_load_public: No such file or directory
    debug1: identity file /home/zj/.ssh/id_dsa-cert type -1
    debug1: key_load_public: No such file or directory
    debug1: identity file /home/zj/.ssh/id_ecdsa type -1
    debug1: key_load_public: No such file or directory
    debug1: identity file /home/zj/.ssh/id_ecdsa-cert type -1
    debug1: key_load_public: No such file or directory
    debug1: identity file /home/zj/.ssh/id_ed25519 type -1
    debug1: key_load_public: No such file or directory
    debug1: identity file /home/zj/.ssh/id_ed25519-cert type -1
    debug1: Enabling compatibility mode for protocol 2.0
    debug1: Local version string SSH-2.0-OpenSSH_7.2p2 Ubuntu-4ubuntu2.7
    debug1: Remote protocol version 2.0, remote software version OpenSSH_7.6p1 Ubuntu-4
    debug1: match: OpenSSH_7.6p1 Ubuntu-4 pat OpenSSH* compat 0x04000000
    debug1: Authenticating to 132.232.142.219:22 as 'ubuntu'
    debug1: SSH2_MSG_KEXINIT sent
    debug1: SSH2_MSG_KEXINIT received
    debug1: kex: algorithm: curve25519-sha256@libssh.org
    debug1: kex: host key algorithm: ecdsa-sha2-nistp256
    debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
    debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <implicit> compression: none
    debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
    debug1: Server host key: ecdsa-sha2-nistp256 SHA256:Jo/TLQ//NbUA3Sg3iZy3glGFLpf26BJtUOmBNMOtfdo
    debug1: Host '132.232.142.219' is known and matches the ECDSA host key.
    debug1: Found key in /home/zj/.ssh/known_hosts:12
    debug1: rekey after 134217728 blocks
    debug1: SSH2_MSG_NEWKEYS sent
    debug1: expecting SSH2_MSG_NEWKEYS
    debug1: SSH2_MSG_NEWKEYS received
    debug1: rekey after 134217728 blocks
    debug1: SSH2_MSG_EXT_INFO received
    debug1: kex_input_ext_info: server-sig-algs=<ssh-ed25519,ssh-rsa,rsa-sha2-256,rsa-sha2-512,ssh-dss,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521>
    debug1: SSH2_MSG_SERVICE_ACCEPT received
    debug1: Authentications that can continue: publickey
    debug1: Next authentication method: publickey
    debug1: Offering RSA public key: /home/zj/.ssh/id_rsa
    debug1: Authentications that can continue: publickey
    debug1: Offering RSA public key: gitee.com
    debug1: Authentications that can continue: publickey
    debug1: Offering RSA public key: github.com
    debug1: Authentications that can continue: publickey
    debug1: Offering RSA public key: zj@zj-ThinkPad-T470p
    debug1: Authentications that can continue: publickey
    debug1: Offering RSA public key: coding.com
    debug1: Authentications that can continue: publickey
    debug1: Offering RSA public key: zj@zj-ThinkPad-T470p
    debug1: Server accepts key: pkalg rsa-sha2-512 blen 279
    debug1: Authentication succeeded (publickey).
    Authenticated to 132.232.142.219 ([132.232.142.219]:22).
    ...
    ...

上述调试信息是修改后的认证成功信息，可以看出`ssh`会遍历`~/.ssh`目录下的私钥文件，所以最开始的`Too many authentication failures`表明服务器端设置了认证的次数，可以通过配置文件修改

    $ cat /etc/ssh/sshd_config  | grep MaxAuth
    #MaxAuthTries 6

## 配置

比如修改`ssh`服务端配置文件`/etc/ssh/sshd_config`，设置认证次数为`100`次，然后重启服务端即可

```
$ sudo vim /etc/ssh/sshd_config
MaxAuthTries 100
$ service sshd restart
```