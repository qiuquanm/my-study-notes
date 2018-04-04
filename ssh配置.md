## ssh配置

1. 安装 

   ```shell
    sudo apt-get install ssh
   ```


2. 配置 

   ```config
   vim /etc/ssh/sshd_config

   将#PasswordAuthentication no的注释去掉，并且将NO修改为YES

   将PermitRootLogin without-password修改为
   PermitRootLogin yes



   ```



3. 启动服务

   ```shell
   #开启ssh服务
   /etc/init.d/sshd start
   service ssh start

   #查看SSH服务状态是否正常运行，命令为：
   netstat -antulp | grep ssh
   service ssh status 

   #系统自动启动SSH服务
   update-rc.d ssh enable  

   #关闭系统自动启动SSH服务
   update-rc.d ssh disabled 
   ```

4. ​