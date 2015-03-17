# image used to build odroid c1 mini debian iamge

FROM ubuntu:14.10

RUN apt-get update

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y \
	build-essential \
	wget \
	git \
	lzop \
	u-boot-tools \
	debootstrap \
	parted

RUN dpkg --add-architecture i386
RUN apt-get update

RUN apt-get install -y \
	libc6:i386 \
	libncurses5:i386 \
	libstdc++6:i386 \
	lib32z1 \
	bc


RUN git clone https://github.com/vallettea/debian-mini-odroid-c1.git /odroid
WORKDIR /odroid

