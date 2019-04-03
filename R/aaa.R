#' Pipe operator
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom dplyr %>%
#' @usage lhs \%>\% rhs
NULL

.statwords <- new.env(parent = emptyenv())

.statwords$stat_words <-
  system.file("extdata", "stat_words.csv", package = "statwords") %>%
  read.csv(stringsAsFactors = FALSE) %>%
  tibble::as_tibble() %>%
  dplyr::mutate(stat_word = 1)
