
# [Ubuntu 16.02]Tomcat9安装

参考：

[Ubuntu16.04安装Tomcat](https://blog.csdn.net/ItJavawfc/article/details/87370956)

[Ubuntu16.04服务器安装tomcat](https://blog.csdn.net/Shezzer/article/details/84074133)

## 预安装

`Tomcat`需要预先安装`JDK`，并设置环境变量

```
export JAVA_HOME=/home/zj/software/java/jdk1.8.0_201
export JRE_HOME=$JAVA_HOME/jre
```

## 下载

当前最新版本：`Tomcat 9.0.27`。下载地址：[Tomcat 9 Software Downloads](https://tomcat.apache.org/download-90.cgi)

## 配置

解压到`/opt`目录下，修改环境变量配置文件`/etc/profile`，增加

```
# Tomcat
export CATALINA_HOME=/opt/apache-tomcat-9.0.27
export CATALINA_BASE=/opt/apache-tomcat-9.0.27
``` 

## 启动

执行文件`/bin/startup.sh`，即可启动`Tomcat`

```
# ./startup.sh 
Using CATALINA_BASE:   /opt/apache-tomcat-9.0.27
Using CATALINA_HOME:   /opt/apache-tomcat-9.0.27
Using CATALINA_TMPDIR: /opt/apache-tomcat-9.0.27/temp
Using JRE_HOME:        /home/zj/software/java/jdk1.8.0_201/jre
Using CLASSPATH:       /opt/apache-tomcat-9.0.27/bin/bootstrap.jar:/opt/apache-tomcat-9.0.27/bin/tomcat-juli.jar
Tomcat started.
```

查询`localhost:8080`是否已被监听

```
# curl localhost:8080
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Apache Tomcat/9.0.27</title>
...
...
```

![](./imgs/tomcat-8080.png)

## 停止

调用脚本`/bin/shutdown.sh`

## 开机自启动

修改文件`/etc/rc.local`

```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

/opt/apache-tomcat-9.0.27/bin/startup.sh

exit 0
```