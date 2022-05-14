library(targets)
library(tarchetypes)
options(tidyverse.quiet = TRUE)
# This is an example _targets.R file. Every
# {targets} pipeline needs one.
# Use tar_script() to create _targets.R and tar_edit()
# to open it again for editing.
# Then, run tar_make() to run the pipeline
# and tar_read(summary) to view the results.

# SOURCE FUNCTIONS HERE
source("R/function.R")

# Set target-specific options such as packages.
tar_option_set(packages = "tidyverse")


# End this file with a list of target objects.
list(
  tar_target(iris_data,
             "data/iris.csv",
             format = "file"),
  tar_target(data,
             read_csv(iris_data)),
  tar_target(iris_plot,
             plot_iris(data)),
  tar_render(report,
             path = "R/report.Rmd",
             output_dir = "_output/reports")
)
