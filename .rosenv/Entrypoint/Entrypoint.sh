#!/bin/bash

read -p 'Good Day!'

sudo ln -s /ros2_ws/src $HOME/ros2_ws

if [[ ! $(git config user.name) ]]; then
    read -p 'Insert your Github Name: ' user_name
    read -p 'Insert your Email: ' user_email

    git config --global user.name "$user_name"
    git config --global user.email "$user_email"
fi

if [ ! -f $HOME/.git-credentials ]; then
    read -p 'Insert token: ' git_token

    echo "https://$user_name:$git_token@github.com" >> $HOME/.git-credentials
    git config --global credential.helper store
fi

./ROS_Entrypoint.sh

exec "$@"