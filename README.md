![2021-03-11_09-59-38](https://user-images.githubusercontent.com/3895507/110748305-98f32c00-8250-11eb-9098-75f2c5b89597.png)
<br><br><br>
## 请保证每个节点的名称是唯一的! 本分叉是为一机多节点设计的，兼容docker<br>
<br>


#### 安装监控服务，仅需在主服务器上安装

**Debian:**
```

wget https://github.com/ytx1991/SwarmMonitoring/raw/main/docker/instdeb.sh
chmod +x instdeb.sh
./instdeb.sh
```

**Ubuntu:**
```

wget https://github.com/ytx1991/SwarmMonitoring/raw/main/docker/instubu.sh
chmod +x instubu.sh
./instubu.sh
```
**Centos:**<br>
Maybe later.

**Raspberry Pi**<br>
Never.

Default login/password to Grafana is admin/admin. 

#### 在每个节点服务器上安装脚本
```
mkdir swarm_data_collect && cd swarm_data_collect
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/send.sh
wget https://github.com/ytx1991/SwarmMonitoring/raw/main/run_datacollector.sh
chmod +x send.sh
chmod +x run_datacollector.sh
```

编辑run_datacollector.sh，添加每个在当前服务器上的节点。每行一个节点

```
nohup watch -n 10 "./send.sh http://localhost:8080 bee1 http://localhost:1635" &
```
http://localhost:8080 为监控服务ip

bee1 为节点名称，需唯一

http://localhost:1635  对应节点debug api

具体格式参加内部说明











