#' Count stat words
#'
#' @param text Text you would like to analyze.
#'
#' @return
#' @export
count_stats <- function(text) {
  tibble::tibble(abstract = text) %>%
    tidytext::unnest_tokens(sentence, abstract, token = "sentences", to_lower = FALSE) %>%
    dplyr::mutate(sentence_n = 1:dplyr::n()) %>%
    tidytext::unnest_tokens(word, sentence, drop = FALSE) %>%
    dplyr::left_join(.statwords$stat_words) %>%
    dplyr::mutate(stat_word = dplyr::case_when(
      is.na(stat_word) ~ 0,
      TRUE ~ 1
    )
    ) %>%
    dplyr::group_by(sentence, sentence_n) %>%
    dplyr::summarise(n_stat_words = sum(stat_word)) %>%
    dplyr::ungroup() %>%
    dplyr::arrange(sentence_n)
}
