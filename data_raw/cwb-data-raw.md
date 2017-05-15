# CWB Data Raw

## Column Documentation

| source | benchmark name as in CWB |
| --- | --- |
| benchmark_start_time | UNIX timestamp when the benchmark was triggered to run by CWB (not when the execution was created) |
| execution_status | execution status as in CWB (most commonly FINISHED|FAILED ON PREPARING|FAILED ON RUNNING) see `cloud-workbench/app/models/event.rb` for exhaustive list |
| provider_name | provider name as in CWB (using the [Vagrant provider names](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins)) |
| provider_vm_id | VM identifier as used in CWB (using the Vagrant id) |
| vm_role | Vagrant role as in CWB (for multi-VM benchmarks) |
| metric_name | name of the metric as in the CWB metric definition |
| unit | unit as in the CWB metric definition |
| iteration | number identifying the iteration (usually 1, 2, or 3) of a benchmark within the same instance |
| timestamp | metric UNIX timestamp as submitted by the cloud VM |
| value | the value of the metric as submitted by the cloud VM |
