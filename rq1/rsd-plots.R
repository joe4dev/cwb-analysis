library(sp)
library(raster)
library(reshape2)
library(ggplot2)

### BEGIN CONFIGUARION ###
script.dir <- dirname(sys.frame(1)$ofile)

# Input directory where the input CSV is located
src.dir <- script.dir # '~/Projects/CloudWorkBench/cwb-analysis/rq1'
src.file_name <- 'cwb-interim-aggregated-selected-filtered.csv'

# Output directory where the resulting PDF will be saved
out.dir <- '~/Papers/tex16-master-thesis-17/img' # script.dir
out.file_name <- 'rsd-boxplots.pdf'

### END CONFIGURATION ###


# CWB data source
src.file <- file.path(src.dir, src.file_name)

# Output
out.file <- file.path(out.dir, out.file_name)

# Read CSV
cwb <- read.csv(src.file, header = TRUE, sep = ';')

### Data preparation ###

# Exclude nominal variables
cols.nominal <- c('source', 'provider_vm_id')
vars.nominal <- names(cwb) %in% (cols.nominal)

# Aggregate by coefficient of variation (CV = RSD) while grouping by source
cwb.cv <- aggregate(cwb[!vars.nominal], by=list(cwb$source), FUN=cv)

# Assign labels
cwb.cv$Group.1 <- factor(cwb.cv$Group.1, labels = c("m1.small (eu)", "m1.small (us)", "m3.medium (us)", "m3.large (eu)", "m3.medium (eu)"))

# Reshape data
df <- melt(cwb.cv, id.vars = 'Group.1')

# Calculate means
means <- aggregate(value ~  Group.1, df, mean)
means$value <- round(means$value, digits = 2)

### Plotting ###

# Axis helper
roundUp <- function(x,to=5)
{
  to*(x%/%to + as.logical(x%%to))
}
limit.upper <- roundUp(max(df$value))

# RSD threshold
threshold <- 5

# Create plots
pdf(file=out.file, width = 10, height = 9)
p <- ggplot(df, aes(x = Group.1, y = value)) +
  geom_boxplot() +
  scale_x_discrete(name = "Configuration [Instance Type (Region)]") +
  scale_y_continuous(
    name = "Relative Standard Deviation (RSD) [%]",
    breaks = sort(c(seq(0, limit.upper, 10), threshold))) +
  # Threshold line
  geom_hline(yintercept = threshold, color="red") +
  # geom_text(data=data.frame(x=0.5,y=threshold), aes(x, y), label=threshold, vjust=-1, color="red") +
  # Mean values
  stat_summary(fun.y=mean, colour="blue", geom="point",
               shape=18, size=3, show.legend = TRUE) +
  geom_text(data = means, aes(label = value, y = value, hjust = -0.3), color = "blue")
print(p)
dev.off()
# Print interactively
print(p)
