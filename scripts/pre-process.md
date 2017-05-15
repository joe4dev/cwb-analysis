# Pre-Process

## Run the RapidMiner Process

Precondition:
  * `rapidminer-batch.sh` is in the PATH and symlinked to the RapidMiner Studio app (e.g., `/Applications/RapidMiner Studio.app/Contents/Resources/RapidMiner-Studio/scripts/rapidminer-batch.sh`)

```shell
./pre-process.sh
```

## Missing Values

### Per Instance

These metrics are only reported once per instance by design and thus are expected to have missing values for the iteration 2 and 3.

| *Metric* |
| --- |
| benchmark/order |
| fio/version |
| instance/cpu-cores |
| instance/cpu-model |
| instance/gcc-version |
| instance/ram-total |
| iperf/version |
| stressng/version |
| sysbench/version |

### Static

These metrics report static values (e.g., duration) by design and thus the missing values can simply be replaced with a static value.

| *Metric* | *Replacement Value* | *# Missing* |
| --- | --- | --- |
| iperf/multi-thread-duration¹ | 30 | 348 |
| iperf/single-thread-duration¹ | 30 | 348 |
| fio/8k-rand-write-duration¹ | 60000 | 348 |

¹ The duration attributes for iperf and fio were introduced during the experiment to consistently report the duration for each benchmark.

### Dynamic but Similar within Source

| *Metric* | *Replacement Method* | *# Missing* |
| --- | --- | --- |
| fio/4k-seq-write-duration¹ | Average | 348 |
| sysbench/fileio-4k-rand-read-prepare-duration¹ | Average | 348 |

¹ The duration attributes for fio and sysbench were introduced during the experiment to consistently report the duration for each benchmark. They do exhibit certain variation but when controlling for the source (i.e., the instance type), variation is smaller and therefore the average method has been chosen to replace these missing value. *Disclaimer:* Do *NOT* rely on these two attributes when conducting an analysis where exact duration values are required.

### Dynamic

| *Metric* | *Replacement Method* | *# Missing* | *Source* |
| --- | --- | --- | --- |
| fio/4k-seq-write-latency¹ | Average | 1 | rmit-combined_v3_aws-us_m3.medium |
| sysbench/fileio-4k-rand-write-throughput² | Average | 5 | rmit-combined_v3_aws-us_m1.small |

¹ There is no particular reason that can explain why a single value is missing here. Maybe the metric extraction didn't work properly from the standard output of the benchmark tool. Replacing this single value with the average shouldn't change the nature of the data for this attribute as only 1 value out of 105 examples is missing (i.e., <1% of the data points).

² These 5 missing values were caused due to value-dependent unit reporting of the Sysbench tool that was not considered in the metric extraction at first.
Values below 1 Mb/sec are reported in `Kb/sec` instead of the default Mb/sec. Before the adjustments made to the sysbench/fileio metric extraction, these values didn't match the regex and thus were ignored. Imputing these values might slightly change the shape of the data for this attribute given that 5 out of 99 values are missing (i.e., ~5% of the data points).
