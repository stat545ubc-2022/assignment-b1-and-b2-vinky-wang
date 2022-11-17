test_that("Function returns error if df is not a data.frame object", {
  expect_error(na_summary(letters))
  expect_error(na_summary(1:26))
  expect_error(na_summary(cbind(letters, 1:26)))
})

test_that("Function returns error when df has zero dimension", {
  expect_error(na_summary(data.frame()))
  expect_error(na_summary(data.frame(col1 = numeric(0), col2 = character(0))))
  expect_error(na_summary(data.frame(numeric(0))))
})

test_that("Function returns dataframe of missing and non-missing values summary when df consists of numeric and character class types", {
  expect_s3_class(na_summary(data.frame(col1=("C, B, A"), col2=c("A", "NA", "C"))), "data.frame")
  expect_s3_class(na_summary(data.frame(col1=1:3, col2= c(4, NA, 5))), "data.frame")
})

test_that("Function returns data frame of missing and non-missing values summary when df consists entirely of NAs or no NAs", {
  expect_s3_class(na_summary(data.frame(col1=1:3, col2=c("A", "B", "C"))), "data.frame")
  expect_s3_class(na_summary(data.frame(col1=1:3, col2=c(NA, NA, NA))), "data.frame")
})

