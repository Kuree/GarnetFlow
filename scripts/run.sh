#!/bin/bash -e

export COREIR_DIR=/GarnetFlow/scripts/coreir
export OUTPUT_REDIRECTION=""
export USE_CXX11_ABI=0

if [ -n "$lassen" ];
then
    # people who maintain lassen love one-line commits
    # and file PR before the branch is working.
    # need to setup special tests for them
    export WIDTH=8
    export HEIGHT=6
elif [ -n "$BUILDKITE" ];
then
    export WIDTH=32
    export HEIGHT=16
else
    export WIDTH=8
    export HEIGHT=6
fi

# build CGRA
make garnet_verilog

# build apps
make pointwise
make conv_1_2
make conv_2_1
make scomp
make ucomp
make arith
make ushift
make uminmax

if [ -n "$BUILDKITE" ] && [ -z "$lassen" ];
then
    make conv_3_3
    make gaussian
    make cascade
    make harris
fi
