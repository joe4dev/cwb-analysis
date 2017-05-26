library(ggplot2)
library(data.table)

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
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)

# Prepare plot date
test$group <- "test"
train$group <- "train"
visual <- rbind(test, train)

# Generate plot
pdf(file=out.file, width = 7.50, height = 8)
p <- ggplot(visual, aes_string(x=micro, y=label, group='group', col='group', fill='group')) +
  # Color according to:
  # library(scales)
  # show_col(hue_pal()(2))
  geom_smooth(data=train, aes_string(x=micro, y=label), fill="blue",
            colour="#00BFC4", size=1, method = "lm") +
  geom_point() +
  labs(x = "Sysbench CPU - Multi Thread Duration [s]") +
  labs(y = "WPBench Scenario 1 - Response Time [ms]")
  # geom_smooth(method = "lm")
print(p)
dev.off()

# Yield interactively
p

# MAYBE: Scatterplot matrix: http://www.statmethods.net/graphs/scatterplot.html
