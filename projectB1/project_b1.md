Project B1
================

# Exercise 1 and 2: Making and Documenting a Function

We’ll write a function `na_summary()` and document it using roxygen2
tags.

``` r
#' Missing and Non-Missing Values Summary
#' Summarizes the count and percentage of missing and non-missing values in each column of a data frame.
#' 
#' @param df An object of class "data.frame". Named df as short for data frame.
#' @return An object of class "data.frame" in a long data format that summarizes the count and percentage of missing and non-missing values in each column of a data frame.
#' @export 

na_summary <- function(df){
  if(!require(tidyverse)){
    stop("The tidyverse packages must be installed. Run install.packages(\"tidyverse\") and then try again.")
  }
  if(!is.data.frame(df)){
    stop("This function only works for object of class \"data.frame\" \n", "You have provided an object of class:", class(df))
  }
  if(nrow(df) == 0 | ncol(df) == 0){
    stop("This function only works for \"data.frame\" object of non-zero dimensions")
  }
  df %>%
    gather(key = "key", value = "val") %>%
    mutate(is_na = is.na(val)) %>%
    group_by(key) %>%
    mutate(total = n()) %>%
    group_by(key, total, is_na) %>%
    summarise(na_count = n()) %>%
    mutate(na_pct = na_count/total *100)
}
```

# Exercise 3: Demonstrating Examples

The function `na_summary()` was inspired by the tasks of exploring many
datasets in the `datateachr` package. We’ll run `na_summary()` on the
`apt_buildings` and `vancouver_trees` datasets from `datateachr`.

``` r
# Load packages  ---------------------------
library(datateachr)

# Run na_summary() on data ---------------------------
# Complete dataset
na_summary(apt_buildings)
```

    ## Loading required package: tidyverse

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.3.5     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.6     ✔ dplyr   1.0.7
    ## ✔ tidyr   1.1.4     ✔ stringr 1.4.1
    ## ✔ readr   2.1.1     ✔ forcats 0.5.1
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## `summarise()` has grouped output by 'key', 'total'. You can override using the `.groups` argument.

    ## # A tibble: 65 × 5
    ## # Groups:   key, total [37]
    ##    key                            total is_na na_count na_pct
    ##    <chr>                          <int> <lgl>    <int>  <dbl>
    ##  1 air_conditioning                3455 FALSE     3370  97.5 
    ##  2 air_conditioning                3455 TRUE        85   2.46
    ##  3 amenities                       3455 FALSE      937  27.1 
    ##  4 amenities                       3455 TRUE      2518  72.9 
    ##  5 balconies                       3455 FALSE     3367  97.5 
    ##  6 balconies                       3455 TRUE        88   2.55
    ##  7 barrier_free_accessibilty_entr  3455 FALSE     3373  97.6 
    ##  8 barrier_free_accessibilty_entr  3455 TRUE        82   2.37
    ##  9 bike_parking                    3455 FALSE     3455 100   
    ## 10 cooling_room                    3455 FALSE     3367  97.5 
    ## # … with 55 more rows

``` r
na_summary(vancouver_trees)
```

    ## Warning: attributes are not identical across measure variables;
    ## they will be dropped

    ## `summarise()` has grouped output by 'key', 'total'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 25 × 5
    ## # Groups:   key, total [20]
    ##    key            total is_na na_count na_pct
    ##    <chr>          <int> <lgl>    <int>  <dbl>
    ##  1 assigned      146611 FALSE   146611  100  
    ##  2 civic_number  146611 FALSE   146611  100  
    ##  3 common_name   146611 FALSE   146611  100  
    ##  4 cultivar_name 146611 FALSE    79052   53.9
    ##  5 cultivar_name 146611 TRUE     67559   46.1
    ##  6 curb          146611 FALSE   146611  100  
    ##  7 date_planted  146611 FALSE    70063   47.8
    ##  8 date_planted  146611 TRUE     76548   52.2
    ##  9 diameter      146611 FALSE   146611  100  
    ## 10 genus_name    146611 FALSE   146611  100  
    ## # … with 15 more rows

