#' French names
#'
#' @param the_name first name of French people
#' @param the_sex gender
#'
#' @import ggplot2
#' @import dplyr
#' @import prenoms
#'
#' @return
#' @export
#'
#' @examples

draw_a_name <- function(the_name, the_sex){
  plt <- prenoms::prenoms %>%
    filter(sex==the_sex, name==the_name) %>%
    group_by(year,sex,name) %>%
    summarize(n=sum(n)) %>%
    ggplot(aes(x=year,y=n)) +
    geom_line() +
    labs(title=the_name)
  return(plt)
}
