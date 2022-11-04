# STAT545B: Building Functions and R Packages

## Introduction
This repository contains code to reproduce a two-part project for STAT545B: Exploratory Data Analysis at the University of British Colombia.

Part [B1](https://stat545.stat.ubc.ca/assignments/assignment-b1/) focuses on function writing, documentation, and testing.\

Part [B2](https://stat545.stat.ubc.ca/assignments/assignment-b2/) focuses on wrapping the function from part B1 into an R package with documentation and testing. 


## Requirements
We used the `tidyverse`, `testthat`, and `datateachr` packages in the project.

To install `tidyverse`, `testthat`, and `datateachr` in your **R terminal**:

```{r}
install.packages("tidyverse")
install.packages("testthat")
install.packages("devtools")
devtools::install_github("UBC-MDS/datateachr")
```


## Navigating the repository

The projectB1 folder contains: 

- projectB1.Rmd: R markdown file with code for function writing, documentation and testing of part B1 of the project.
- projectB1.md: Rendered markdown document of part B1.
  
The projectB2 folder contains: 

- projectB2.Rmd: R markdown file with code for R package building, documentation, and testing of part B2 of the project.
- projectB2.md: Rendered markdown document of part B2.
