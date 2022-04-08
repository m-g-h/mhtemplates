#' Creates files for a target project.
#'
#' @param dir \code{string scaler}, giving the relative path to the directory
#' where the template should be created
#' @export
#'
#' @importFrom usethis use_directory
#'
use_targets <- function() {

  usethis::use_directory("")

  file.copy(system.file("templates/targets.zip", package = "mhtemplates"),
            to = paste0("targets.zip"))

  unzip(paste0("targets.zip"),exdir = ".")

  file.remove(paste0("targets.zip"))

  rstudioapi::navigateToFile("SETUP.R")

}
