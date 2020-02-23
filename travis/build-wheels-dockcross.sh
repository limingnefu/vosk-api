#!/bin/bash
set -e -x

export KALDI_ROOT=/opt/kaldi
export WHEEL_FLAGS=`$CROSS_ROOT/bin/python3-config --cflags`
export PATH=/opt/python/cp3.7-cp3.7m/bin:$PATH
case $CROSS_TRIPLE in
    *armv6*)
        export _PYTHON_HOST_PLATFORM=linux-armv6l
        ;;
    *armv7*)
        export _PYTHON_HOST_PLATFORM=linux-armv7l
        ;;
    *arm64*)
        export _PYTHON_HOST_PLATFORM=linux-arm64
        ;;
esac

pip3 wheel /io/python -w /io/wheelhouse
