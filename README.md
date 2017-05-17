# CWB Data

This repository stores the data (raw and interim) and analysis scripts for the [CWB](https://github.com/sealuzh/cloud-workbench) cloud benchmarking experiments combining micro and application benchmarks.
Every directory contains the data (incl. docs) and scripts (incl. docs) to produce or update this data.

## Repository Structure

| File | Explanation |
| --- | --- |
| **db_dumps** | **PostgreSQL database dumps from CWB** |
| `├──` **cloud_workbench_production.sql** | Exported from CWB via `dump-cwb-db.sh` |
| `├──` [dump-cwb-db.md](db_dumps/dump-cwb-db.md) | Dump CWB DB docs |
| `├──` dump-cwb-db.sh | Dumps CWB DB to `cloud_workbench_production.sql` |
| **data_interim** | **Pre-processed intermediate data** |
| `├──` **cwb-data-interim.csv** | Pre-processed raw data via `pre-process.sh` |
| `├──` [cwb-data-interim.md](data_interim/cwb-data-interim.md) | Describes the interim (i.e., pre-processed) data set |
| `├──` [pre-process.md](data_interim/pre-process.md) | Pre-process docs |
| `├──` pre-process.rmp | [RapidMiner Studio](https://rapidminer.com/products/studio/) process |
| `├──` pre-process.sh | Pre-process runner script |
| **data_raw** | **Unaltered raw data as empirically observed** |
| `├──` **cwb-data-raw.csv** | Exported from CWB via `export-cwb-data.sh` or `export-cwb-data_local.sh` |
| `├──` [cwb-data-raw.md](data_raw/cwb-data-raw.md) | Describes the raw data set |
| `├──` [export-cwb-data.md](data_raw/export-cwb-data.md) | CWB exporter docs |
| `├──` export-cwb-data.rb | CWB raw data exporter script |
| `├──` export-cwb-data.sh | Exports CWB data to `cwb-data-raw.csv` |
| `├──` export-cwb-data-local.sh | Exports local CWB data to `cwb-data-raw.csv` |
