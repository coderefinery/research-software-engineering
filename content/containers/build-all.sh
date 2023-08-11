#!/usr/bin/env bash

set -euf -o pipefail

sudo singularity build -F hello.sif hello.def
sudo singularity build -F ngstools.sif ngstools.def
