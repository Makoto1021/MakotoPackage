#' Title
#'
#' @param name_vector plot multiple names
#'
#' @return
#' @import ggplot2
#' @import dplyr
#' @import prenoms
#' @import assertthat
#' @export
#'
#' @examples
draw_names <- function(name_vector){
  assert_that(is.character(name_vector))

  plt <- prenoms::prenoms %>%
    filter(name %in% name_vector) %>%
    group_by(year,name) %>%
    summarize(n=sum(n)) %>%
    ggplot(aes(x=year,y=n, color=name)) +
    geom_line()
  return(plt)
}
