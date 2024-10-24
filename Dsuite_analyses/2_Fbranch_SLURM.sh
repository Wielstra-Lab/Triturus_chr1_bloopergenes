#!/bin/bash

#SBATCH --ntasks=
#SBATCH --cpus-per-task=
#SBATCH --time=
#SBATCH --partition=
#SBATCH --mem=
#SBATCH --output=
#SBATCH --error=
#SBATCH --job-name=
#SBATCH --mail-type=
#SBATCH --mail-user=

## Note that, as described in the Manuscript, we repeat the work for three different topologies called 'TOP1', 'TOP2' and 'TOP3'
## The example provided here is for TOP1, which in Newick format would be in our case: (Outgroup,(Calotriton,(NIO,(Lissotriton,Triturus))));
## Also, note that the text file used as input is the output file with the '_tree.txt' suffix after using Dsuite's Dtrios function - for more information see https://github.com/millanek/Dsuite)

# Start by setting your working directory (where the Dtrios output is located - in our case in separate subfolders, see below)
cd /PATH/TO/DSUITE_TOP1/

## Because we work with subsets of data (on chromosome-level) we had already ordered our Dtrios output in separate folders per subset
## Note that here, we will loop through those folders and repeat the Dsuite Fbranch analysis independently per subset of our data

for dir in */; do
    echo "Attempting to change directory to: $dir"
    cd $dir || { echo "Failed to change directory to: $dir"; exit 1; }
    echo "Successfully changed directory to: $dir"
    output_file="output_${dir%/}.txt"
    error_file="error_output_${dir%/}.txt"
    /PATH/TO/Dsuite Fbranch *.nwk *_TOP1_tree.txt > "$output_file" 2> "$error_file"
    cd ../
done
