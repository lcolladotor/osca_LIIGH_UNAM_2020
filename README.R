## ---- include = FALSE------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----install, eval = FALSE-------------------------------------------------------------------------------------------
## ## For installing Bioconductor packages
## if (!requireNamespace("BiocManager", quietly = TRUE))
##     install.packages("BiocManager")
## 
## ## Install required packages
## BiocManager::install(
##     c(
##         'SingleCellExperiment',
##         'usethis',
##         'here',
##         'scran',
##         'scater',
##         'scRNAseq',
##         'org.Mm.eg.db',
##         'AnnotationHub',
##         'ExperimentHub',
##         'BiocFileCache',
##         'DropletUtils',
##         'EnsDb.Hsapiens.v86',
##         'TENxPBMCData',
##         'BiocSingular',
##         'batchelor',
##         'uwot',
##         'Rtsne',
##         'pheatmap',
##         'fossil',
##         'ggplot2',
##         'cowplot',
##         'RColorBrewer',
##         'plotly',
##         'iSEE',
##         'pryr',
##         'LieberInstitute/spatialLIBD',
##         'sessioninfo'
##     )
## )


## ## Log into the cluster

## 
## ## Load the R 3.6.1 module

## module load r/3.6.1

## 
## ## Edit your ~/.Rprofile

## vi ~/.Rprofile


## ----edit_r_profile_r, eval = FALSE----------------------------------------------------------------------------------
## ## Add this to your ~/.Rprofile file
## if(R.home() == '/cm/shared/apps/r/3.6.1-studio/lib64/R') {
##     if (interactive())
##         message("Using the following library: /mnt/Genoma/amedina/lcollado/R/3.6.1")
##     .libPaths(
##         c(
##             '/mnt/Genoma/amedina/lcollado/R/3.6.1',
##             '/cm/shared/apps/r/3.6.1-studio/lib64/R/library'
##         )
##     )
## }


## qrsh

## module load r/3.6.1

## Rscript -e "packageVersion('spatialLIBD')"

