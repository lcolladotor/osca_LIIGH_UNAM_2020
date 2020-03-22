
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Analyzing **scRNA-seq** data with **Bioconductor** for **LCG-EJ-UNAM** March 2020 <a href="https://bioconductor.org/"><img src="https://osca.bioconductor.org/cover.png" style="width: 20%"/></a>

<!-- badges: start -->

<!-- badges: end -->

Here you can find the files for the March 2020 single cell
RNA-sequencing (scRNA-seq) course for
[LCG-EJ-UNAM](https://lcgej.unam.mx/) at
[LIIGH-UNAM](https://liigh.unam.mx/) based on the book [**Orchestrating
Single Cell Analysis with
Bioconductor**](https://osca.bioconductor.org/) by [Aaron
Lun](https://www.linkedin.com/in/aaron-lun-869b5894/), [Robert
Amezquita](https://robertamezquita.github.io/), [Stephanie
Hicks](https://www.stephaniehicks.com/) and [Raphael
Gottardo](http://rglab.org), plus [**WEHI’s scRNA-seq
course**](https://drive.google.com/drive/folders/1cn5d-Ey7-kkMiex8-74qxvxtCQT6o72h)
by [Peter Hickey](https://www.peterhickey.org/).

Instructor: [\*\*Leonardo
Collado-Torres](http://lcolladotor.github.io/).

## Install required packages

``` r
## For installing Bioconductor packages
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

## Install required packages
BiocManager::install(c(
    'SingleCellExperiment'
))
```

## Course files

1.  [Introduction](01-introduction.html)
2.  [Data Infrastructure and
    Import](02-data-infrastructure-and-import.html)
3.  [Quality Control](03-quality-control.html)
4.  [Normalization](04-normalization.html)
5.  [Feature Selection](05-feature-selection.html)
6.  [Dimensionality Reduction](06-dimensionality-reduction.html)
7.  [Clustering](07-clustering.html)
8.  [Marker gene detection](08-marker-gene-detection.html)
9.  [Cell Annotation](09-cell-annotation.html)
10. [Data Integration](10-data-integration.html)
11. [Multi-Sample Comparisons](11-multi-sample-comparisons.html)
12. [Spatial Transcriptomics](12-spatial-transcriptomics.html)

## OSCA Workflow

<a href="https://osca.bioconductor.org/"><img src="https://raw.githubusercontent.com/Bioconductor/OrchestratingSingleCellAnalysis/master/images/Workflow.png" /></a>
