#!/bin/sh
set -ex

export RELEASE_FILENAME=3ds-tools-$TRAVIS_OS_NAME-$TRAVIS_TAG.tar.xz
tar -cJvf $RELEASE_FILENAME $OUTDIR
