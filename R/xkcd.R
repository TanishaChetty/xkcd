#' @title Use the xkcd API
#' @description
#' Given a comic number, the `xkcd()` function calls the xkcd JSON API and returns the metadata about the comic in the form of a list object.
#' @param number A scalar numeric vector corresponding to an xkcd comic number
#' @importFrom jsonlite read_json
#' @returns A list of 13 elements
#' * `month`: A scalar character vector
#' * `num`: A scalar character vector
#' * `link`: A scalar character vector
#' * `year`: A scalar character vector
#' * `news`: A scalar character vector
#' * `safe_title`: A scalar character vector
#' * `transcript`: A scalar character vector
#' * `alt`: A scalar character vector
#' * `img`: A scalar character vector
#' * `title`: A scalar character vector
#' * `day`: A scalar character vector
#' @examples
#' dino_time <- xkcd(15)
#' str(dino_time)
#' @export

xkcd <- function(number){

  url <- file.path("https://xkcd.com", floor(number), "info.0.json")
  x <- jsonlite::read_json(url)
  return(x)

}

#' @title Plot an xkcd comic strip
#' @description
#' draw comic() displays an xkcd comic strip as a plot in a graphics device (e.g., the RStudio plot window)
#' @param x A list object as returned from [xkcd()]
#' @importFrom tools file_ext
#' @importFrom httr GET
#' @importFrom png readPNG
#' @importFrom jpeg readJPEG
#' @importFrom graphics plot.new
#' @importFrom grid grid.raster
#' @returns A rastergrob grob. See "Details" section of the [grid::grob()] for more information. If you care.
draw_comic <- function(x){

  img_type <- tools::file_ext(x$img)
  tmp <- httr::GET(url = x$img)

  if (img_type == "png"){
    img <- png::readPNG(tmp$content)
  } else {
    img <- jpeg::readJPEG(tmp$content)
  }

  graphics::plot.new()
  grid::grid.raster(img)

}











