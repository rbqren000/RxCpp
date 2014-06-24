#!/bin/sh

set -e

#if OS is linux or is not set
if [ "$TRAVIS_OS_NAME" = linux -o -z "$TRAVIS_OS_NAME" ]; then
    wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key|sudo apt-key add -
    sudo add-apt-repository -y 'deb http://llvm.org/apt/precise/ llvm-toolchain-precise main'
    sudo add-apt-repository -y ppa:28msec/utils # Recent cmake
    sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test # gcc-4.8 backport for clang-3.5
    sudo apt-get clean
    sudo apt-get update
    sudo apt-get install -q --fix-missing clang-3.5 cmake libssl-dev
#libstdc++6

elif [ "$TRAVIS_OS_NAME" = osx ]; then
    xcode-select --install
    brew update
    brew install cmake
fi