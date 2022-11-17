#' Missing and Non-Missing Values Summary
#'
#' Summarizes the count and percentage of missing and non-missing values in each column of a data frame.
#'
#' @param df An object of class "data.frame". This parameter is named df as an abbreviation for data frame.
#'
#' @return An object of class "data.frame" in a long data format that summarizes the count and percentage of missing and non-missing values in each column of a data frame.
#' @export
#'
#' @examples
#' na_summary(data.frame(col1=("C, B, A"), col2=c("A", "NA", "C")))
#' na_summary(data.frame(col1=1:3, col2= c(4, NA, 5)))
na_summary <- function(df){
  if(nrow(df) == 0 | ncol(df) == 0){
    stop("This function only works for \"data.frame\" object of non-zero dimensions")
  }
  df %>%
    tidyr::gather(key = "key", value = "val") %>%
    dplyr::mutate(is_na = is.na(val)) %>%
    dplyr::group_by(key) %>%
    dplyr:: mutate(total = n()) %>%
    dplyr::group_by(key, total, is_na) %>%
    dplyr::summarise(na_count = n()) %>%
    dplyr::mutate(na_pct = na_count/total *100)
}
