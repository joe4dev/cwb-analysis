library(sp)
library(raster)
library(reshape2)
library(ggplot2)

### BEGIN CONFIGUARION ###
# script.dir <- dirname(sys.frame(1)$ofile) # doesn't work in CLI

# Input directory where the input CSV is located
src.dir <- '~/Projects/cwb-analysis/rq1' # script.dir
src.file_name <- 'cwb-interim-aggregated-selected-filtered.csv'

# Output directory where the resulting PDF will be saved
out.dir <- '~/Dropbox/Papers/tex18-app-perf-cloud18/img' # script.dir
out.file_name <- 'rsd-plot.pdf'

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

cwb.cv$Group.1 <- factor(cwb.cv$Group.1, c("rmit-combined_v3_aws-eu_m1.small", "rmit-combined_v3_aws-us_m1.small", "rmit-combined_v3_aws_m3.medium", "rmit-combined_v3_aws-us_m3.medium", "rmit-combined_v3_aws_m3.large"))
cwb.cv$Group.1 <- factor(cwb.cv$Group.1, labels = c("m1.small (eu)", "m1.small (us)", "m3.medium (eu)", "m3.medium (us)", "m3.large (eu)"))

# Reshape data
df <- melt(cwb.cv, id.vars = 'Group.1')

# Calculate means
means <- aggregate(value ~  Group.1, df, mean)
means$value <- round(means$value, digits = 2)

### Relevant sample sizes

cwb.sd <- aggregate(cwb[!vars.nominal], by=list(cwb$source), FUN=sd)
cwb.mean <- aggregate(cwb[!vars.nominal], by=list(cwb$source), FUN=mean)

vars.group1 <- names(cwb.sd) %in% (c('Group.1'))
# 95% CI
# z values from confidence intervals table:
# https://www.ltcconline.net/greenl/courses/201/estimation/smallConfLevelTable.htm
z.ci95 <- 1.96
cwb.n95 <- ceiling(((z.ci95 * cwb.sd[!vars.group1])/(cwb.mean[!vars.group1] * 0.05))^2)
cwb.n95 <- cbind(cwb.n95, Group.1 = as.vector(cwb.sd$Group.1))

# 99% CI
z.ci99 <- 2.576
cwb.n99 <- ceiling(((z.ci99 * cwb.sd[!vars.group1])/(cwb.mean[!vars.group1] * 0.05))^2)
cwb.n99 <- cbind(cwb.n99, Group.1 = as.vector(cwb.sd$Group.1))

### Plotting ###

# Axis helper
roundUp <- function(x,to=5)
{
  to*(x%/%to + as.logical(x%%to))
}
limit.upper <- roundUp(max(df$value))
limit.upper <- 30

# Filter the 2 outliers for m3.large (eu)
# * m3.large (eu);sysbench.threads.1.latency;56.05676686
# * m3.large (eu);sysbench.threads.128.latency;54.44602421
df2 <- df[df$value <= limit.upper,]

# RSD threshold
threshold <- 5

# Create plots
pdf(file=out.file, width = 7, height = 8)
p <- ggplot(df2, aes(x = Group.1, y = value)) +
  geom_violin() +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=0.7, binwidth=0.45) +
  scale_x_discrete(name = "Configuration [Instance Type (Region)]") +
  scale_y_continuous(
    name = "Relative Standard Deviation (RSD) [%]",
    breaks = sort(c(seq(0, limit.upper, 10), threshold))) +
  # Threshold line
  geom_hline(yintercept = threshold, color="red") +
  # Additional red threshold label (seems redundant)
  # geom_text(data=data.frame(x=0.5,y=threshold), aes(x, y), label=threshold, vjust=-1, color="red") +
  stat_summary(fun.y=mean, geom="point",
               shape=18, size=3, colour="blue", show.legend = TRUE) +
  # stat_summary(fun.y=median, geom="point", shape=4, size=3, colour = "green") +
  geom_text(data = means, aes(label = value, y = value, hjust = -0.3), color = "blue")
print(p)
dev.off()
# Yield interactively
p
