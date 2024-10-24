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
## Also, a text file is needed for input (see Dsuite's Dtrios function and 'SETS.txt' explanation via https://github.com/millanek/Dsuite)

# Start by setting your working directory (where the output files must end up)
cd /PATH/TO/DSUITE_TOP1/

# Loop through the different ms-VCF files to study (in our case, the different files would contain targets/SNPs specific to certain chromosomes/linkage groups, for instance). 
for file in /PATH/TO/CHROMOSOME_LEVEL_VCFS/*.vcf
do
  /PATH/TO/Dsuite Dtrios --tree=TOP1.nwk -o ${file%.vcf}_TOP1 $file SETS_TOP1.txt
done
