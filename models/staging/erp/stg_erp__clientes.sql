with 
    customer as (
        select * 
        from  {{source('erp_adventure','CUSTOMER')}}
    )
    ,rename as (
        select
             cast(CUSTOMERID as int) as pk_id_customer
            ,cast(PERSONID as int) as fk_id_person
            ,cast(STOREID as int) as fk_id_store
            ,cast(TERRITORYID as int) as fk_id_territory
            --,cast(ROWGUID as varchar) as ROWGUID
            ,cast(MODIFIEDDATE as date) as customer_data_att
        from customer
)

select * from rename