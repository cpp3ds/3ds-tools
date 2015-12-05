#!/bin/sh
set -ex

export RELEASE_FILENAME=3ds-tools-$TRAVIS_OS_NAME-$TRAVIS_TAG.tar.gz
OUTDIR=${HOME}/3ds-tools
mkdir $OUTDIR

cp Project_CTR/makerom/makerom $OUTDIR
cp 3dstools/3dsxtool $OUTDIR
cp bannertool/bannertool $OUTDIR
cp nihstro/nihstro-assemble $OUTDIR
cp nihstro/nihstro-disassemble $OUTDIR

cd ${HOME}
tar -czvf $RELEASE_FILENAME 3ds-tools
