library(magrittr)

# Save original wd for later reset
originalwd <- getwd()

# LATEX -------------------------------------------------------------------

# Copy files of latex template as .zip to /inst
setwd("templates/latex/")

delete_files = list.files(all.files = T,
                          recursive = T) %>%
  stringr::str_subset("\\.frontmatter|\\.gitignore|\\.preamble|\\.bib|figures|main\\.tex|symbols\\.tex|tables",
                      negate = T)

template_zip_file_tex = "../../inst/templates/latex.zip"

file.remove(delete_files, template_zip_file_tex)

zip(zipfile = template_zip_file_tex,
    files = list.files(all.files = T,
                       recursive = T)
)

setwd(originalwd)


# XARINGAN PRESENTATION ---------------------------------------------------

# Copy files of xaringan presentation template as .zip to /inst

setwd("templates/xaringan/")

template_zip_file_xaringan = "../../inst/templates/xaringan.zip"

file.remove(template_zip_file_xaringan)

zip(zipfile = template_zip_file_xaringan,
    files = list.files(all.files = T,recursive = T))

setwd(originalwd)


# TARGETS -----------------------------------------------------------------

setwd("templates/targets/")

template_zip_file_targets = "../../inst/templates/targets.zip"

file.remove(template_zip_file_targets)

zip(zipfile = template_zip_file_targets,
    files = list.files(all.files = T,recursive = T))

setwd(originalwd)


# INSTALL -----------------------------------------------------------------



# Install package
library(devtools)
document()
install()
