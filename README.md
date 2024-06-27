
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
express_precomputed_tsne("BRCA")
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

To see all precomputed datasets available

``` r
express_available_datasets()
#>    name type                                            description
#> 1   GBM tsne  mRNA expression t-SNE from the pancanatlas GBM cohort
#> 2   ACC tsne  mRNA expression t-SNE from the pancanatlas ACC cohort
#> 3  BLCA tsne mRNA expression t-SNE from the pancanatlas BLCA cohort
#> 4  BRCA tsne mRNA expression t-SNE from the pancanatlas BRCA cohort
#> 5  CESC tsne mRNA expression t-SNE from the pancanatlas CESC cohort
#> 6  CHOL tsne mRNA expression t-SNE from the pancanatlas CHOL cohort
#> 7  COAD tsne mRNA expression t-SNE from the pancanatlas COAD cohort
#> 8  DLBC tsne mRNA expression t-SNE from the pancanatlas DLBC cohort
#> 9  ESCA tsne mRNA expression t-SNE from the pancanatlas ESCA cohort
#> 10 HNSC tsne mRNA expression t-SNE from the pancanatlas HNSC cohort
#> 11 KICH tsne mRNA expression t-SNE from the pancanatlas KICH cohort
#> 12 KIRC tsne mRNA expression t-SNE from the pancanatlas KIRC cohort
#> 13 KIRP tsne mRNA expression t-SNE from the pancanatlas KIRP cohort
#> 14 LAML tsne mRNA expression t-SNE from the pancanatlas LAML cohort
#> 15  LGG tsne  mRNA expression t-SNE from the pancanatlas LGG cohort
#> 16 LIHC tsne mRNA expression t-SNE from the pancanatlas LIHC cohort
#> 17 LUAD tsne mRNA expression t-SNE from the pancanatlas LUAD cohort
#> 18 LUSC tsne mRNA expression t-SNE from the pancanatlas LUSC cohort
#> 19 MESO tsne mRNA expression t-SNE from the pancanatlas MESO cohort
#> 20   OV tsne   mRNA expression t-SNE from the pancanatlas OV cohort
#> 21 PAAD tsne mRNA expression t-SNE from the pancanatlas PAAD cohort
#> 22 PCPG tsne mRNA expression t-SNE from the pancanatlas PCPG cohort
#> 23 PRAD tsne mRNA expression t-SNE from the pancanatlas PRAD cohort
#> 24 READ tsne mRNA expression t-SNE from the pancanatlas READ cohort
#> 25 SARC tsne mRNA expression t-SNE from the pancanatlas SARC cohort
#> 26 SKCM tsne mRNA expression t-SNE from the pancanatlas SKCM cohort
#> 27 STAD tsne mRNA expression t-SNE from the pancanatlas STAD cohort
#> 28 TGCT tsne mRNA expression t-SNE from the pancanatlas TGCT cohort
#> 29 THCA tsne mRNA expression t-SNE from the pancanatlas THCA cohort
#> 30 THYM tsne mRNA expression t-SNE from the pancanatlas THYM cohort
#> 31 UCEC tsne mRNA expression t-SNE from the pancanatlas UCEC cohort
#> 32  UCS tsne  mRNA expression t-SNE from the pancanatlas UCS cohort
#> 33  UVM tsne  mRNA expression t-SNE from the pancanatlas UVM cohort
#>                                                                                  url
#> 1   https://raw.githubusercontent.com/selkamand/express_precompute/main/GBM_tsne.csv
#> 2   https://raw.githubusercontent.com/selkamand/express_precompute/main/ACC_tsne.csv
#> 3  https://raw.githubusercontent.com/selkamand/express_precompute/main/BLCA_tsne.csv
#> 4  https://raw.githubusercontent.com/selkamand/express_precompute/main/BRCA_tsne.csv
#> 5  https://raw.githubusercontent.com/selkamand/express_precompute/main/CESC_tsne.csv
#> 6  https://raw.githubusercontent.com/selkamand/express_precompute/main/CHOL_tsne.csv
#> 7  https://raw.githubusercontent.com/selkamand/express_precompute/main/COAD_tsne.csv
#> 8  https://raw.githubusercontent.com/selkamand/express_precompute/main/DLBC_tsne.csv
#> 9  https://raw.githubusercontent.com/selkamand/express_precompute/main/ESCA_tsne.csv
#> 10 https://raw.githubusercontent.com/selkamand/express_precompute/main/HNSC_tsne.csv
#> 11 https://raw.githubusercontent.com/selkamand/express_precompute/main/KICH_tsne.csv
#> 12 https://raw.githubusercontent.com/selkamand/express_precompute/main/KIRC_tsne.csv
#> 13 https://raw.githubusercontent.com/selkamand/express_precompute/main/KIRP_tsne.csv
#> 14 https://raw.githubusercontent.com/selkamand/express_precompute/main/LAML_tsne.csv
#> 15  https://raw.githubusercontent.com/selkamand/express_precompute/main/LGG_tsne.csv
#> 16 https://raw.githubusercontent.com/selkamand/express_precompute/main/LIHC_tsne.csv
#> 17 https://raw.githubusercontent.com/selkamand/express_precompute/main/LUAD_tsne.csv
#> 18 https://raw.githubusercontent.com/selkamand/express_precompute/main/LUSC_tsne.csv
#> 19 https://raw.githubusercontent.com/selkamand/express_precompute/main/MESO_tsne.csv
#> 20   https://raw.githubusercontent.com/selkamand/express_precompute/main/OV_tsne.csv
#> 21 https://raw.githubusercontent.com/selkamand/express_precompute/main/PAAD_tsne.csv
#> 22 https://raw.githubusercontent.com/selkamand/express_precompute/main/PCPG_tsne.csv
#> 23 https://raw.githubusercontent.com/selkamand/express_precompute/main/PRAD_tsne.csv
#> 24 https://raw.githubusercontent.com/selkamand/express_precompute/main/READ_tsne.csv
#> 25 https://raw.githubusercontent.com/selkamand/express_precompute/main/SARC_tsne.csv
#> 26 https://raw.githubusercontent.com/selkamand/express_precompute/main/SKCM_tsne.csv
#> 27 https://raw.githubusercontent.com/selkamand/express_precompute/main/STAD_tsne.csv
#> 28 https://raw.githubusercontent.com/selkamand/express_precompute/main/TGCT_tsne.csv
#> 29 https://raw.githubusercontent.com/selkamand/express_precompute/main/THCA_tsne.csv
#> 30 https://raw.githubusercontent.com/selkamand/express_precompute/main/THYM_tsne.csv
#> 31 https://raw.githubusercontent.com/selkamand/express_precompute/main/UCEC_tsne.csv
#> 32  https://raw.githubusercontent.com/selkamand/express_precompute/main/UCS_tsne.csv
#> 33  https://raw.githubusercontent.com/selkamand/express_precompute/main/UVM_tsne.csv
```
