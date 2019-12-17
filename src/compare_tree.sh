#!/bin/bash

HOME="/home/tahmed/Genomics"
TREE_OUTPUT="${HOME}/Results/data/29mamals/tree/100000/"
TREE_FILE="${HOME}/Results/data/29mamals/tree/100000/29mamals_100000_all_trees.txt"

rm $TREE_FILE

for f in $TREE_OUTPUT*.txt; do
  echo "${f}"
done


for f in $TREE_OUTPUT*.txt; do

  (
    cat "${f}"
    echo
  ) >>$TREE_FILE
done