``` r
# Subset of the dataset
apt_buildings %>%
    select(ward, prop_management_company_name, year_built, no_of_storeys, no_of_units, property_type, no_barrier_free_accessible_units, no_of_accessible_parking_spaces, heating_type) %>%
  na_summary()
```

    ## `summarise()` has grouped output by 'key', 'total'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 14 × 5
    ## # Groups:   key, total [9]
    ##    key                              total is_na na_count  na_pct
    ##    <chr>                            <int> <lgl>    <int>   <dbl>
    ##  1 heating_type                      3455 FALSE     3369  97.5  
    ##  2 heating_type                      3455 TRUE        86   2.49 
    ##  3 no_barrier_free_accessible_units  3455 FALSE     3301  95.5  
    ##  4 no_barrier_free_accessible_units  3455 TRUE       154   4.46 
    ##  5 no_of_accessible_parking_spaces   3455 FALSE     3332  96.4  
    ##  6 no_of_accessible_parking_spaces   3455 TRUE       123   3.56 
    ##  7 no_of_storeys                     3455 FALSE     3455 100    
    ##  8 no_of_units                       3455 FALSE     3455 100    
    ##  9 prop_management_company_name      3455 FALSE     2092  60.5  
    ## 10 prop_management_company_name      3455 TRUE      1363  39.5  
    ## 11 property_type                     3455 FALSE     3455 100    
    ## 12 ward                              3455 FALSE     3455 100    
    ## 13 year_built                        3455 FALSE     3442  99.6  
    ## 14 year_built                        3455 TRUE        13   0.376

Notice that `na_summary()` works on a data frame with columns of various
object classes.

``` r
glimpse(apt_buildings)
```

    ## Rows: 3,455
    ## Columns: 37
    ## $ id                               <dbl> 10359, 10360, 10361, 10362, 10363, 10…
    ## $ air_conditioning                 <chr> "NONE", "NONE", "NONE", "NONE", "NONE…
    ## $ amenities                        <chr> "Outdoor rec facilities", "Outdoor po…
    ## $ balconies                        <chr> "YES", "YES", "YES", "YES", "NO", "NO…
    ## $ barrier_free_accessibilty_entr   <chr> "YES", "NO", "NO", "YES", "NO", "NO",…
    ## $ bike_parking                     <chr> "0 indoor parking spots and 10 outdoo…
    ## $ exterior_fire_escape             <chr> "NO", "NO", "NO", "YES", "NO", NA, "N…
    ## $ fire_alarm                       <chr> "YES", "YES", "YES", "YES", "YES", "Y…
    ## $ garbage_chutes                   <chr> "YES", "YES", "NO", "NO", "NO", "NO",…
    ## $ heating_type                     <chr> "HOT WATER", "HOT WATER", "HOT WATER"…
    ## $ intercom                         <chr> "YES", "YES", "YES", "YES", "YES", "Y…
    ## $ laundry_room                     <chr> "YES", "YES", "YES", "YES", "YES", "Y…
    ## $ locker_or_storage_room           <chr> "NO", "YES", "YES", "YES", "NO", "YES…
    ## $ no_of_elevators                  <dbl> 3, 3, 0, 1, 0, 0, 0, 2, 4, 2, 0, 2, 2…
    ## $ parking_type                     <chr> "Underground Garage , Garage accessib…
    ## $ pets_allowed                     <chr> "YES", "YES", "YES", "YES", "YES", "Y…
    ## $ prop_management_company_name     <chr> NA, "SCHICKEDANZ BROS. PROPERTIES", N…
    ## $ property_type                    <chr> "PRIVATE", "PRIVATE", "PRIVATE", "PRI…
    ## $ rsn                              <dbl> 4154812, 4154815, 4155295, 4155309, 4…
    ## $ separate_gas_meters              <chr> "NO", "NO", "NO", "NO", "NO", "NO", "…
    ## $ separate_hydro_meters            <chr> "YES", "YES", "YES", "YES", "YES", "Y…
    ## $ separate_water_meters            <chr> "NO", "NO", "NO", "NO", "NO", "NO", "…
    ## $ site_address                     <chr> "65  FOREST MANOR RD", "70  CLIPPER R…
    ## $ sprinkler_system                 <chr> "YES", "YES", "NO", "YES", "NO", "NO"…
    ## $ visitor_parking                  <chr> "PAID", "FREE", "UNAVAILABLE", "UNAVA…
    ## $ ward                             <chr> "17", "17", "03", "03", "02", "02", "…
    ## $ window_type                      <chr> "DOUBLE PANE", "DOUBLE PANE", "DOUBLE…
    ## $ year_built                       <dbl> 1967, 1970, 1927, 1959, 1943, 1952, 1…
    ## $ year_registered                  <dbl> 2017, 2017, 2017, 2017, 2017, NA, 201…
    ## $ no_of_storeys                    <dbl> 17, 14, 4, 5, 4, 4, 4, 7, 32, 4, 4, 7…
    ## $ emergency_power                  <chr> "NO", "YES", "NO", "NO", "NO", "NO", …
    ## $ `non-smoking_building`           <chr> "YES", "NO", "YES", "YES", "YES", "NO…
    ## $ no_of_units                      <dbl> 218, 206, 34, 42, 25, 34, 14, 105, 57…
    ## $ no_of_accessible_parking_spaces  <dbl> 8, 10, 20, 42, 12, 0, 5, 1, 1, 6, 12,…
    ## $ facilities_available             <chr> "Recycling bins", "Green Bin / Organi…
    ## $ cooling_room                     <chr> "NO", "NO", "NO", "NO", "NO", "NO", "…
    ## $ no_barrier_free_accessible_units <dbl> 2, 0, 0, 42, 0, NA, 14, 0, 0, 1, 25, …

