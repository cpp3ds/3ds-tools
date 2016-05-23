#!/bin/sh
set -ex

export CC=gcc-4.9
export CXX=g++-4.9

# Build latest 3dsxtool
git clone https://github.com/devkitPro/3dstools.git
cd 3dstools && ./autogen.sh && ./configure && make -j4 && cd -

# Build latest bannertool
git clone https://github.com/Steveice10/bannertool.git --recursive
cd bannertool && make -j4 && cd -

# Get Boost static libs
# Had to rebuild them using later GCC version. It breaks otherwise.
wget https://github.com/cpp3ds/3ds-tools/releases/download/Boost/boost-libs.tar.xz
tar xaf boost-libs.tar.xz

# Build nihstro
git clone https://github.com/neobrain/nihstro.git
cd nihstro && cmake -DBoost_USE_STATIC_LIBS=ON -DBOOST_LIBRARYDIR=$TRAVIS_BUILD_DIR/boost-libs . && make -j4 nihstro-assemble && make -j4 nihstro-disassemble && cd -

# Build makerom
git clone https://github.com/profi200/Project_CTR.git
cd Project_CTR/makerom && make -j4 && cd -
