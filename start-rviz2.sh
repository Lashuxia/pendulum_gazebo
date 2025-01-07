#!/bin/bash

# 确保环境变量正确设置
source /opt/ros/humble/setup.bash
source /mnt/d/sim_ws/install/setup.bash

# 修复权限问题
sudo chmod 700 /run/user/1000 2>/dev/null || true

# 启动 RViz2 并加载配置
ros2 run rviz2 rviz2 -d $(ros2 pkg prefix urdf_tutorial)/share/urdf_tutorial/config/pendulum.rviz