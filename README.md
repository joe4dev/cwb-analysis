# CWB Data

This repository stores the data (raw and interim) and analysis scripts for the [CWB](https://github.com/sealuzh/cloud-workbench) cloud benchmarking experiments combining micro and application benchmarks.
Every directory contains the data (incl. docs) and scripts (incl. docs) to produce or update this data.

## Paper

J. Scheuner and P. Leitner, “[Estimating Cloud Application Performance Based on Micro-Benchmark Profiling](https://doi.org/10.1109/CLOUD.2018.00019),” 2018 IEEE 11th International Conference on Cloud Computing (CLOUD), [PDF, slides, code, etc](https://joelscheuner.com/publication/scheuner-18-cloud/)

### Abstract

The continuing growth of the cloud computing market has led to an unprecedented diversity of cloud services. To support service selection, micro-benchmarks are commonly used to identify the best performing cloud service. However, it remains unclear how relevant these synthetic micro-benchmarks are for gaining insights into the performance of real-world applications. Therefore, this paper develops a cloud benchmarking methodology that uses micro-benchmarks to profile applications and subsequently predicts how an application performs on a wide range of cloud services. A study with a real cloud provider (Amazon EC2) has been conducted to quantitatively evaluate the estimation model with 38 metrics from 23 micro-benchmarks and 2 applications from different domains. The results reveal remarkably low variability in cloud service performance and show that selected micro-benchmarks can estimate the duration of a scientific computing application with a relative error of less than 10% and the response time of a Web serving application with a relative error between 10% and 20%. In conclusion, this paper emphasizes the importance of cloud benchmarking by substantiating the suitability of micro-benchmarks for estimating application performance in comparison to common baselines but also highlights that only selected micro-benchmarks are relevant to estimate the performance of a particular application.

### Citation

```bibtex
@inproceedings{scheuner:18-cloud,
  author = {Scheuner, Joel and Leitner, Philipp},
  booktitle = {2018 IEEE 11th International Conference on Cloud Computing
  (CLOUD)},
  doi = {10.1109/CLOUD.2018.00019},
  month = {July},
  pages = {90--97},
  publisher = {IEEE},
  title = {Estimating Cloud Application Performance Based on
  Micro-Benchmark Profiling},
  year = {2018}
}
```

## Repository Structure

| File | Explanation |
| --- | --- |
| **db_dumps** | **PostgreSQL database dumps from CWB** |
| `├──` *cloud_workbench_production.sql* | Exported from CWB via `dump-cwb-db.sh` |
| `├──` [dump-cwb-db.md](db_dumps/dump-cwb-db.md) | Dump CWB DB docs |
| `├──` dump-cwb-db.sh | Dumps CWB DB to `cloud_workbench_production.sql` |
| **data_interim** | **Pre-processed intermediate data** |
| `├──` *cwb-data-interim.csv* | Pre-processed raw data via `pre-process.sh` |
| `├──` [cwb-data-interim.md](data_interim/cwb-data-interim.md) | Describes the interim (i.e., pre-processed) data set |
| `├──` [pre-process.md](data_interim/pre-process.md) | Pre-process docs |
| `├──` pre-process.rmp | [RapidMiner Studio](https://rapidminer.com/products/studio/) process |
| `├──` pre-process.sh | Pre-process runner script |
| **data_raw** | **Unaltered raw data as empirically observed** |
| `├──` *cwb-data-raw.csv* | Exported from CWB via `export-cwb-data.sh` or `export-cwb-data_local.sh` |
| `├──` [cwb-data-raw.md](data_raw/cwb-data-raw.md) | Describes the raw data set |
| `├──` [export-cwb-data.md](data_raw/export-cwb-data.md) | CWB exporter docs |
| `├──` export-cwb-data.rb | CWB raw data exporter script |
| `├──` export-cwb-data.sh | Exports CWB data to `cwb-data-raw.csv` |
| `├──` export-cwb-data-local.sh | Exports local CWB data to `cwb-data-raw.csv` |

## Software Requirements

* Initially created with RapidMiner Studio 7.5.001 but also compatible with 9.7.1. Free [educational](https://rapidminer.com/educational-program/) license available.
  * Statistical tests require the extension `Statistics Extension` (e.g., 2.3.456), which is available through the extensions marketplace.
  * For CLI execution, verify the RapidMiner path in the *.sh scripts (alternatively add scripts directory to the PATH).
    * MacOS: `RMP_BIN="/Applications/RapidMiner Studio.app/Contents/Resources/RapidMiner-Studio/scripts/rapidminer-batch-osx.sh"`
* Plots are created with [R](https://www.r-project.org/about.html) (e.g., 3.61). Dependencies are declared in every script.
  * Install all dependencies via `RScript install-dependencies.R`

## Steps to Reproduce

1. **data_interim**: `cd data_interim && ./pre-process.sh`
2. **rq1 (prestudy CVs)**: `cd rq1 && ./rq1.sh` (depends on step 1)
3. **rq2 (estimation model)**: `cd rq2 && ./rq2.sh` (depends on step 1)
