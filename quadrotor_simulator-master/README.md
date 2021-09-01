# quadrotor_simulator
FAST Lab 四旋翼飞行器仿真平台

## 1.编译
1. 安装飞机数学仿真的求解器
```
sudo apt-get install libarmadillo-dev
```
2. 把仓库clone下来直接catkin_make即可

## 2.测试1，只启动飞机仿真和一个简单的控制节点
运行
```
./run_simple_drone.sh
```
将启动仿真并看到rviz中的飞机和rqt_graph的各个节点。
在一个新终端中运行一个发送控制指令的示例节点
```
rosrun so3_control control_example
```
即可看到飞机开始飞了，飞行状态打印在终端上。示例节点的代码在src/so3_control/src/control_example.cpp中，/position_cmd是仿真器接收的控制指令消息。

## 3.测试2，启动示例程序，进行轨迹生成和跟踪
运行
```
./run_example.sh
```
可在rqt_graph中看到有更多的节点被启动了，其中/waypoint_generator会生成若干个waypoint，/trajectory_generator_node基于min-snap由waypoint生成一条轨迹，/traj_server将从轨迹上提取每一时刻的状态，转化成控制指令(即/position_cmd)发给仿真器。

随后在rviz中点击上方的“3D Nav Goal按钮”，再在仿真界面上任意位置向下拖动，即可生成轨迹并可以看到飞机跟随轨迹运动。

## 4.使用方式
三个必要模块，分别是 1.轨迹生成 -> 2.traj_server以一定频率发送控制指令 -> 3.飞机仿真。其中前两个模块是需要自己写或者修改的。上方“测试2”包含了这一完整流程。
