{{
    config(
        materialized = "table"
    )
}}

{{ dbt_date.get_date_dimension("2011-05-31", "2014-07-01") }}


