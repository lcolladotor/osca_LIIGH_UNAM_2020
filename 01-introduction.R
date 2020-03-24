## ----setup, include=FALSE--------------------------------------------------------------------------------------------
options(htmltools.dir.version = FALSE)


## ----xaringan-themer, include=FALSE----------------------------------------------------------------------------------
library(xaringanthemer)
solarized_dark(
  code_font_family = "Fira Code",
  code_font_url    = "https://cdn.rawgit.com/tonsky/FiraCode/1.204/distr/fira_code.css"
)


## /* From https://github.com/yihui/xaringan/issues/147  */

## .scroll-output {

##   height: 80%;

##   overflow-y: scroll;

## }

## 
## /* https://stackoverflow.com/questions/50919104/horizontally-scrollable-output-on-xaringan-slides */

## pre {

##   max-width: 100%;

##   overflow-x: scroll;

## }

## 
## /* From https://github.com/yihui/xaringan/wiki/Font-Size */

## .tiny{

##   font-size: 40%

## }

## 
## /* From https://github.com/yihui/xaringan/wiki/Title-slide */

## .title-slide {

##   background-image: url(https://raw.githubusercontent.com/Bioconductor/OrchestratingSingleCellAnalysis/master/images/Workflow.png);

##   background-size: 33%;

##   background-position: 0% 100%

## }


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


## ## If you have SSH keys enabled

## git clone git@github.com:lcolladotor/osca_LIIGH_UNAM_2020.git

## 
## ## or

## git clone https://github.com/lcolladotor/osca_LIIGH_UNAM_2020.git


## ----clone_repo, eval = FALSE----------------------------------------------------------------------------------------
## git2r::clone('https://github.com/lcolladotor/osca_LIIGH_UNAM_2020',
##     'osca_LIIGH_UNAM_2020')


## ----proj, eval = FALSE----------------------------------------------------------------------------------------------
## usethis::create_project('~/Desktop/osca_playground_leo')


## ----create_setup, eval = FALSE--------------------------------------------------------------------------------------
## ## Start a setup file
## usethis::use_r('00-setup.R')


## ----use_git, eval = FALSE-------------------------------------------------------------------------------------------
## ## Start git repo
## usethis::use_git()
## 
## ## Use GitHub
## usethis::browse_github_token()
## usethis::edit_r_environ() ## then restart R
## usethis::use_github() ## commit first, then run this command
## 
## ## Start 01-intro notes
## usethis::use_r('01-introduction.R')


## ----'quick_intro_01', message = FALSE-------------------------------------------------------------------------------
library('scRNAseq')
library('scater')
library('scran')
library('plotly')


## ----'quick_intro_02', cache = TRUE----------------------------------------------------------------------------------
sce <- scRNAseq::MacoskoRetinaData()

## How big is the data?
pryr::object_size(sce)

## How does it look?
sce


## ----'quick_intro_03', cache = TRUE----------------------------------------------------------------------------------
# Quality control.
is.mito <- grepl("^MT-", rownames(sce))
qcstats <-
    scater::perCellQCMetrics(sce, subsets = list(Mito = is.mito))
filtered <-
    scater::quickPerCellQC(qcstats, percent_subsets = "subsets_Mito_percent")
sce <- sce[, !filtered$discard]

# Normalization.
sce <- scater::logNormCounts(sce)

# Feature selection.
dec <- scran::modelGeneVar(sce)
hvg <- scran::getTopHVGs(dec, prop = 0.1)

# Dimensionality reduction.
set.seed(1234)
sce <- scater::runPCA(sce, ncomponents = 25, subset_row = hvg)
sce <- scater::runUMAP(sce, dimred = 'PCA', external_neighbors = TRUE)

# Clustering.
g <- scran::buildSNNGraph(sce, use.dimred = 'PCA')
sce$clusters <- factor(igraph::cluster_louvain(g)$membership)


## ----'quick_intro_04'------------------------------------------------------------------------------------------------
# Visualization.
scater::plotUMAP(sce, colour_by = "clusters")


## ----'quick_intro_05', eval = FALSE----------------------------------------------------------------------------------
## # Interactive visualization
## p <- scater::plotUMAP(sce, colour_by = "clusters")
## plotly::ggplotly(p)


## ----'quick_intro_06', eval = FALSE, echo = FALSE--------------------------------------------------------------------
## # From https://github.com/rstudio/htmltools/issues/90
## p <- scater::plotUMAP(sce, colour_by = "clusters")
## pi <- plotly::ggplotly(p)
## f <- '01-introduction_files/figure-html/quick_intro_06.html'
## htmlwidgets::saveWidget(pi, here::here(f))
## htmltools::tags$iframe(
##     src = f,
##     width = "100%",
##     height = "400",
##     scrolling = "no",
##     seamless = "seamless",
##     frameBorder = "0"
## )


## ----'reproducibility', cache = TRUE, dependson=knitr::all_labels()--------------------------------------------------
options(width = 120)
sessioninfo::session_info()

