#!/bin/sh
set -ex

export RELEASE_FILENAME=3ds-tools-$TRAVIS_OS_NAME-$TRAVIS_TAG.tar.xz
cd ${HOME}
tar -cJvf $RELEASE_FILENAME 3ds-tools