``` r
glimpse(vancouver_trees)
```

    ## Rows: 146,611
    ## Columns: 20
    ## $ tree_id            <dbl> 149556, 149563, 149579, 149590, 149604, 149616, 149…
    ## $ civic_number       <dbl> 494, 450, 4994, 858, 5032, 585, 4909, 4925, 4969, 7…
    ## $ std_street         <chr> "W 58TH AV", "W 58TH AV", "WINDSOR ST", "E 39TH AV"…
    ## $ genus_name         <chr> "ULMUS", "ZELKOVA", "STYRAX", "FRAXINUS", "ACER", "…
    ## $ species_name       <chr> "AMERICANA", "SERRATA", "JAPONICA", "AMERICANA", "C…
    ## $ cultivar_name      <chr> "BRANDON", NA, NA, "AUTUMN APPLAUSE", NA, "CHANTICL…
    ## $ common_name        <chr> "BRANDON ELM", "JAPANESE ZELKOVA", "JAPANESE SNOWBE…
    ## $ assigned           <chr> "N", "N", "N", "Y", "N", "N", "N", "N", "N", "N", "…
    ## $ root_barrier       <chr> "N", "N", "N", "N", "N", "N", "N", "N", "N", "N", "…
    ## $ plant_area         <chr> "N", "N", "4", "4", "4", "B", "6", "6", "3", "3", "…
    ## $ on_street_block    <dbl> 400, 400, 4900, 800, 5000, 500, 4900, 4900, 4900, 7…
    ## $ on_street          <chr> "W 58TH AV", "W 58TH AV", "WINDSOR ST", "E 39TH AV"…
    ## $ neighbourhood_name <chr> "MARPOLE", "MARPOLE", "KENSINGTON-CEDAR COTTAGE", "…
    ## $ street_side_name   <chr> "EVEN", "EVEN", "EVEN", "EVEN", "EVEN", "ODD", "ODD…
    ## $ height_range_id    <dbl> 2, 4, 3, 4, 2, 2, 3, 3, 2, 2, 2, 5, 3, 2, 2, 2, 2, …
    ## $ diameter           <dbl> 10.00, 10.00, 4.00, 18.00, 9.00, 5.00, 15.00, 14.00…
    ## $ curb               <chr> "N", "N", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "Y", "…
    ## $ date_planted       <date> 1999-01-13, 1996-05-31, 1993-11-22, 1996-04-29, 19…
    ## $ longitude          <dbl> -123.1161, -123.1147, -123.0846, -123.0870, -123.08…
    ## $ latitude           <dbl> 49.21776, 49.21776, 49.23938, 49.23469, 49.23894, 4…

