#' Function for saving plots as tikz file.
#'
#' @param plot A plot.
#' @param dir The directory where the file should be saved, without trailing "/"
#' @param filename The name of the file to be created.
#' @param width Width of the plot in inches.
#' @param height The height of th plot in inches.
#' @param file_out Variable in order to track output in drake plan with file_out().
#' @param sanitize Clean out special LaTeX characters if they throw an error.
#'
#' @return A file in the specified folder.
#' @export
#'
#' @importFrom tikzDevice tikz
#' @importFrom purrr map_chr
#' @importFrom tibble enframe
#' @importFrom stringr str_replace
#' @importFrom grDevices dev.off
#' @importFrom purrr pmap
#' @importFrom drake file_out

save_tikz <- function(plot, filename = "plot", dir = "written/figures", height, width, file_out = NULL, sanitize = F){
  path <- paste0(dir, "/", filename, ".tex")

  file_there <- drake::file_out(path)

  tikzDevice::tikz(file = path,
                   height = height,
                   width = width,
                   sanitize = sanitize,
                   packages = c("amsmath", "amssymb"))

  print(plot)

  grDevices::dev.off()

  ## Since the saved files will land in the path "figures/", it here gets added
  ## so that it can be found in LaTeX
  file <- readLines(con = path) %>%
    tibble::enframe()
  purrr::map_chr(file$value,
                 .f = stringr::str_replace,
                 pattern = paste0(filename, "_ras1"),
                 replacement = paste0("figures/", filename, "_ras1")) %>%
    writeLines(con = path)
}
