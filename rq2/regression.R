library(ggplot2)
library(data.table)
library(dplyr) # For the pipe "%>%" operator and filter

### BEGIN CONFIGUARION ###
# script.dir <- dirname(sys.frame(1)$ofile) # doesn't work in CLI

# Input directory where the input CSV is located
src.dir <- '~/Projects/CloudWorkBench/cwb-analysis/rq2' # script.dir
src.file_name <- 'all.csv'

# Output directory where the resulting PDF will be saved
out.dir <- '~/Papers/tex16-master-thesis-17/img' # script.dir
out.file_name <- 'regression-graph.pdf'

### END CONFIGURATION ###

# CWB data source
src.file <- file.path(src.dir, src.file_name)

# Output
out.file <- file.path(out.dir, out.file_name)

# Read CSV
all.csv <- read.csv(src.file, header = TRUE, sep = ';')

# Split train and test data
all <- data.table(all.csv, key = 'provider_vm_id_iteration')
train <- data.table(all %>% filter(instance.type == "m1.small" | instance.type == "c1.xlarge"), key = 'provider_vm_id_iteration')
test <- all[!train]

# Define label and benchmark for linear model
label <- 'wordpress.bench.s1.response_time'
micro <- 'sysbench.cpu.multi.thread.duration'

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
actuals_preds$relErr <- (actuals_preds$predicteds - actuals_preds$actuals)/actuals_preds$actuals
actuals_preds$instance.type <- test$instance.type
mape <- mean(abs(actuals_preds$relErr))

actuals_preds.mean <- aggregate(actuals_preds[,names(actuals_preds) != "instance.type"], by=list(actuals_preds$instance.type), FUN=mean)

# Prepare plot date
test$group <- "test"
train$group <- "train"
visual <- rbind(test, train)

# Order instance type labels
visual$instance.type <- factor(visual$instance.type, levels=c("m1.small", "m3.medium (pv)", "m3.medium (hvm)", "m1.medium", "m3.large", "m1.large", "c3.large", "m4.large", "c4.large", "c4.xlarge", "c3.xlarge", "c1.xlarge"))

# Generate plot
pdf(file=out.file, width = 7.50, height = 8)
p <- ggplot(visual, aes_string(x=micro, y=label, group='group', col='instance.type', fill='instance.type', shape = 'group')) +
  # Color according to:
  # library(scales)
  # show_col(hue_pal()(2))
  geom_smooth(data=train, aes_string(x=micro, y=label), fill="blue",
            colour="black", size=0.4, method = "lm") +
  geom_point(size=3) +
  labs(x = "Sysbench CPU - Multi Thread Duration [s]") +
  labs(y = "WPBench Read - Response Time [ms]") +
  scale_shape_discrete("Group") +
  scale_color_discrete("Instance Type") +
  scale_fill_discrete("Instance Type")

  # geom_smooth(method = "lm")
print(p)
dev.off()

# Yield interactively
p

# MAYBE: Scatterplot matrix: http://www.statmethods.net/graphs/scatterplot.html
