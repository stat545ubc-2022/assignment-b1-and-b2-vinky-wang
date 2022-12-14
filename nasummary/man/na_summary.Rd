% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/na_summary.R
\name{na_summary}
\alias{na_summary}
\title{Missing and Non-Missing Values Summary}
\usage{
na_summary(df)
}
\arguments{
\item{df}{An object of class "data.frame". This parameter is named df as an abbreviation for data frame.}
}
\value{
An object of class "data.frame" in a long data format that summarizes the count and percentage of missing and non-missing values in each column of a data frame.
}
\description{
Summarizes the count and percentage of missing and non-missing values in each column of a data frame.
}
\examples{
na_summary(data.frame(col1=("C, B, A"), col2=c("A", "NA", "C")))
na_summary(data.frame(col1=1:3, col2= c(4, NA, 5)))
}
