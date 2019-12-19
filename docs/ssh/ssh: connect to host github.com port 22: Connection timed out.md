
# ssh: connect to host github.com port 22: Connection timed out

今天突然无法访问`github`，出现下面问题：

```
$ ssh -vT git@github.com
。。。
ssh: connect to host github.com port 22: Connection timed out
```

参考[ssh: connect to host github.com port 22: Connection timed out](https://stackoverflow.com/questions/15589682/ssh-connect-to-host-github-com-port-22-connection-timed-out)和[Using SSH over the HTTPS port](https://help.github.com/en/articles/using-ssh-over-the-https-port)

新建文件`~/.ssh/config`，添加如下内容：

```
$ cat config 
Host github.com
	Hostname ssh.github.com
	Port 443
```

重新测试成功

```
$ ssh -T git@github.com
Hi zjZSTU! You've successfully authenticated, but GitHub does not provide shell access.
```