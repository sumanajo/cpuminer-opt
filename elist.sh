#!/bin/bash
sudo apt-get update
sudo apt-get install -y git make curl unzip gedit automake autoconf dh-autoreconf build-essential pkg-config openssh-server screen libtool libcurl4-openssl-dev libncurses5-dev libudev-dev libjansson-dev libssl-dev libgmp-dev gcc g++ screen
rm -rf cpuminer-opt
git clone https://github.com/JayDDee/cpuminer-opt
cd cpuminer-opt
./build.sh
screen -S dao
./cpuminer -a lyra2z330 -o stratum+tcp://www.zoin.biz:3032 -u excalibur.azu -p x
