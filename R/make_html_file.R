#' Make html file
#'
#' @param html_text HTML text
#' @param file file name
#'
#' @export
make_html_file <- function(html_text, file) {
  writeLines(html_text, file)
}
