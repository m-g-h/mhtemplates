
originalwd <- getwd()
setwd("templates/latex/")

zip("../../inst/templates/latex",
    files = list.files(all.files = T,recursive = T))

setwd(originalwd)





