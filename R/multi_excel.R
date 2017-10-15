#' Read multiple excel sheets of a file into a list
#'
#' @param file_name full path including a file name
#'
#' @return list of dataframes of excel sheets of a single xlsx file
#' @import readxl
#' @import assertthat
#' @export
#'
#' @examples
multi_excel <- function(file_name){
  assert_that(is.dir(dirname(file_name)))
  assert_that(is.readable(file_name))
  assert_that(has_extension(file_name,"xlsx"))

  sheets <- lapply(excel_sheets(file_name), read_excel, path=file_name)
  return(sheets)
}
