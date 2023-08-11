#!/usr/bin/env bash

# the SBATCH directives and the module load below are only relevant for the
# Dardel cluster and the PDC Summer School; adapt them for your cluster

#SBATCH --account=edu23.summer
#SBATCH --job-name='ngstools'
#SBATCH --output='ngstools.out'
#SBATCH --time=0-00:02:00
#SBATCH --nodes=1
#SBATCH --partition=shared
#SBATCH --ntasks-per-node=1

module load PDC singularity

set -euf -o pipefail

./ngstools.sif ngsDist
