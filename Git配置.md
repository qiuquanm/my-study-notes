## Git配置

1.   :octocat:

```sh
   #初始化Git
   git init

   #配置GitHub用户名和邮箱（注册GitHub的邮箱）
   $ git config --global user.name "qiuquanm"
   $ git config --global user.email xxxx@qq.com

   #查看Git配置
   $ git config --list

   #常用命令
   $ git add
   $ git status
   $ git commit 文件  -m "提交这个文件的说明"
   $ git push


 ```

2. Git仓库和GitHub仓库连接
```sh
$ ssh-keygen -t rsa -C "123456@163.com" //你自己注册GitHub的邮箱
```
去用户主目录里找到.ssh文件夹，里面有id_rsa和id_rsa.pub两个文件
这两个就是SSH Key的秘钥对，id_rsa是私钥，不能泄露，id_rsa.pub是公钥，可以公开。

验证是否成功，在git bash里输入下面的命令
```sh
$ ssh -T git@github.com
```
