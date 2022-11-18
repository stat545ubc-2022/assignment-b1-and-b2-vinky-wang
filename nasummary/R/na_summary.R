#' Missing and Non-Missing Values Summary
#'
#' Summarizes the count and percentage of missing and non-missing values in each column of a data frame.
#'
#' @param df An object of class "data.frame". This parameter is named df as an abbreviation for data frame.
#'
#' @return An object of class "data.frame" in a long data format that summarizes the count and percentage of missing and non-missing values in each column of a data frame.
#' @export
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#' @importFrom dplyr n
#' @examples
#' na_summary(data.frame(col1=("C, B, A"), col2=c("A", "NA", "C")))
#' na_summary(data.frame(col1=1:3, col2= c(4, NA, 5)))
na_summary <- function(df){
  if(nrow(df) == 0 | ncol(df) == 0){
    stop("This function only works for \"data.frame\" object of non-zero dimensions")
  }
  df %>%
    tidyr::gather(key = "key", value = "val") %>%
    dplyr::mutate(is_na = is.na(.data$val)) %>%
    dplyr::group_by(.data$key) %>%
    dplyr:: mutate(total = n()) %>%
    dplyr::group_by(.data$key, .data$total, .data$is_na) %>%
    dplyr::summarise(na_count = n()) %>%
    dplyr::mutate(na_pct = .data$na_count/.data$total *100)
}
