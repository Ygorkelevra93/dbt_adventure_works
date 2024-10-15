with subcategoria as (
    select * 
    from  {{source('erp_adventure','PRODUCTSUBCATEGORY')}}

), 
rename as(
    select 
     cast(PRODUCTSUBCATEGORYID as int) as pk_id_subcategoria
    ,cast(PRODUCTCATEGORYID as int) as fk_id_categoria
    ,cast(NAME as varchar) as subcategoria_nome
    --,cast(ROWGUID as varchar) as ROWGUID
    ,cast(MODIFIEDDATE as date) as subcategoria_data_att
    from subcategoria
)

select * from rename