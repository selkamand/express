
<!-- README.md is generated from README.Rmd. Please edit that file -->

# express

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/express)](https://CRAN.R-project.org/package=express)
<!-- badges: end -->

Warning: this repo is in very early development and not yet ready for
use yet.

The goal of express is to simplify exploration of tabular, gene-level
expression datasets.

To analyse your own data, you need a data.frame with 3 columns

1.  *sample*: a sample identifier
2.  *gene*: a gene identifier
3.  *expression*: a quantitative value representing expression of that
    has been normalised so is comparable across samples (e.g. TPM).

## Installation

You can install the development version of express like so:

``` r
# install.packages('remotes')
remotes::install_github('selkamand/express')
```

## Quick Start

``` r
library(express)

path_example <- system.file("example.tsv" ,package = "express")
df_expression <- read_expression_table(path_example)


express_gene_distribution(
  data = df_expression, 
  genes = "TP53", 
  sample_metadata = df_sample_metadata, 
  colour_by = "Disease"
)

express_pathway_distribution(
  data = df_expression, 
  pathways = list("pathway_name" = c("gene1", "gene2", "gene3"))
  sample_metadata = df_sample_metadata, 
  colour_by = "Disease"
)


express_sample_relatedness(
  data = df_expression, 
  method = "TSNE",
  gene_selector = "most_variable",
  sample_metadata = df_sample_metadata, 
  colour_by = "Disease"
)
```

## Accessing Precomputed Public Analyses

express can also visualise the results from precomputed analyses hosted
on GitHub.

For example to see a t-SNE of TCGA BRCA

``` r
library(express)
express_precomputed("BRCA", datatype = "expression")
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

To see all precomputed datasets available

``` r
express_available_datasets()
#>    name method    datatype
#> 1   GBM  t-SNE  expression
#> 2   ACC  t-SNE  expression
#> 3  BLCA  t-SNE  expression
#> 4  BRCA  t-SNE  expression
#> 5  CESC  t-SNE  expression
#> 6  CHOL  t-SNE  expression
#> 7  COAD  t-SNE  expression
#> 8  DLBC  t-SNE  expression
#> 9  ESCA  t-SNE  expression
#> 10 HNSC  t-SNE  expression
#> 11 KICH  t-SNE  expression
#> 12 KIRC  t-SNE  expression
#> 13 KIRP  t-SNE  expression
#> 14 LAML  t-SNE  expression
#> 15  LGG  t-SNE  expression
#> 16 LIHC  t-SNE  expression
#> 17 LUAD  t-SNE  expression
#> 18 LUSC  t-SNE  expression
#> 19 MESO  t-SNE  expression
#> 20   OV  t-SNE  expression
#> 21 PAAD  t-SNE  expression
#> 22 PCPG  t-SNE  expression
#> 23 PRAD  t-SNE  expression
#> 24 READ  t-SNE  expression
#> 25 SARC  t-SNE  expression
#> 26 SKCM  t-SNE  expression
#> 27 STAD  t-SNE  expression
#> 28 TGCT  t-SNE  expression
#> 29 THCA  t-SNE  expression
#> 30 THYM  t-SNE  expression
#> 31 UCEC  t-SNE  expression
#> 32  UCS  t-SNE  expression
#> 33  UVM  t-SNE  expression
#> 34 BRCA   UMAP methylation
#>                                                description
#> 1    mRNA expression t-SNE from the pancanatlas GBM cohort
#> 2    mRNA expression t-SNE from the pancanatlas ACC cohort
#> 3   mRNA expression t-SNE from the pancanatlas BLCA cohort
#> 4   mRNA expression t-SNE from the pancanatlas BRCA cohort
#> 5   mRNA expression t-SNE from the pancanatlas CESC cohort
#> 6   mRNA expression t-SNE from the pancanatlas CHOL cohort
#> 7   mRNA expression t-SNE from the pancanatlas COAD cohort
#> 8   mRNA expression t-SNE from the pancanatlas DLBC cohort
#> 9   mRNA expression t-SNE from the pancanatlas ESCA cohort
#> 10  mRNA expression t-SNE from the pancanatlas HNSC cohort
#> 11  mRNA expression t-SNE from the pancanatlas KICH cohort
#> 12  mRNA expression t-SNE from the pancanatlas KIRC cohort
#> 13  mRNA expression t-SNE from the pancanatlas KIRP cohort
#> 14  mRNA expression t-SNE from the pancanatlas LAML cohort
#> 15   mRNA expression t-SNE from the pancanatlas LGG cohort
#> 16  mRNA expression t-SNE from the pancanatlas LIHC cohort
#> 17  mRNA expression t-SNE from the pancanatlas LUAD cohort
#> 18  mRNA expression t-SNE from the pancanatlas LUSC cohort
#> 19  mRNA expression t-SNE from the pancanatlas MESO cohort
#> 20    mRNA expression t-SNE from the pancanatlas OV cohort
#> 21  mRNA expression t-SNE from the pancanatlas PAAD cohort
#> 22  mRNA expression t-SNE from the pancanatlas PCPG cohort
#> 23  mRNA expression t-SNE from the pancanatlas PRAD cohort
#> 24  mRNA expression t-SNE from the pancanatlas READ cohort
#> 25  mRNA expression t-SNE from the pancanatlas SARC cohort
#> 26  mRNA expression t-SNE from the pancanatlas SKCM cohort
#> 27  mRNA expression t-SNE from the pancanatlas STAD cohort
#> 28  mRNA expression t-SNE from the pancanatlas TGCT cohort
#> 29  mRNA expression t-SNE from the pancanatlas THCA cohort
#> 30  mRNA expression t-SNE from the pancanatlas THYM cohort
#> 31  mRNA expression t-SNE from the pancanatlas UCEC cohort
#> 32   mRNA expression t-SNE from the pancanatlas UCS cohort
#> 33   mRNA expression t-SNE from the pancanatlas UVM cohort
#> 34 450K methylation array umap from pan-cancer BRCA cohort
```
