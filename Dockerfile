FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y wget gnupg && \
	sh -c 'echo "deb http://packages.ros.org/ros/ubuntu focal main" > \
		/etc/apt/sources.list.d/ros-latest.list' && \
	wget http://packages.ros.org/ros.key -O - | apt-key add - && \
	apt-get update && \
	apt-get install -y emacs-nox git vim gcc default-jdk make gauche fp-compiler \
		python3 python-is-python3 golang-go golang-mode gfortran gdb swi-prolog-nox racket \
		ros-noetic-desktop-full python3-rosdep python3-wstool python3-catkin-tools \
		ros-noetic-jskeus rlwrap && \
	bash -c "source /opt/ros/noetic/setup.sh && rosdep init && rosdep update"
# gprologはなんかおかしくなる
WORKDIR /root
RUN mkdir .emacs.d && \
	git clone https://github.com/kawabata/emacs-trr .emacs.d/emacs-trr
COPY init.el .emacs.d/init.el
