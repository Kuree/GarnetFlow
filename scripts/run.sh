#!/bin/bash -e

export COREIR_DIR=/GarnetFlow/pycoreir/coreir-cpp
export OUTPUT_REDIRECTION=""
export USE_CXX11_ABI=0

# add Genesis to the path
export GENESIS_HOME=/GarnetFlow/Genesis2/Genesis2Tools
export PATH=$GENESIS_HOME/bin:$GENESIS_HOME/gui/bin:$PATH
export PERL5LIB=$GENESIS_HOME/PerlLibs/ExtrasForOldPerlDistributions:$PERL5LIB

# build CGRA
make garnet_verilog

# build apps
make pointwise
make gaussian
