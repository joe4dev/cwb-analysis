# CWB Data Interim

## Column Documentation

* Suffixes
  * `-duration`: execution time (prepare-duration: preparation time)
  * `-version`: version number
* Value types
  * ¹ [Benchmark Static] Static within the `rmit-combined` benchmark definition (e.g., predefined iperf runtime of 30s)
  * ² [Iteration Static] Static within the same `iteration` (e.g., all 2nd iterations have the same value)
  * ³ [Instance Type Static] Static within the same `instance type` (e.g., has the same value for all m1.small)
  * ⁴ [Instance Static] Static within the same `instance` (e.g., every instance has its unique provider_vm_id)
  * ⁵ [Sample Dynamic] `Dynamic` value for every new `sample`
    * ⁵⁵ Durations that are dynamic but not the main metric of interest
* Warnings: Denote that [pre-process.md](pre-process.md) might have changed this data
  * (!) Expect a *slight* change in the nature of the data
  * (!!) Expect a *strong* change in the nature of the data

| Column (i.e., Metric Name) | Unit | Explanation |
| --- | --- | --- |
| **provider_vm_id_iteration⁵** | row ID | concatenation of <provider_vm_id>_<iteration> used for pivot |
| **provider_vm_id⁴** | N/A | VM identifier as used in CWB (using the Vagrant id)  |
| **iteration²** | number | number identifying the iteration (usually 1, 2, or 3) of a benchmark within the same instance |
| **source** | N/A | benchmark name as in CWB |
| benchmark/order⁴ | [{benchmark class name}, ...] | |
| fio/4k-seq-write-bandwidth⁵ | KiB/s | |
| fio/4k-seq-write-disk-util⁵ | % | |
| fio/4k-seq-write-duration⁵⁵ (!!) | milliseconds | |
| fio/4k-seq-write-iops⁵ | iops | |
| fio/4k-seq-write-latency⁵ (!) | microseconds | |
| fio/4k-seq-write-latency-95-percentile⁵ | microseconds | |
| fio/8k-rand-read-bandwidth⁵ | KiB/s | |
| fio/8k-rand-read-disk-util⁵ | % | |
| fio/8k-rand-read-duration¹ | milliseconds | |
| fio/8k-rand-read-iops⁵ | iops | |
| fio/8k-rand-read-latency⁵ | microseconds | |
| fio/8k-rand-read-latency-95-percentile⁵ | microseconds | |
| fio/version¹ | version number | |
| instance/cpu-cores³ | number of cores | |
| instance/cpu-model³ | model name | |
| instance/gcc-version¹ | version number | |
| instance/ram-total³ | kB | |
| iperf/multi-thread-bandwidth⁵ | Mbits/sec or Gbits/sec | |
| iperf/multi-thread-duration¹ | seconds | |
| iperf/single-thread-bandwidth⁵ | Mbits/sec or Gbits/sec | |
| iperf/single-thread-duration¹ | seconds | |
| iperf/version¹ | version number | |
| md-sim-duration⁵ | seconds | |
| stressng/cpu-callfunc-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-callfunc-duration¹ | seconds | |
| stressng/cpu-double-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-double-duration¹ | seconds | |
| stressng/cpu-euler-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-euler-duration¹ | seconds | |
| stressng/cpu-fft-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-fft-duration¹ | seconds | |
| stressng/cpu-fibonacci-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-fibonacci-duration¹ | seconds | |
| stressng/cpu-int64-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-int64-duration¹ | seconds | |
| stressng/cpu-loop-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-loop-duration¹ | seconds | |
| stressng/cpu-matrixprod-bogo-ops⁵ | bogo operations per second | |
| stressng/cpu-matrixprod-duration¹ | seconds | |
| stressng/network-epoll-bogo-ops⁵ | bogo operations per second | |
| stressng/network-icmp-flood-bogo-ops⁵ | bogo operations per second | |
| stressng/network-sockfd-bogo-ops⁵ | bogo operations per second | |
| stressng/network-total-duration¹ | seconds | |
| stressng/network-udp-bogo-ops⁵ | bogo operations per second | |
| stressng/version¹ | version number | |
| sysbench/cpu-multi-thread-duration⁵ | seconds | |
| sysbench/cpu-single-thread-duration⁵ | seconds | |
| sysbench/fileio-1m-seq-write-duration⁵⁵ | seconds | |
| sysbench/fileio-1m-seq-write-latency⁵ | milliseconds | |
| sysbench/fileio-1m-seq-write-latency-95-percentile⁵ | milliseconds | |
| sysbench/fileio-1m-seq-write-throughput⁵ | Mb/s | |
| sysbench/fileio-4k-rand-read-duration⁵⁵  | seconds | |
| sysbench/fileio-4k-rand-read-latency⁵ | milliseconds | |
| sysbench/fileio-4k-rand-read-latency-95-percentile⁵ | milliseconds | |
| sysbench/fileio-4k-rand-read-prepare-duration⁵⁵ (!!) | seconds | |
| sysbench/fileio-4k-rand-read-throughput⁵ | Mb/s | |
| sysbench/fileio-4k-rand-write-duration⁵⁵ | seconds | |
| sysbench/fileio-4k-rand-write-latency⁵ | milliseconds | |
| sysbench/fileio-4k-rand-write-latency-95-percentile⁵ | milliseconds | |
| sysbench/fileio-4k-rand-write-throughput⁵ (!) | Mb/s | |
| sysbench/fileio-file-total-size³ | GB | |
| sysbench/memory-default-block-size-duration¹ | seconds | |
| sysbench/memory-default-block-size-throughput⁵ | MB/s | |
| sysbench/memory-large-block-size-duration¹ | seconds | |
| sysbench/memory-large-block-size-throughput⁵ | MB/s | |
| sysbench/mutex-duration⁵ | seconds | |
| sysbench/mutex-latency⁵ | milliseconds | |
| sysbench/threads-1-duration⁵ | seconds | |
| sysbench/threads-1-latency⁵ | milliseconds | |
| sysbench/threads-128-duration⁵ | seconds | |
| sysbench/threads-128-latency⁵ | milliseconds | |
| sysbench/version¹ | version number | |
| wordpress-bench/s1-failure_rate⁵  | ratio | |
| wordpress-bench/s1-num_failures⁵  | count | |
| wordpress-bench/s1-response_time⁵ | milliseconds | |
| wordpress-bench/s1-throughput⁵    | requests per second | |
| wordpress-bench/s2-failure_rate⁵  | ratio | |
| wordpress-bench/s2-num_failures⁵  | count | |
| wordpress-bench/s2-response_time⁵ | milliseconds | |
| wordpress-bench/s2-throughput⁵    | requests per second | |
| wordpress-bench/s3-failure_rate⁵  | ratio | |
| wordpress-bench/s3-num_failures⁵  | count | |
| wordpress-bench/s3-response_time⁵ | milliseconds | |
| wordpress-bench/s3-throughput⁵    | requests per second | |

## Source Mapping

This table clarifies the not fully consistent CWB naming scheme due to benchmark evolution. The rules are as follows:

* no region prefix => eu-west-1a
* `eu` region prefix => eu-west-1a
* `us` region prefix => us-east-1a

| **CWB Benchmark Name** | **Region** |
| --- | --- |
| rmit-combined_v3_aws-eu_m1.small | eu-west-1a |
| rmit-combined_v3_aws-us_m1.small | us-east-1a |
| rmit-combined_v3_aws-us_m3.medium | us-east-1a |
| rmit-combined_v3_aws_c4.large | eu-west-1a |
| rmit-combined_v3_aws_m3.large | eu-west-1a |
| rmit-combined_v3_aws_m3.medium | eu-west-1a |
