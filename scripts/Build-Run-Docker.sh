#!/bin/bash

IMAGE=ros2-humble

docker build -t $IMAGE:base .rosenv

docker run -it \
    --net=host \
    -e DISPLAY=$DISPLAY \
    --env="QT_X11_NO_MITSHM=1" \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v $PWD/src:/ros2_ws/src \
    --name $1 $IMAGE 

