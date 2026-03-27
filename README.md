# DBT exploration

## Initialize

```bash
pip install dbt-postgres
./create-db.sh  # create a postgres instance in docker
dbt seed        # initialize some data
dbt run         # create the materialization
dbt test        # validate
```

## Manual inspection of unique users

```bash
dbt run-operation dump_table --args '{"model_name": "fct_orders", "limit": 50}'
```