We can also create a new data frame or one from an existing object to
run `na_summary()`.

``` r
# Create a non data frame object ---------------------------
# matrix array object
alpha_num <- cbind(col1= 1:3, col2 = c("A", "B", "C"))
alpha_num
```

    ##      col1 col2
    ## [1,] "1"  "A" 
    ## [2,] "2"  "B" 
    ## [3,] "3"  "C"

``` r
class(alpha_num)
```

    ## [1] "matrix" "array"

``` r
# Convert into data frame object ---------------------------
alpha_num_df <- data.frame(alpha_num)

# Run na_summary() ---------------------------
na_summary(alpha_num_df)
```

    ## `summarise()` has grouped output by 'key', 'total'. You can override using the
    ## `.groups` argument.

    ## # A tibble: 2 × 5
    ## # Groups:   key, total [2]
    ##   key   total is_na na_count na_pct
    ##   <chr> <int> <lgl>    <int>  <dbl>
    ## 1 col1      3 FALSE        3    100
    ## 2 col2      3 FALSE        3    100

Overall, `na_summary()` is helpful for exploring data and making
informed decisions on if/how we should use variables.

# Exercise 4: Testing Function

We’ll use the `testthat` package to run formal tests for our function.

``` r
# Load packages  ---------------------------
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches

    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null

    ## The following objects are masked from 'package:readr':
    ## 
    ##     edition_get, local_edition

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

**Test 1** We expect an error message when `na_summary()` is used on an
object that is not of class data.frame. We evaluated this on objects of
class character, integer, and matrix array.

``` r
test_that("Function returns error if df is not a data.frame object", {
  expect_error(na_summary(letters)) 
  expect_error(na_summary(1:26))
  expect_error(na_summary(cbind(letters, 1:26)))
})
```

    ## Test passed 😀

**Test 2** We expect an error message when `na_summary()` is used on a
data.frame object of zero dimension. We evaluated this on a dataframe
with zero dimension only of the row, only of the column, and of both the
column and row.

``` r
test_that("Function returns error when df has zero dimension", {
  expect_error(na_summary(data.frame()))
  expect_error(na_summary(data.frame(col1 = numeric(0), col2 = character(0))))
  expect_error(na_summary(data.frame(numeric(0))))
})
```

    ## Test passed 🥳

**Test 3** We expect `na_summary()` to return a data.frame of summarized
missing and non-missing values on a data.frame with columns of mixed
class types; numeric and character.

``` r
test_that("Function returns dataframe of missing and non-missing values summary when df consists of numeric and character class types", {
  expect_s3_class(na_summary(data.frame(col1=("C, B, A"), col2=c("A", "NA", "C"))), "data.frame")
  expect_s3_class(na_summary(data.frame(col1=1:3, col2= c(4, NA, 5))), "data.frame")
})
```

    ## Test passed 🌈

**Test 4** We expect `na_summary()` to return a data.frame of summarized
missing and non-missing values on a data.frame consisting of entirely
all NA or none NA values.

``` r
test_that("Function returns data frame of missing and non-missing values summary when df consists entirely of NAs or no NAs", {
  expect_s3_class(na_summary(data.frame(col1=1:3, col2=c("A", "B", "C"))), "data.frame")
  expect_s3_class(na_summary(data.frame(col1=1:3, col2=c(NA, NA, NA))), "data.frame")
})
```

    ## Test passed 🌈
