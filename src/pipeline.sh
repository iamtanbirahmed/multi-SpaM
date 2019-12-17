#!/bin/bash
#multi-spam input generation
HOME="/home/tahmed/Genomics/"
DATASET="${HOME}/Results/data/29mamals/ref_seq/"
INPUT_FILE="${HOME}/Results/data/29mamals/real_genome_input_mamals_100000.fasta"
OUTPUT_FILE="${HOME}/Results/data/29mamals/real_genome_output_mamals_100000_benchmark.txt"


# ------------FOR the reference phylogenetic tree with real genomes-------------
rm $INPUT_FILE
for f in $DATASET*.fasta;
 do (cat "${f}"; echo) >> $INPUT_FILE;
  done

echo "Copy input file into Multi-SpaM";
#cp $INPUT_FILE $MULTISPAM_DATA ;
echo "Running Multi-SpaM..";
# run multispam to get the phylogentic tree
python3 ../multispam.py -i "${INPUT_FILE}" -t 2 -n 100000 -o $OUTPUT_FILE --mem-save;
#---------------------------END Reference Tree Generation------------------------



##---------------------------Start generating simulated data----------------------
#HOME="/home/tahmed/Genomics/"
#ART="${HOME}art_bin_MountRainier/art_illumina"
#
#READ_SPAM_DIRECTORY="${HOME}Read-SpaM/"
#SEQUENCING_COVERAGE=1
#DATASET="${HOME}dataset/ref_seq/"
#
#SIMULATED_DATA="${HOME}dataset/sim_seq/${SEQUENCING_COVERAGE}/"
#READ_SPAM_INPUT="${HOME}dataset/read_spam_input/${SEQUENCING_COVERAGE}/"
#
#rm -Rf "${READ_SPAM_INPUT}"
#mkdir "${READ_SPAM_INPUT}"
#
#for f in $DATASET*.txt;
## run art simulator for each of the genome file
#  do
#    name=$(basename "${f}" ".txt")
#    genome_directory=$SIMULATED_DATA$name
#
#    if [ -d $genome_directory ];
#      then rm -Rf $genome_directory
#    fi
#
#    mkdir $genome_directory
#
#    $ART -ss HS25 -i "${f}" -o "${genome_directory}/${name}" -l 150 -f "${SEQUENCING_COVERAGE}" -k 0;
#    cp "${genome_directory}/${name}.aln" $READ_SPAM_INPUT;
#  done
##------------------------END Data Simulation---------------------------------
#
##------------------------Concat Reads Using read-spam-------------------------------
#rm "${READ_SPAM_DIRECTORY}data/filelist.txt"
#ls $READ_SPAM_INPUT* >"${READ_SPAM_DIRECTORY}data/filelist.txt"
#PSEUDO_ASSEMBLED_GENOMES="${READ_SPAM_DIRECTORY}data/assembled_files/"
#rm -Rf $PSEUDO_ASSEMBLED_GENOMES
#mkdir $PSEUDO_ASSEMBLED_GENOMES
#
#echo "Running Read-SpaM"
#"${READ_SPAM_DIRECTORY}readspam" "${READ_SPAM_DIRECTORY}data/filelist.txt"
#
#
#
#for f in $PSEUDO_ASSEMBLED_GENOMES*.aln; do
#  echo "${f}"
#done
##----------------------------Concatenation of Reads END----------------------------
#
##---------------------------Create input file for Multi-Spam----------------------
#SIMULATED_INPUT="${MULTISPAM_DATA}sim_genome_input.txt"
#SIMULATED_OUTPUT="${MULTISPAM_DATA}sim_genome_output.txt"
#
#rm $SIMULATED_INPUT
#
#for f in $PSEUDO_ASSEMBLED_GENOMES*.aln; do
#  (
#    cat "${f}"
#    echo
#  ) >>$SIMULATED_INPUT
#done
##--------------------------------Multi-spaM input file generation end-------------
#
##--------------------------------Run multi-spam for simulated data----------------
#python3 ../multispam.py -i "${SIMULATED_INPUT}" -t 1 -n 1000 -o $SIMULATED_OUTPUT
