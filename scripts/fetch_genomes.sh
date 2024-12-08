#!/usr/bin/env bash

# Allow bash to exit on error.
set -eu

# Use specified mamba environment.
ENV=bioinfo

# Use email to identify to Entrez server.
EMAIL=jgsamson@up.edu.ph

# Output files.
METADATA=data/summary_info.csv
ACCESSIONS=data/accessions.txt
GENOMEDIR=data/genomes

# Expected number of genomes to be downloaded (as of December 8, 2024).
NUM_GENOMES=349

# Retrieve metadata from search output.
function fetch_metadata() {
  micromamba run -n ${ENV} esearch -db assembly -query "African swine fever virus" -email ${EMAIL} |
    micromamba run -n ${ENV} efilter -status latest |
    micromamba run -n ${ENV} esummary |
    micromamba run -n ${ENV} xtract -pattern DocumentSummary -sep "," -element Id,AssemblyAccession,AssemblyName,SeqReleaseDate,AssemblyStatus
}

# Write metadata to file.
function write_metadata() {
  touch ${METADATA}
  fetch_metadata >${METADATA}
}

# Separate assembly ids.
function write_accessions() {
  touch ${ACCESSIONS}
  awk -F ',' '{ print $2 }' ${METADATA} >${ACCESSIONS}
}

function download_genomes() {
  # Download genome assemblies using NCBI's datasets-cli tool.
  micromamba run -n ${ENV} \
    datasets download genome accession --inputfile ${ACCESSIONS} \
    --include genome,protein,gff3,cds --dehydrated --filename "${GENOMEDIR}.zip"

  # Decompress zip file.
  unzip "${GENOMEDIR}.zip" -d ${GENOMEDIR}
  rm -rf "${GENOMEDIR}.zip"

  # Rehydrate genomes.
  datasets rehydrate --directory ${GENOMEDIR}
}

if ! [ -f ${METADATA} ]; then
  write_metadata
fi

if ! [ -f ${ACCESSIONS} ]; then
  write_accessions
fi

if ! [ -d ${GENOMEDIR} ]; then
  echo "${GENOMEDIR} directory not found: downloading assemblies from NCBI"
  download_genomes
  genome_count=$(ls -l ${GENOMEDIR}/ncbi_datasets/data | grep 'GC[AF]' | wc -l)
  echo "Done! Downloaded a total of ${genome_count} genomes"
fi
