#' Highlight statistical text
#'
#' @param text text to highlight
#' @param file file name
#'
#' @return creates a .html file
#' @export
highlight_stat_text <- function(text, file) {
  count_stats(text) %>%
    make_html_text() %>%
    make_html_file(file = file)
}
