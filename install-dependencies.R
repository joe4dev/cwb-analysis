# Alternatively, choose mirror interactively
# 1) R
# 2) chooseCRANmirror()
# 3) quit()

mirror <- "https://cloud.r-project.org"

rq1 <- c("sp", "raster", "reshape2", "ggplot2")
rq2 <- c("ggplot2", "data.table", "dplyr", "RColorBrewer")
packages <- c(rq1, rq2)

install.packages(packages, repos = mirror)
