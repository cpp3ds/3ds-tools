#!/bin/sh
set -ex

export CC=gcc-4.9
export CXX=g++-4.9

export BOOST_VERSION2=1.55.0
export BOOST_ROOT2="$HOME/boost-build"

# Install Boost
wget https://github.com/cpp3ds/3ds-tools/releases/download/r1/boost-libs.tar.xz
tar xaf boost-libs.tar.xz
#mkdir -p $BOOST_ROOT2
#wget -O boost-trunk.tar.bz2 https://sourceforge.net/projects/boost/files/boost/$BOOST_VERSION2/boost_${BOOST_VERSION2//\./_}.tar.bz2/download
#tar jxf boost-trunk.tar.bz2 --strip-components=1 -C $BOOST_ROOT2
#( cd $BOOST_ROOT2; ./bootstrap.sh --with-libraries=program_options > build.log 2>&1 || cat build.log )
#( cd $BOOST_ROOT2/libs/test; bjam -sTOOLS=gcc49 -sBUILD=boost_unit_test_framework )
#( cd $BOOST_ROOT2; sudo ./b2 threading=multi install )

# Build nihstro
git clone https://github.com/neobrain/nihstro.git
cd nihstro && cmake -DBoost_USE_STATIC_LIBS=ON -DBOOST_LIBRARYDIR=$TRAVIS_BUILD_DIR/boost-libs -DBoost_DEBUG=ON . && VERBOSE=1 make -j4 nihstro-assemble && cd -

# Build makerom (commit 80d3d99)
git clone https://github.com/profi200/Project_CTR.git
cd Project_CTR/makerom && git reset --hard 80d3d99 && make -j4 && cd -

# Build latest 3dsxtool
git clone https://github.com/devkitPro/3dstools.git
cd 3dstools && ./autogen.sh && ./configure && make -j4 && cd -

# Build latest bannertool
git clone https://github.com/Steveice10/bannertool.git
cd bannertool && cmake . && make -j4 && cd -
