with 
    rename as (
        select
             cast(SALESORDERID as int ) as pk_id_ordem_de_venda
            ,cast(SALESREASONID as int ) as fk_id_temp_motivo_venda
            ,cast(MODIFIEDDATE as date ) as temp_motivo_venda_data_att
        from  {{source('erp_adventure','SalesOrderHeaderSalesReason')}}
)

select * from rename