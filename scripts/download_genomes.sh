#!/usr/bin/env bash

# Verbosely print commands and stop on error.
set -uex

# Add helper functions to namespace.
source ./helpers.sh

# Check if micromamba env exists, if not install locally.
env=watata
if [ "$(check_env ${env})" -eq 1 ]; then
  install_mamba_env ${env}
fi

micromamba run -n bioinfo esearch -db assembly -query "African swine fever virus" |
  micromamba run -n bioinfo esummary |
  micromamba run -n bioinfo xtract -pattern DocumentSummary -sep "," -element AssemblyAccession,AssemblyStatus |
  grep "Complete Genome" | awk -F, '{ print $1 }' |
  micromamba run -n bioinfo \
    datasets download genome accession --inputfile - --include genome --filename genomes.zip
