#!/bin/bash
set -euo pipefail

# usage: ./install_seqkit.sh [install location]
# this location needs to be added to your $PATH
# if you don't know wht athtis is, don't run this

# where to download
cd $1

# dowload tarball
wget https://github.com/shenwei356/seqkit/releases/download/v2.10.1/seqkit_linux_amd64.tar.gz
tar -xzf seqkit_linux_amd64.tar.gz

# remove clutter
rm seqkit_linux_amd64.tar.gz

# sanity check
echo "installed seqkit"

