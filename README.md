
<!-- README.md is generated from README.Rmd. Please edit that file -->

# express

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/express)](https://CRAN.R-project.org/package=express)
<!-- badges: end -->

The goal of express is to simplify exploration of tabular, gene-level
expression datasets

## Installation

You can install the development version of express like so:

``` r
# install.packages('remotes')
remotes::install_github('selkamand/express')
```

## Quick Start

This is a basic example which shows you how to solve a common problem:

``` r
library(express)

path_example <- system.file("example.tsv" ,package = "express")
df_expression <- read_expression_table(path_example)
```
