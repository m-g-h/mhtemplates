#' Creates files for latex integration in "written/".
#'
#' @param dir \code{string scaler}, giving the relative path to the directory
#' where the template should be created
#' @export
#'
#' @importFrom usethis use_directory
#' @importFrom utils unzip
#'
use_latex <- function(dir = "written") {

    dir.create(paste0(dir,"/"))

    file.copy(system.file("templates/latex.zip", package = "mhtemplates"),
              to = paste0(dir,"/latex.zip"))

    unzip(paste0(dir,"/latex.zip"),exdir = dir)

    file.remove(paste0(dir,"/latex.zip"))

}
