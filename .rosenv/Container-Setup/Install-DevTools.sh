#! /bin/sh

apt-get update
apt-get install -y bash-completion 
apt-get install -y git
apt-get install -y build-essential cmake gdb
apt-get install -y python3-vcstool python3-pip
apt-get install -y wget
apt-get install -y vi vim nano
apt-get install -y htop
apt-get install -y dpkg-dev debhelper

apt-get install -y python3-colcon-common-extensions
apt-get install -y python3-colcon-mixin
apt-get install -y python3-rosdep
