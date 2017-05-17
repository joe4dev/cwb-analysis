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
