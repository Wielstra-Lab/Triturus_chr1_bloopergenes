# Triturus Chr1 'Bloopergenes'

This repository comprises different folders that each contain (a set of) scripts/code used for the analyses in: [De Visser, M.C. et al. Conserved gene content and unique phylogenetic history characterize the ‘bloopergene’ underlying Triturus’ balanced lethal system. in prep]

We refer to the method section of the above paper for the details on each of the (bioinformatics) steps and where to find the appropriate sources/code. In this repository, we provide two folders: one with scripts used in the D-suite analyses, and one with scripts used in the Treemix analyses (mostly plotting the results). The method section of the paper should make the rest clear, however if things are still unclear, please read the following:

# Folders here on GitHub

Below the folders on this GitHub __'Triturus_chr1_bloopergenes'__ repository, including the scripts/files they contain, are listed so you can easily find what you are looking for:

### Dsuite_analyses

- __1_Dtrios_SLURM.sh__ [batch script meant for SLURM with the command used to run Dsuite's Dtrios function on VCF data]
- __2_Fbranch_SLURM.sh__ [batch script meant for SLURM with the command used to run Dsuite's Fbranch function on Dsuite's Dtrios output data]
- __3_heatmap_SLURM.sh__ [batch script meant for SLURM with the command used to run Dsuite's heatmap function (=dtools.py script) on Dsuite's Fbranch output data]  

For more information on how to use Dsuite, see: 
- https://github.com/millanek/Dsuite

### Treemix_analysis

- __Plot_Treemix_steps.R__ [adjusted R script used to plot the output from the Treemix analysis]
- __plotting_funcs1.R__ [adjusted R script, called on in the Plot_Treemix_steps.R script, mainly used to plot the trees + residuals figures]
- __plotting_funcs2.R__ [adjusted R script, called on in the Plot_Treemix_steps.R script, mainly used to plot the deltaM / optM figures]

For more information on how to use Treemix and the plotting scripts, see:
- Treemix Tutorial - https://speciationgenomics.github.io/Treemix/
- Wielstra lab Github banded newt paper (for Treemix details) - https://github.com/Wielstra-Lab/banded_newts
- OptM (https://cran.r-project.org/web/packages/OptM/readme/README.html)

# Other files:

If you require additional files to run analyses that are not provided here, such as Supplementary Materials, please check the Zenodo repository: 
- https://zenodo.org/records/13991240

Otherwise, if you require scripts/code used in other parts of the study, we kindly refer to the methods section of the manuscript mentioned above.
