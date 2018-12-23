#' Function for creating project folders for writing or data analysis.
#'
#' @param path Path where the project files should be created. Defauts to "~/Documents/Projects/".
#' @param project Project name
#' @param mode "tex_only" only creates the files for writing a latex document. "data_minimal"
#' Creates and RProject with git, magrittr::pipe integration and a data-raw folder. "data_full"
#' adds drake and LaTeX integration.
#'
#' @export
use_project <- function(path = "~/Documents/Projects/", project = "template", mode = "tex_only") {

  if (mode == "tex_only") {

    mhtemplates::use_latex(dir = project)
  }

  else if (mode == "data_minimal") {

    usethis::create_package(path = paste0(path,project), open = F)
    usethis::proj_set(path = paste0(path,project))
    usethis::use_git()
    usethis::use_roxygen_md()
    usethis::use_pipe()
    usethis::use_data_raw()
  }

  else if (mode == "dat_full") {
    usethis::create_package(path = paste0(path,project), open = F)
    usethis::proj_set(path = paste0(path,project))
    usethis::use_package("drake", type = "imports")
    usethis::use_git()
    usethis::use_roxygen_md()
    usethis::use_pipe()
    usethis::use_data_raw()
    mhtemplates::use_latex()
  }
}
