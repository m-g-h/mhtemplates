
# Save original wd for later reset
originalwd <- getwd()

# Copy files of latex template as .zip to /inst
setwd("templates/latex/")

zip("../../inst/templates/latex",
    files = list.files(all.files = T,recursive = T))

setwd(originalwd)

# Copy files of xaringan presentation template as .zip to /inst

setwd("templates/xaringan/")

zip("../../inst/templates/xaringan",
    files = list.files(all.files = T,recursive = T))

setwd(originalwd)

# Install package
library(devtools)
document()
install()
