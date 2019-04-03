#' Make html
#'
#' @param count_stats_tbl Tibble generated using the count_stats() function.
#'
#' @return Text string of html
#' @export
make_html <- function(count_stats_tbl) {
  s <- count_stats_tbl
  f <- grDevices::colorRamp(c("white", "light blue"))
  colors <- tibble::tibble(
    n_stat_words = 1:max(s$n_stat_words, 1),
    values = n_stat_words/max(s$n_stat_words, 1),
    color = grDevices::rgb(f(values)/255)
  )
  s %>%
    dplyr::left_join(colors) %>%
    dplyr::mutate(color = dplyr::case_when(
      n_stat_words == 0 ~ "#fff",
      TRUE ~ color
    ),
    sentence = gsub(glue::glue('(\\<{glue::glue_collapse(stat_words[,1, drop = TRUE], sep = "\\\\>|\\\\<")}\\>)'), '<b>\\1</b>', sentence, ignore.case = TRUE)) %>%
    glue::glue_data("<span style='background-color: {color}'>{sentence}</span>")
}
