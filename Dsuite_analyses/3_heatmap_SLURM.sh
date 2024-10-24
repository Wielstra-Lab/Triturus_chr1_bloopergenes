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
## Also, note that the text file used as input is the output file generated after using Dsuite's Fbranch function - for more information see https://github.com/millanek/Dsuite)

# Load required modules (in this case, this would load a version of Python 3 or higher)
module load Python

# Start by setting your working directory (where the Fbranch output is located - in our case ordered in separate subfolders, see below)
cd /PATH/TO/DSUITE_TOP1/

## Because we work with subsets of data (on chromosome-level) we had already ordered our Dtrios & Fbranch output in separate subfolders per subset
## Note that here, we will loop through those subfolders and repeat the Dsuite heatmap creation independently per each subset of our data
## Also note that, with this set-up, we made sure that the required newick tree was available in each of the subfolders

for dir in */; do
    echo "Attempting to change directory to: $dir"
    cd $dir || { echo "Failed to change directory to: $dir"; exit 1; }
    echo "Successfully changed directory to: $dir"
    output_file="figout_${dir%/}.txt"
    error_file="figerr_${dir%/}.txt"
    python /PATH/TO/dtools.py output*.txt *.nwk > "$output_file" 2> "$error_file"
    cd ../
done
