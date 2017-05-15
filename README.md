# CWB Data

This repository stores the raw data and analysis scripts for the cloud benchmarking experiments combining micro and application benchmarks.

## Repository Structure

```
.
├── cwb_db_dumps            ## PostgreSQL database dumps
├── data_raw                ## Unaltered raw data as empirically observed
    ├── cwb-data-raw.csv    # Exported from CWB via `scripts/cwb_exporter.rb`
    ├── cwb-data-raw.log    # CWB export log from `scripts/cwb_exporter.rb`
├── data_cleaned            ## Pre-processed intermediate data
├── scripts                 ## Data exporting and processing scripts
    ├── cwb_exporter.rb     # CWB raw data exporter script
    ├── cwb_exporter.sh     # CWB exporter script runner for production
    ├── pre-process.sh      # Pre-process runner script
    ├── pre-process.rmp     # RapidMiner Studio process
    ├── pre-process.md      # Pre-process documentation
```

## Export Raw Data from CWB

### Production

```shell
scp -r scripts/cwb_exporter.* ubuntu@$CWB:/home/ubuntu/
ssh ubuntu@$CWB
bash cwb_exporter.sh >cwb-raw-data.csv 2>cwb-raw-data.log
```

### Development (local)

```shell
cwd=$(pwd)
cd $CWB_REPO_PATH
bin/rails runner $cwd/scripts/cwb_exporter.rb >$cwd/data_raw/cwb-data-raw.csv 2>$cwd/data_raw/cwb-data-raw.log
cd $cwd
```

## PostgreSQL Database Dumps

### Export

```shell
pg_dump cloud_workbench_production -U cloud -h localhost > dump.sql
```

### Import

```shell
createuser cloud
sudo -u postgres createdb cloud_workbench_production --owner=cloud
psql -U cloud -d cloud_workbench_production -f dump.sql
```
