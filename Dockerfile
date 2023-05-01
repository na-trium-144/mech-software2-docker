FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y emacs-nox git vim gcc default-jdk make gauche fp-compiler python3 python-is-python3 golang-go golang-mode gfortran gdb swi-prolog-nox racket
# gprologはなんかおかしくなる
WORKDIR /root
RUN mkdir .emacs.d
RUN git clone https://github.com/kawabata/emacs-trr .emacs.d/emacs-trr
COPY init.el .emacs.d/init.el
