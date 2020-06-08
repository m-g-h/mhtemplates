#' Creates files for latex integration in "written/".
#'
#' @export
#'
#' @importFrom usethis use_directory
#'
use_latex <- function(dir = "written") {

    dir.create(paste0(dir,"/"))

    file.copy(system.file("templates/latex.zip", package = "mhtemplates"),
              to = paste0(dir,"/latex.zip"))

    unzip(paste0(dir,"/latex.zip"),exdir = dir)

    file.remove(paste0(dir,"/latex.zip"))

}
