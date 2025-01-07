#!/bin/bash

# 查找并终止任何正在运行的 Gazebo 进程
echo "Checking for running Gazebo processes..."
GZ_PIDS=$(pgrep gzserver)
if [ -n "$GZ_PIDS" ]; then
  echo "Found running Gazebo processes with PIDs: $GZ_PIDS"
  echo "Killing Gazebo processes..."
  kill -9 $GZ_PIDS
  echo "Gazebo processes terminated."
else
  echo "No running Gazebo processes found."
fi

# 确保环境变量正确设置
source /opt/ros/humble/setup.bash
source /mnt/d/sim_ws/install/setup.bash

# 进入工作目录
cd /mnt/d/sim_ws/src/urdf_tutorial/ || exit 1

# 禁用音频
#export SDL_AUDIODRIVER=alsa
#echo "SDL_AUDIODRIVER set to: $SDL_AUDIODRIVER"

# 启动 Gazebo 仿真
ros2 launch urdf_tutorial gazebo.launch.py model:=/mnt/d/sim_ws/src/urdf_tutorial/urdf/pendulum.urdf
