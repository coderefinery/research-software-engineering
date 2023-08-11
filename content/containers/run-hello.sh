#!/usr/bin/env bash

# the SBATCH directives and the module load below are only relevant for the
# Dardel cluster and the PDC Summer School; adapt them for your cluster

#SBATCH --account=edu23.summer
#SBATCH --job-name='hello'
#SBATCH --output='hello.out'
#SBATCH --time=0-00:02:00
#SBATCH --nodes=1
#SBATCH --partition=shared
#SBATCH --ntasks-per-node=1

module load PDC CMake
module load PDC singularity

set -euf -o pipefail

echo
echo "what is the operating system on the host?"
cat /etc/os-release

echo
echo "what is the CMake version on the host?"
cmake --version

echo
echo "what is the gcc version on the host?"
gcc --version

echo
echo "what is the operating system in the container?"
./hello.sif cat /etc/os-release

echo
echo "what is the CMake version in the container?"
./hello.sif cmake --version

echo
echo "what is the gcc version in the container?"
./hello.sif gcc --version
