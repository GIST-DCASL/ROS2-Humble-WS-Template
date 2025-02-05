FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY Container-Setup/ /Setup/
RUN chmod +x /Setup/*

#----------------------------------------------------------
RUN /Setup/Setup-Language.sh && rm -rf /var/lib/apt/lists/*
ENV LANG en_US.UTF-8
#----------------------------------------------------------


#----------------------------------------------------------
RUN /Setup/Setup-Timezone.sh && rm -rf /var/lib/apt/lists/*
#----------------------------------------------------------


#----------------------------------------------------------
RUN /Setup/Install-ROS2-Humble.sh && rm -rf /var/lib/apt/list/*

ENV ROS_DISTRO=humble
ENV AMENT_PREFIX_PATH=/opt/ros/humble
ENV COLCON_PREFIX_PATH=/opt/ros/humble
ENV LD_LIBRARY_PATH=/opt/ros/humble/lib
ENV PATH=/opt/ros/humble/bin:$PATH
ENV PYTHONPATH=/opt/ros/humble/local/lib/python3.10/dist-packages:/opt/ros/humble/lib/python3.10/site-packages
ENV ROS_PYTHON_VERSION=3
ENV ROS_VERSION=2
#----------------------------------------------------------

    
#----------------------------------------------------------
RUN /Setup/Install-DevTools.sh && rm -rf /var/lib/apt/lists/*
#----------------------------------------------------------


#----------------------------------------------------------
RUN apt-get update && apt-get -y upgrade && rm -rf /var/lib/apt/lists/*
#----------------------------------------------------------


#----------------------------------------------------------
ARG USERNAME=DCASL
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN /Setup/Create-User.sh $USERNAME $USER_UID $USER_GID \
    && echo "source /usr/share/bash-completion/completions/git" >> /home/$USERNAME/.bashrc \
    && echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/$USERNAME/.bashrc 

RUN mkdir -p /home/$USERNAME/ros2_ws
#----------------------------------------------------------


#----------------------------------------------------------
RUN mkdir -p /ros2_ws/src
RUN chown -R $USER_UID:$USER_GID /ros2_ws/src
#----------------------------------------------------------


#----------------------------------------------------------
RUN apt-get update \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
#----------------------------------------------------------


#----------------------------------------------------------
COPY Entrypoint/ /Entrypoint/
RUN chmod +x /Entrypoint/*

USER $USERNAME
RUN echo $HOME

WORKDIR /home/$USERNAME
COPY .git-credential[s] ./.git-credentials

ENTRYPOINT [ "/Entrypoint/Entrypoint.sh" ]

# Bash
CMD ["/bin/bash"]