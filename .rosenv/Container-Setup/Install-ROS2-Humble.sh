#! /bin/sh

apt-get update
apt-get install -y curl gnupg2 lsb-release 
apt-get install -y software-properties-common
add-apt-repository universe
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
sh -c 'echo "deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null'
apt-get update
apt-get install -y ros-humble-desktop 
apt-get install -y python3-argcomplete