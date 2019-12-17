#!/bin/bash

HOME="/home/tahmed/Genomics"
SEQUENCING_COVERAGE=$1
PSEUDO_ASSEMBLED_GENOMES="${HOME}/Results/data/Roseobacter/assembled_files/${SEQUENCING_COVERAGE}/"
#---------------------------Create input file for Multi-Spam----------------------
SIMULATED_INPUT="${HOME}/Results/data/Roseobacter/100000_sim_genome_input_${SEQUENCING_COVERAGE}.txt"
SIMULATED_OUTPUT="${HOME}/Results/data/Roseobacter/tree/100000_sampling_sim_genome_output_roseobacter_${SEQUENCING_COVERAGE}.txt"

rm $SIMULATED_INPUT

for f in $PSEUDO_ASSEMBLED_GENOMES*.aln; do
  (
    cat "${f}"
    echo
  ) >>$SIMULATED_INPUT
done
#--------------------------------Multi-spaM input file generation end-------------

#--------------------------------Run multi-spam for simulated data----------------
python3 ../multispam.py -i "${SIMULATED_INPUT}" -t 1 -n 100000 -o $SIMULATED_OUTPUT