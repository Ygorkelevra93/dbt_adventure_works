with categoria as (
    select * 
    from  {{source('erp_adventure','PRODUCTCATEGORY')}}
),
rename as (
    select
     cast(PRODUCTCATEGORYID as int) as pk_id_categoria
    ,cast(NAME as varchar) as categoria_nome
    --,cast(ROWGUID as varchar) as ROWGUID
    ,cast(MODIFIEDDATE as date) as categoria_data_att
    from categoria
)


select * from rename