FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y emacs-nox git
WORKDIR /root
RUN mkdir .emacs.d
RUN git clone https://github.com/kawabata/emacs-trr .emacs.d/emacs-trr
COPY init.el .emacs.d/init.el
