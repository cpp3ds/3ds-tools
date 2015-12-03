#!/bin/sh
set -ex

export CC=gcc-4.9
export CXX=g++-4.9

export OUTDIR=${HOME}/3ds-tools
mkdir $OUTDIR

# Build makerom (commit 80d3d99)
git clone https://github.com/profi200/Project_CTR.git
cd Project_CTR/makerom && git reset --hard 80d3d99 && make -j4 && cp makerom $OUTDIR && cd -

# Build latest 3dsxtool
git clone https://github.com/devkitPro/3dstools.git
cd 3dstools && ./autogen.sh && ./configure && make -j4 && cp 3dsxtool $OUTDIR && cd -

# Build latest bannertool
git clone https://github.com/Steveice10/bannertool.git
cd bannertool && cmake . && make -j4 && cp bannertool $OUTDIR && cd -

# Build nihstro
git clone https://github.com/neobrain/nihstro.git
cd nihstro && cmake . && make -j4 && cp nihstro-assemble $OUTDIR && cd -
