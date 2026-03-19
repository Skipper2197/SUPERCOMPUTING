#!/bin/bash

./scripts/01_download_data.sh
# ./scripts/02_flye_2.9.6_manual_build.sh
./scripts/flye_2.9.6_conda_install.sh

./scripts/03_run_flye_conda.sh
./scripts/03_run_flye_local.sh
./scripts/03_run_flye_module.sh

echo "--- Comparing Log Results ---"
tail -n 10 assemblies/assembly_conda/conda_flye.log
tail -n 10 assemblies/assembly_local/local_flye.log
tail -n 10 assemblies/assembly_module/module_flye.log
