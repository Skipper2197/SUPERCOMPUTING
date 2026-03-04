#!/bin/bash
set -euo pipefail

DIR=$1
echo $DIR
cd $DIR

ls -la | wc -l
