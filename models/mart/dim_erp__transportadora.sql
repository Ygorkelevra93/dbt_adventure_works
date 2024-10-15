with rename as (
    select 
     PK_ID_TIPO_ENTREGA as "ID Transportadora"
    ,TIPO_ENTREGA_TRANSPORTADORA as "Transportadora "
    --,TIPO_ENTREGA_VOLUME_MINIMO
    --,TIPO_ENTREGA_VALOR_COBRADO
    --,TIPO_ENTREGA_GUID
    --,TIPO_ENTREGA_DATA_ATT    
    from {{ref("stg_erp__tipo_entrega")}}
)


select * from rename