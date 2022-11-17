
<!-- README.md is generated from README.Rmd. Please edit that file -->

# nasummary

<!-- badges: start -->
<!-- badges: end -->

The goal of `nasummary` is to summarize the count and percentage of
missing and non-missing values for each columns of a data frame. When
working with new data, it is good practice to perform an ‘exploratory
data analysis’ (EDA) which refers to the initial exploration of the data
to understand patterns, anomalies, and check assumptions. Often in the
EDA, the number of missing values in a variable column followed by a
calculation of the percentage of data that the missing values account
for is explored. This is to determine whether a variable should be used
in further analyses. For example, based on your knowledge of the data
and modelling assumptions, you have decided to include variables that
contain missing values only if it accounts for less than 25% of the
total data. The `nasummary` package is designed to simplify this
calculation by returning a data frame that summarizes the count and
percentage of missing and non-missing values in an easy to read long
data format.

## Installation

You can install the development version of nasummary from
[GitHub](https://github.com/):

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-vinky-wang/nasummary/")
```

**Note**: uncomment install.packages(“devtools”) if you do not already
have `devtools` installed.

## Example

We can create a data frame then run `na_summary()` to obtain the count
and percentage of missing and non-missing values.

``` r
# Create a non data frame object ---------------------------
alpha_num <- cbind(col1= 1:3, col2 = c("A", "B", "C"))

# Convert into data frame object ---------------------------
alpha_num_df <- data.frame(alpha_num)

# Run na_summary() ---------------------------
library(nasummary)
#> Loading required package: tidyverse
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
#> ✔ ggplot2 3.4.0      ✔ purrr   0.3.5 
#> ✔ tibble  3.1.8      ✔ dplyr   1.0.10
#> ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
#> ✔ readr   2.1.3      ✔ forcats 0.5.2 
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
na_summary(alpha_num_df)
#> # A tibble: 2 × 5
#> # Groups:   key, total [2]
#>   key   total is_na na_count na_pct
#>   <chr> <int> <lgl>    <int>  <dbl>
#> 1 col1      3 FALSE        3    100
#> 2 col2      3 FALSE        3    100
```
