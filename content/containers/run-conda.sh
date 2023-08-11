#!/usr/bin/env bash

# the SBATCH directives and the module load below are only relevant for the
# Dardel cluster and the PDC Summer School; adapt them for your cluster

#SBATCH --account=edu23.summer
#SBATCH --job-name='conda'
#SBATCH --output='conda.out'
#SBATCH --time=0-00:10:00
#SBATCH --nodes=1
#SBATCH --partition=shared
#SBATCH --ntasks-per-node=1

module load PDC singularity

set -euf -o pipefail

if [ ! -f conda.sif ]; then
    singularity pull https://github.com/bast/singularity-conda/releases/download/0.5.0/conda.sif
fi

./conda.sif python --version
./conda.sif python example.py
