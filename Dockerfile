FROM ubuntu

RUN apt-get update && apt-get install -y cmake imagemagick libeigen3-dev gfortran libatlas-base-dev file  zlib1g-dev libjpeg-dev libboost-dev git build-essential wget  libgflags-dev freeglut3-dev libxmu-dev libxi-dev


WORKDIR /opt

RUN wget https://google-glog.googlecode.com/files/glog-0.3.3.tar.gz && tar -xzf glog-0.3.3.tar.gz
WORKDIR /opt/glog-0.3.3
RUN ./configure && make && make install

# WORKDIR /opt
# RUN wget http://bitbucket.org/eigen/eigen/get/3.2.7.tar.bz2 && tar xvfj 3.2.7.tar.bz2
# RUN mkdir /opt/eigen-eigen-b30b87236a1b/build
# WORKDIR /opt/eigen-eigen-b30b87236a1b/build
# RUN cmake .. && make install

WORKDIR /opt
RUN wget http://ceres-solver.org/ceres-solver-1.10.0.tar.gz && tar -zxf ceres-solver-1.10.0.tar.gz
WORKDIR /opt/ceres-solver-1.10.0
RUN mkdir -p build && cd build && cmake .. && make -j3  && make install

WORKDIR /opt
RUN wget https://github.com/sweeneychris/TheiaSfM/archive/v0.5.tar.gz && tar xzvf v0.5.tar.gz
WORKDIR /opt/TheiaSfM-0.5/
RUN mkdir /opt/TheiaSfM-0.5/build
WORKDIR /opt/TheiaSfM-0.5/build
RUN cmake .. && make   && make install


CMD /bin/bash
