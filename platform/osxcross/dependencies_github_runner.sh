#!/bin/bash

apt update -y
apt install -y autoconf libtool \
    bash-completion \
    build-essential \
    git \
    vim \
    cmake \
    curl \
    zip \
    flex bison \
    clang \
    make \
    libssl-dev \
    liblzma-dev \
    libxml2-dev \
    libz-dev \
    libbz2-dev \
    cpio \
    pkg-config \
    ninja-build

git clone https://github.com/tpoechtrager/osxcross.git

/home/runner/work/csound/csound/osxcross/tools/get_dependencies.sh

OSX_SDK="MacOSX14.0.sdk"
OSX_SDK_URL="https://github.com/joseluisq/macosx-sdks/releases/download/14.0/${OSX_SDK}.tar.xz"

curl -sSL "$OSX_SDK_URL" -o "/home/runner/work/csound/csound/osxcross/tarballs/$OSX_SDK.tar.xz"

UNATTENDED=1 /home/runner/work/csound/csound/osxcross/build_clang.sh
UNATTENDED=1 /home/runner/work/csound/csound/osxcross/build.sh
