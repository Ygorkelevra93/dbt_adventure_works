with 
    rename as (
        select 
             PK_ID_TIPO_ENTREGA as "ID Transportadora"
            ,TIPO_ENTREGA_TRANSPORTADORA as "Transportadora "
        from {{ref("stg_erp__tipo_entrega")}}
)

select * from rename