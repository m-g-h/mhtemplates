#' Creates files for xaringan html presentation integration in "presentation/".
#'
#' @export
#'
#' @importFrom usethis use_directory
#'
use_xaringan <- function(dir = "presentation") {

  usethis::use_directory(paste0(dir,"/"))

  file.copy(system.file("templates/xaringan.zip", package = "mhtemplates"),
            to = paste0(dir,"/xaringan.zip"))

  unzip(paste0(dir,"/xaringan.zip"),exdir = dir)

  file.remove(paste0(dir,"/xaringan.zip"))
}
