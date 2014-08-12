#!/bin/bash
# This test was designed to be run on Ubuntu 13.04,
# but should be generally compatible with any distro.

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install zip -y
sudo apt-get install vim -y
sudo apt-get install timeout -y

mkdir ~/ltc
cd ~/ltc

if [[ "`uname -m`" = "x86_64" ]] ; then
    wget 'http://downloads.sourceforge.net/project/cpuminer/pooler-cpuminer-2.4-linux-x86_64.tar.gz'
    tar -xvf pooler-cpuminer-2.4-linux-x86_64.tar.gz
    rm pooler-cpuminer-2.4-linux-x86_64.tar.gz
    chmod +x minerd
    cat /proc/cpuinfo > 64-bit.txt
else
    wget 'http://downloads.sourceforge.net/project/cpuminer/pooler-cpuminer-2.4-linux-x86.tar.gz'
    tar -xvf pooler-cpuminer-2.4-linux-x86.tar.gz
    rm pooler-cpuminer-2.4-linux-x86.tar.gz
    chmod +x minerd
    cat /proc/cpuinfo > 32-bit.txt
fi


echo "Now running with 1 thread"
timeout 300s ./minerd --benchmark -t 1  2> minerd_01_thread.txt

echo "Now running with 2 threads"
timeout 300s ./minerd --benchmark -t 2  2> minerd_02_thread.txt

echo "Now running with 3 threads"
timeout 300s ./minerd --benchmark -t 3  2> minerd_03_thread.txt

echo "Now running with 4 threads"
timeout 300s ./minerd --benchmark -t 4  2> minerd_04_thread.txt

echo "Now running with 5 threads"
timeout 300s ./minerd --benchmark -t 5  2> minerd_05_thread.txt

echo "Now running with 6 threads"
timeout 300s ./minerd --benchmark -t 6  2> minerd_06_thread.txt

echo "Now running with 7 threads"
timeout 300s ./minerd --benchmark -t 7  2> minerd_07_thread.txt

echo "Now running with 8 threads"
timeout 300s ./minerd --benchmark -t 8  2> minerd_08_thread.txt

echo "Now running with 9 threads"
timeout 300s ./minerd --benchmark -t 9  2> minerd_09_thread.txt

echo "Now running with 10 threads"
timeout 300s ./minerd --benchmark -t 10 2> minerd_10_thread.txt

echo "Now running with 11 threads"
timeout 300s ./minerd --benchmark -t 11 2> minerd_11_thread.txt

echo "Now running with 12 threads"
timeout 300s ./minerd --benchmark -t 12 2> minerd_12_thread.txt

echo "Now running with 13 threads"
timeout 300s ./minerd --benchmark -t 13 2> minerd_13_thread.txt

echo "Now running with 14 threads"
timeout 300s ./minerd --benchmark -t 14 2> minerd_14_thread.txt

echo "Now running with 15 threads"
timeout 300s ./minerd --benchmark -t 15 2> minerd_15_thread.txt

echo "Now running with 16 threads"
timeout 300s ./minerd --benchmark -t 16 2> minerd_16_thread.txt


zip ~/$HOSTNAME-ltc_results.zip *.txt
