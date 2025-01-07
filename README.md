# ROS2 Pendulum Simulation

这是一个基于 ROS2 和 Gazebo 的单摆仿真系统。该系统实现了单摆的物理仿真和基本控制功能。

## 系统架构

### 1. 核心组件
- **URDF 模型** (`src/urdf_tutorial/urdf/pendulum.urdf`): 
  - 定义单摆的物理结构
  - 包含 ros2_control 和 Gazebo 插件配置
  - 设置关节和传动装置

- **控制器配置** (`src/urdf_tutorial/config/pendulum_controllers.yaml`):
  - joint_state_broadcaster: 发布关节状态
  - pendulum_controller: 实现力矩控制

- **启动文件** (`src/urdf_tutorial/launch/gazebo.launch.py`):
  - 加载 Gazebo 仿真环境
  - 启动机器人状态发布器
  - 按序加载和配置控制器

- **控制脚本** (`src/urdf_tutorial/scripts/pendulum_control.py`):
  - 实现周期性冲量控制
  - 提供实时状态监控
  - 支持参数调整

### 2. 可视化工具
- Gazebo: 物理仿真环境
- RViz2: 机器人状态可视化

## 功能特点

1. **物理仿真**:
   - 基于 Gazebo 的真实物理引擎
   - 包含重力和阻尼效应
   - 支持实时力矩控制

2. **控制系统**:
   - 周期性冲量控制策略
   - 可调节的控制参数
   - 实时状态反馈

3. **状态监控**:
   - 关节位置和速度监测
   - 控制命令记录
   - 可视化显示

## 使用方法

### 1. 环境准备
安装依赖
sudo apt install ros-humble-gazebo-ros-pkgs
sudo apt install ros-humble-ros2-control ros-humble-ros2-controllers

### 2. 构建项目
cd /mnt/d/sim_ws
colcon build --packages-select urdf_tutorial
source install/setup.bash

### 3. 启动仿真
./start-gazebo.sh

### 4. 运行控制器
python3 src/urdf_tutorial/scripts/pendulum_control.py

### 5. 启动可视化（可选）
./start-rviz2.sh

## 参数配置

### 控制参数 (pendulum_control.py)
- `impulse_interval`: 冲量间隔时间（默认10.0秒）
- `impulse_magnitude`: 冲量大小（默认50.0）
- `impulse_duration`: 冲量持续时间（默认0.2秒）

## 文件结构
.
├── README.md
├── start-gazebo.sh
├── start-rviz2.sh
└── src/urdf_tutorial/
├── CMakeLists.txt
├── package.xml
├── launch/
│ └── gazebo.launch.py
├── urdf/
│ └── pendulum.urdf
├── config/
│ ├── pendulum_controllers.yaml
│ └── pendulum.rviz
└── scripts/
└── pendulum_control.py

## 注意事项

1. **启动顺序**:
   - 先启动 Gazebo 仿真
   - 等待环境完全加载
   - 再运行控制器脚本

2. **常见问题处理**:
   - 如果控制器未响应，检查控制器状态
   - 如果摆动幅度不足，调整 impulse_magnitude
   - 使用 Ctrl+C 安全停止控制器

## 开发计划

- [ ] 实现 PID 控制器
- [ ] 添加轨迹规划功能
- [ ] 优化参数配置界面
- [ ] 添加数据记录和分析工具

