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
