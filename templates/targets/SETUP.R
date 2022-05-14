
# REPRODUCIBLE PACKAGE ENVIRONMENT
renv::init(bare = TRUE)

install.packages("tidyverse")
install.packages("targets")
install.packages("tarchetypes")
install.packages("testthat")
install.packages("here")
install.packages("rmarkdown")
install.packages("usethis")

renv::snapshot()

# Git
usethis::use_git()

# TESTING
testthat::test_dir("tests")

# TARGETS
targets::tar_make_future(workers = 1)


