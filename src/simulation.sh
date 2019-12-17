#!/bin/bash
#---------------------------Start generating simulated data----------------------

echo "Running experiment for sequencing coverage $1"
HOME="/home/tahmed/Genomics/"
ART="${HOME}art_bin_MountRainier/art_illumina"

READ_SPAM_DIRECTORY="${HOME}Read-SpaM/"
SEQUENCING_COVERAGE=$1
DATASET="${HOME}Results/data/Roseobacter/ref_seq/"

SIMULATED_DATA="${HOME}Results/data/Roseobacter/sim_seq/${SEQUENCING_COVERAGE}/"
READ_SPAM_INPUT="${HOME}Results/data/Roseobacter/read_spam_input/${SEQUENCING_COVERAGE}/"

rm -Rf "${SIMULATED_DATA}"
mkdir "${SIMULATED_DATA}"

rm -Rf "${READ_SPAM_INPUT}"
mkdir "${READ_SPAM_INPUT}"


#generation_sequencing_coverage=$(((2^0)/(2^$SEQUENCING_COVERAGE)))

generation_sequencing_coverage=$(bc<<<"scale=4;2^0/2^$SEQUENCING_COVERAGE")
echo $generation_sequencing_coverage

for f in $DATASET*.fasta; do # run art simulator for each of the genome file
#  name=$(basename "${f}" ".txt")
  name=$(basename "${f}" ".fasta")
  genome_directory=$SIMULATED_DATA$name

  if [ -d $genome_directory ]; then
    rm -Rf $genome_directory
  fi

  mkdir $genome_directory

  $ART -ss HS25 -i "${f}" -o "${genome_directory}/${name}" -l 150 -f "${generation_sequencing_coverage}" -k 0
  cp "${genome_directory}/${name}.aln" $READ_SPAM_INPUT
done
#------------------------END Data Simulation---------------------------------

#------------------------Concat Reads Using read-spam-------------------------------
rm "${HOME}/Results/data/Roseobacter/filelist_${SEQUENCING_COVERAGE}.txt"
ls $READ_SPAM_INPUT* >"${HOME}/Results/data/Roseobacter/filelist_${SEQUENCING_COVERAGE}.txt"
PSEUDO_ASSEMBLED_GENOMES="${HOME}/Results/data/Roseobacter/assembled_files/${SEQUENCING_COVERAGE}/"
rm -Rf $PSEUDO_ASSEMBLED_GENOMES
mkdir $PSEUDO_ASSEMBLED_GENOMES

echo "Running Read-SpaM"
"${READ_SPAM_DIRECTORY}readspam" "${HOME}Results/data/Roseobacter/filelist_${SEQUENCING_COVERAGE}.txt" "${SEQUENCING_COVERAGE}"



for f in $PSEUDO_ASSEMBLED_GENOMES*.aln; do
  echo "${f}"
done
#----------------------------Concatenation of Reads END----------------------------