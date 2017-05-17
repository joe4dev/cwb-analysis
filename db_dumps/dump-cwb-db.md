# PostgreSQL Database Dumps

## Setup for Automation

1. Save login credentials via a [password file](https://www.postgresql.org/docs/9.6/static/libpq-pgpass.html). Adjust credentials accordingly!
2. Adjust the first SSH command here and in `dump-cwb-db.sh`:

```
ssh -i ~/.ssh/cloud-benchmarking.pem ubuntu@cwb.io
echo "localhost:5432:cloud_workbench_production:postgres:rootcloud" > ~/.pgpass
chmod 0600 ~/.pgpass
```

## Export

```
./dump-cwb-db.sh
```

### Manual Export

```shell
pg_dump cloud_workbench_production -U postgres -h localhost -f cloud_workbench_production.sql
```

Note: The cloud user (i.e., `-U cloud`) would be sufficient too.

### Manual Import

```shell
createuser cloud
sudo -u postgres createdb cloud_workbench_production --owner=cloud
psql -U cloud -d cloud_workbench_production -f cloud_workbench_production.sql
```
