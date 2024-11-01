import pandas as pd

def model(dbt, session):
    dbt.config(packages=["pandas"])

    fct_orders = dbt.ref("fct_orders")

    return fct_orders