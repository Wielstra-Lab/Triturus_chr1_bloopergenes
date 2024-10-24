## Script to plot output from treemix analysis

### More explanation in the following tutorials:
### Treemix Tutorial - https://speciationgenomics.github.io/Treemix/
### Wielstra lab Github banded newt paper (for Treemix details) - https://github.com/Wielstra-Lab/banded_newts
### OptM (https://cran.r-project.org/web/packages/OptM/readme/README.html)

setwd("C:/PATH/TO/TREEMIX_OUTPUT/")
#install.packages("RColorBrewer")
#install.packages("R.utils")
#install.packages("SiZer")
#install.packages("OptM")

library(RColorBrewer)
library(R.utils)
library(SiZer)
library(OptM)

### First Adjusted plotting script 
### This version of the plotting script was mainly used by us for the trees + residuals figures
source("C:/PATH/TO/plotting_funcs1.R")

### Note that our Treemix analysis could only be performed on our entire dataset as a whole (here referred to as the 'alltargets' set)
prefix="alltargets"

### Plot the 5 treemix runs side-by-side for one of the reticulations (in example below, the 10th)
par(mfrow=c(2,3))
for(edge in 1:5){
  plot_tree(cex=0.8,paste0(prefix,".10.",edge))
  title(paste(edge,"edges"))
}
#dev.off()

### Check which parts of the tree are not well modelled (by plotting the residuals)

par(mfrow=c(2,3))
for(edge in 1:5){
  plot_resid(stem=paste0(prefix,".10.",edge),pop_order="alltargets.list")
}
#dev.off()

### Second Adjusted plotting script 
### This version of the plotting script was mainly used by us for the deltam / optM figures
source("C:/PATH/TO/plotting_funcs2.R")

## Use OptM to estimate the optimal number of migration events/edges, in different ways:
## We have used the extdata folder throughout the process 

# Note that we use the OptM folder, replacing the example files with our own input files

# 1) by using the Evanno-like method / ad hoc statistic
folder <- system.file("extdata", package = "OptM")
test.optM = optM(folder)
plot_optM(test.optM, method = "Evanno", pdf = "Evanno.pdf")
dev.off()

# 2) or by using the linear modeling estimation method
folder <- system.file("extdata", package = "OptM")
test.linear = optM(folder, method = "linear")
plot_optM(test.linear, method = "linear", pdf = "Linear.pdf")
dev.off()

# 3) or by using SiZer
folder <- system.file("extdata", package = "OptM")
test.sizer = optM(folder, method = "SiZer")
plot_optM(test.sizer, method = "SiZer", pdf = "SiZer.pdf")
dev.off()
