with 
    loja as (
        select 
             cast(BUSINESSENTITYID as varchar) as pk_id_store
            ,cast(NAME as varchar) as store_name

        from  {{source('erp_adventure','STORE')}}
    )
select * from loja
