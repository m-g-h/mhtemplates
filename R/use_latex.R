#' Creates files for latex integration in "written/".
#'
#' @export
#'
use_latex <- function(dir = "written") {

  usethis::use_directory(paste0(dir,"/"))

  file.copy(system.file("templates/latex.zip", package = "mhtemplates"),
            to = paste0(dir,"/latex.zip"))

  unzip(paste0(dir,"/latex.zip"),exdir = dir)

  file.remove(paste0(dir,"/latex.zip"))
}
