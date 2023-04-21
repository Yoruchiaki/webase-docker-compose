# 基于WebBase的Docker-compose部署方案
# 本项目修改了一些官方的配置项目进行环境变量的支持.
1.构建docker-compose镜像
```shell
docker-compose build --progress plain
```
2.编辑项目中的文件
```text
config/hosts
```
内容应该如下
```text
10.0.200.135 ansible_ssh_private_key_file=/root/.ssh/id_rsa  ansible_ssh_user=root  ansible_ssh_port=22
10.0.200.136 ansible_ssh_private_key_file=/root/.ssh/id_rsa  ansible_ssh_user=root  ansible_ssh_port=22
```
---
请开启root账户的ssh,脚本中包含sudo如果不开启可能会造成异常情况发生,每一个节点都需要添加ip地址和相应的id_rsa
```shell
sudo passwd root
# 设置一个密码
sudo sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
sudo service sshd restart
```
---
3.将ssh信息导入目标节点node(即区块链节点服务器)
```shell
docker-compose exec -u root:root node ssh-copy-id -o StrictHostKeyChecking=no -i /root/.ssh/id_rsa.pub root@[IP]
```
例如服务器访问地址为10.0.200.135,那么我们对应的命令为
```shell
docker-compose exec -u root:root node ssh-copy-id -o StrictHostKeyChecking=no -i /root/.ssh/id_rsa.pub root@10.0.200.135
```
4.测试node-manager能否链接目标节点
```shell
docker-compose exec -u root:root node ansible webase -m ping
```
