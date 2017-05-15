# CWB Data

This repository stores the raw data and analysis scripts for the cloud benchmarking experiments combining micro and application benchmarks.

## Repository Structure

| File | Explanation |
| --- | --- |
| **cwb_db_dumps** | **PostgreSQL database dumps** |
| `├──` [dump-cwb-db.md](cwb_db_dumps/dump-cwb-db.md) | Dump CWB DB docs |
| **data_interim** | **Pre-processed intermediate data** |
| `├──` cwb-data-interim.csv | Pre-processed data via `scripts/pre-process.sh` |
| **data_raw** | **Unaltered raw data as empirically observed** |
| `├──` cwb-data-raw.csv | Exported from CWB via `scripts/cwb_exporter.rb` |
| `├──` cwb-data-raw.log | CWB export log from `scripts/cwb_exporter.rb` |
| `├──` [cwb-data-raw.md](data_raw/cwb-data-raw.md) | CWB export log from `scripts/cwb_exporter.rb` |
| **scripts** | **Data exporting and processing scripts** |
| `├──` [cwb_exporter.md](scripts/cwb_exporter.md) | CWB exporter docs |
| `├──` cwb_exporter.rb | CWB raw data exporter script |
| `├──` cwb_exporter.sh | CWB exporter script runner for production |
| `├──` [pre-process.md](scripts/pre-process.md) | Pre-process docs |
| `├──` pre-process.rmp | RapidMiner Studio process |
| `├──` pre-process.sh | Pre-process runner script |
