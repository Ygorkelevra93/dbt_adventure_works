with rename as (
    select
     cast(SHIPMETHODID as int) as pk_id_tipo_entrega
    ,cast(NAME as varchar) as tipo_entrega_transportadora
    ,cast(SHIPBASE as float) as tipo_entrega_volume_minimo
    ,cast(SHIPRATE as float) as tipo_entrega_valor_cobrado -- per pound
    ,cast(ROWGUID as varchar) as tipo_entrega_GUID
    ,cast(MODIFIEDDATE as date) as tipo_entrega_data_att
    from  {{source('erp_adventure','SHIPMETHOD')}}

)


select * from rename
