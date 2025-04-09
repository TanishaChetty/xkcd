#' @title Use the xkcd API bleh :p
#' @description
#' Given a comic number, the `xkcd()` function calls the xkcd JSON API and returns the metadata about the comic in the form of a list object.
#'
#' @importFrom jsonlite readjson
#' @export

xkcd <- function(number){

  url <- file.path("https://xkcd.com", floor(number), "info.0.json")
  x <- jsonlite::read_json(url)
  return(x)

}
