# STAT545B: Building Functions and R Packages

## Introduction
This repository contains code to reproduce a two-part project for STAT545B: Exploratory Data Analysis at the University of British Colombia.

Part [B1](https://stat545.stat.ubc.ca/assignments/assignment-b1/) focuses on function writing, documentation, and testing.

Part [B2](https://stat545.stat.ubc.ca/assignments/assignment-b2/) focuses on wrapping the function from part B1 into an R package with documentation and testing. 


## Requirements
We used the `tidyverse`, `testthat`, and `datateachr` packages for part B1. 

To install `tidyverse`, `testthat`, and `datateachr` in your **R terminal**:

```{r}
install.packages("tidyverse")
install.packages("testthat")
install.packages("devtools")
devtools::install_github("UBC-MDS/datateachr")
```

To install `nasummary`, the package created in part B2 which wraps the function `na_summary()` created in part B1

```{r}
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-vinky-wang/nasummary")
```


## Navigating the repository

The projectB1 folder contains: 

- projectB1.Rmd: R markdown file with code for function writing, documentation and testing
- projectB1.md: Rendered markdown document of the above
  
The nasummary folder contains: 

- DESCRIPTION: package metadata
- LICENSE (and LICENSE.md): package license
- man/ directory: function documentation
- NAMESPACE: functions intended to be used by a package user 
- R/ directory: function code
- README.Rmd (and README.md): further package information
- tests/ directory: function tests

