library(ggplot2)
library(data.table)
library(dplyr) # For the pipe "%>%" operator and filter
library(RColorBrewer)

### BEGIN CONFIGUARION ###
# script.dir <- dirname(sys.frame(1)$ofile) # doesn't work in CLI

# Input directory where the input CSV is located
src.dir <- '~/Projects/CloudWorkBench/cwb-analysis/rq2' # script.dir
src.file_name <- 'all.csv'

# Output directory where the resulting PDF will be saved
out.dir <- '~/Dropbox/Papers/tex18-app-perf-cloud18/img' # script.dir
out.file_name <- 'wpbench-regression.pdf'

# Define label and benchmark for linear model
label <- 'wordpress.bench.s1.response_time'
# label <- 'md.sim.duration'
micro <- 'sysbench.cpu.multi.thread.duration'

# label <- 'wordpress.bench.s1.throughput'
# micro <- 'stressng.network.icmp.flood.bogo.ops'
# micro <- 'ecu'

bound.upper <- "c1.xlarge"
# bound.upper <- "c4.large"
bound.lower <- "m1.small"

### END CONFIGURATION ###

# No scientific number notation
options(scipen=999)

# CWB data source
src.file <- file.path(src.dir, src.file_name)

# Output
out.file <- file.path(out.dir, out.file_name)

# Read CSV
all.csv <- read.csv(src.file, header = TRUE, sep = ';')

# Split train and test data
all <- data.table(all.csv, key = 'provider_vm_id_iteration')
# all <- all[all$iteration == "2",] # Filter iteration
train <- data.table(all %>% filter(instance.type == bound.lower | instance.type == bound.upper), key = 'provider_vm_id_iteration')
test <- all[!train]

# Train linear model
model <- lm(as.formula(paste(label, micro, sep = " ~ ")), data=train)
# + sysbench.cpu.single.thread.duration + stressng.network.udp.bogo.ops + vcpus + ecu + instance.type + fio.8k.rand.read.disk.util
summary(model)

# Test model
# se.fit = TRUE
# interval="confidence"
appPred = predict(model, test)
actuals_preds <- data.frame(cbind(actuals=test[[label]], predicteds=appPred))#, instance.type=test$instance.type) 


# Calculate metrics
correlation_accuracy <- cor(actuals_preds)

min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))
absPerErr <- abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals
absPerErr.grouped <- absPerErr[seq(1, length(absPerErr), 3)]
actuals_preds$relErr <- abs((actuals_preds$predicteds - actuals_preds$actuals)/actuals_preds$actuals)
actuals_preds$instance.type <- test$instance.type
mape <- mean(abs(actuals_preds$relErr))

actuals_preds.mean <- aggregate(actuals_preds[,names(actuals_preds) != "instance.type"], by=list(actuals_preds$instance.type), FUN=mean)

# Maximum estimation error: This values gives an indication how far apart the actual min and max values are (i.e., how easy it is to obtain a large error).
min_max_factor <- (max(actuals_preds.mean$actuals)-min(actuals_preds.mean$actuals))/min(actuals_preds.mean$actuals)

# Prepare plot date
test$group <- "test"
train$group <- "train"
visual <- rbind(test, train)

# Order instance type labels
visual$instance.type <- factor(visual$instance.type, levels=c("m1.small", "m3.medium (pv)", "m3.medium (hvm)", "m1.medium", "m3.large", "m1.large", "c3.large", "m4.large", "c4.large", "c3.xlarge", "c4.xlarge", "c1.xlarge"))

# Create color palette with distinct colors
# n <- nrow(actuals_preds.mean)
n <- length(unique(all$instance.type))
# Expand default color palette:
# http://novyden.blogspot.ch/2013/09/how-to-expand-color-palette-with-ggplot.html
# Also see: http://www.sthda.com/english/wiki/ggplot2-colors-how-to-change-colors-automatically-and-manually
myPalette <- colorRampPalette(brewer.pal(9, "Set1"))(n)

# Generate plot
p <- ggplot(visual, aes_string(x=micro, y=label, col='instance.type', group='group', shape = 'group')) +
  # Color according to:
  # library(scales)
  # show_col(hue_pal()(2))
  geom_smooth(data=train, aes_string(x=micro, y=label),
            colour="black", size=0.4, method = "lm") +
  geom_point(size=6, colour = "gray20", show.legend = FALSE, alpha=1) +
  geom_point(size=4, alpha=0.6) +
  labs(x = "Sysbench - CPU Multi Thread Duration [s]") +
  labs(y = "WPBench Read - Response Time [ms]") +
  scale_shape_discrete("Group") +
  scale_color_discrete("Instance Type")
  # scale_color_manual("Instance Type", values = myPalette)
ggsave(out.file, width = 7, height = 4.5, device=cairo_pdf)

# Yield interactively
p

# MAYBE: Scatterplot matrix: http://www.statmethods.net/graphs/scatterplot.html
