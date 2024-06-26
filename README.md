
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
#>    name type
#> 1   ACC tsne
#> 2  BLCA tsne
#> 3  BRCA tsne
#> 4  CESC tsne
#> 5  CHOL tsne
#> 6  COAD tsne
#> 7  DLBC tsne
#> 8  ESCA tsne
#> 9  HNSC tsne
#> 10 KICH tsne
#> 11 KIRC tsne
#> 12 KIRP tsne
#> 13 LAML tsne
#> 14  LGG tsne
#> 15 LIHC tsne
#> 16 LUAD tsne
#> 17 LUSC tsne
#> 18 MESO tsne
#> 19   OV tsne
#> 20 PAAD tsne
#> 21 PCPG tsne
#> 22 PRAD tsne
#> 23 READ tsne
#> 24 SARC tsne
#> 25 SKCM tsne
#> 26 STAD tsne
#> 27 TGCT tsne
#> 28 THCA tsne
#> 29 THYM tsne
#> 30 UCEC tsne
#> 31  UCS tsne
#> 32  UVM tsne
#>                                                                                description
#> 1                  mRNA expression t-SNE from the pancanatlas adrenocortical cancer cohort
#> 2           mRNA expression t-SNE from the pancanatlas bladder urothelial carcinoma cohort
#> 3              mRNA expression t-SNE from the pancanatlas breast invasive carcinoma cohort
#> 4         mRNA expression t-SNE from the pancanatlas cervical & endocervical cancer cohort
#> 5                     mRNA expression t-SNE from the pancanatlas cholangiocarcinoma cohort
#> 6                   mRNA expression t-SNE from the pancanatlas colon adenocarcinoma cohort
#> 7          mRNA expression t-SNE from the pancanatlas diffuse large B-cell lymphoma cohort
#> 8                   mRNA expression t-SNE from the pancanatlas esophageal carcinoma cohort
#> 9    mRNA expression t-SNE from the pancanatlas head & neck squamous cell carcinoma cohort
#> 10                    mRNA expression t-SNE from the pancanatlas kidney chromophobe cohort
#> 11           mRNA expression t-SNE from the pancanatlas kidney clear cell carcinoma cohort
#> 12       mRNA expression t-SNE from the pancanatlas kidney papillary cell carcinoma cohort
#> 13                mRNA expression t-SNE from the pancanatlas acute myeloid leukemia cohort
#> 14              mRNA expression t-SNE from the pancanatlas brain lower grade glioma cohort
#> 15        mRNA expression t-SNE from the pancanatlas liver hepatocellular carcinoma cohort
#> 16                   mRNA expression t-SNE from the pancanatlas lung adenocarcinoma cohort
#> 17          mRNA expression t-SNE from the pancanatlas lung squamous cell carcinoma cohort
#> 18                          mRNA expression t-SNE from the pancanatlas mesothelioma cohort
#> 19     mRNA expression t-SNE from the pancanatlas ovarian serous cystadenocarcinoma cohort
#> 20             mRNA expression t-SNE from the pancanatlas pancreatic adenocarcinoma cohort
#> 21      mRNA expression t-SNE from the pancanatlas pheochromocytoma & paraganglioma cohort
#> 22               mRNA expression t-SNE from the pancanatlas prostate adenocarcinoma cohort
#> 23                 mRNA expression t-SNE from the pancanatlas rectum adenocarcinoma cohort
#> 24                               mRNA expression t-SNE from the pancanatlas sarcoma cohort
#> 25               mRNA expression t-SNE from the pancanatlas skin cutaneous melanoma cohort
#> 26                mRNA expression t-SNE from the pancanatlas stomach adenocarcinoma cohort
#> 27            mRNA expression t-SNE from the pancanatlas testicular germ cell tumor cohort
#> 28                     mRNA expression t-SNE from the pancanatlas thyroid carcinoma cohort
#> 29                               mRNA expression t-SNE from the pancanatlas thymoma cohort
#> 30 mRNA expression t-SNE from the pancanatlas uterine corpus endometrioid carcinoma cohort
#> 31                mRNA expression t-SNE from the pancanatlas uterine carcinosarcoma cohort
#> 32                        mRNA expression t-SNE from the pancanatlas uveal melanoma cohort
#>                                                                                  url
#> 1   https://raw.githubusercontent.com/selkamand/express_precompute/main/ACC_tsne.csv
#> 2  https://raw.githubusercontent.com/selkamand/express_precompute/main/BLCA_tsne.csv
#> 3  https://raw.githubusercontent.com/selkamand/express_precompute/main/BRCA_tsne.csv
#> 4  https://raw.githubusercontent.com/selkamand/express_precompute/main/CESC_tsne.csv
#> 5  https://raw.githubusercontent.com/selkamand/express_precompute/main/CHOL_tsne.csv
#> 6  https://raw.githubusercontent.com/selkamand/express_precompute/main/COAD_tsne.csv
#> 7  https://raw.githubusercontent.com/selkamand/express_precompute/main/DLBC_tsne.csv
#> 8  https://raw.githubusercontent.com/selkamand/express_precompute/main/ESCA_tsne.csv
#> 9  https://raw.githubusercontent.com/selkamand/express_precompute/main/HNSC_tsne.csv
#> 10 https://raw.githubusercontent.com/selkamand/express_precompute/main/KICH_tsne.csv
#> 11 https://raw.githubusercontent.com/selkamand/express_precompute/main/KIRC_tsne.csv
#> 12 https://raw.githubusercontent.com/selkamand/express_precompute/main/KIRP_tsne.csv
#> 13 https://raw.githubusercontent.com/selkamand/express_precompute/main/LAML_tsne.csv
#> 14  https://raw.githubusercontent.com/selkamand/express_precompute/main/LGG_tsne.csv
#> 15 https://raw.githubusercontent.com/selkamand/express_precompute/main/LIHC_tsne.csv
#> 16 https://raw.githubusercontent.com/selkamand/express_precompute/main/LUAD_tsne.csv
#> 17 https://raw.githubusercontent.com/selkamand/express_precompute/main/LUSC_tsne.csv
#> 18 https://raw.githubusercontent.com/selkamand/express_precompute/main/MESO_tsne.csv
#> 19   https://raw.githubusercontent.com/selkamand/express_precompute/main/OV_tsne.csv
#> 20 https://raw.githubusercontent.com/selkamand/express_precompute/main/PAAD_tsne.csv
#> 21 https://raw.githubusercontent.com/selkamand/express_precompute/main/PCPG_tsne.csv
#> 22 https://raw.githubusercontent.com/selkamand/express_precompute/main/PRAD_tsne.csv
#> 23 https://raw.githubusercontent.com/selkamand/express_precompute/main/READ_tsne.csv
#> 24 https://raw.githubusercontent.com/selkamand/express_precompute/main/SARC_tsne.csv
#> 25 https://raw.githubusercontent.com/selkamand/express_precompute/main/SKCM_tsne.csv
#> 26 https://raw.githubusercontent.com/selkamand/express_precompute/main/STAD_tsne.csv
#> 27 https://raw.githubusercontent.com/selkamand/express_precompute/main/TGCT_tsne.csv
#> 28 https://raw.githubusercontent.com/selkamand/express_precompute/main/THCA_tsne.csv
#> 29 https://raw.githubusercontent.com/selkamand/express_precompute/main/THYM_tsne.csv
#> 30 https://raw.githubusercontent.com/selkamand/express_precompute/main/UCEC_tsne.csv
#> 31  https://raw.githubusercontent.com/selkamand/express_precompute/main/UCS_tsne.csv
#> 32  https://raw.githubusercontent.com/selkamand/express_precompute/main/UVM_tsne.csv
```
