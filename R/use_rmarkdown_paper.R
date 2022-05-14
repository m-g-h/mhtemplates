#' Creates files for latex integration in "written/".
#'
#' @param dir \code{string scaler}, giving the relative path to the directory
#' where the template should be created
#' @export
#'
#' @importFrom usethis use_directory
#' @importFrom utils unzip
#'
use_rmarkdown_paper <- function(dir = "written") {

    dir.create(paste0(dir,"/"))

    file.copy(system.file("templates/rmarkdown_paper.zip", package = "mhtemplates"),
              to = paste0(dir,"/rmarkdown_paper.zip"))

    unzip(paste0(dir,"/rmarkdown_paper.zip"),exdir = dir)

    file.remove(paste0(dir,"/rmarkdown_paper.zip"))

}
