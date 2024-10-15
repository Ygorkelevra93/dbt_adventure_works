with rename as (
    select
       cast(SALESREASONID as int) as pk_id_motivo_venda
      ,cast(NAME as varchar) as motivo_venda_nome
      ,cast(REASONTYPE as varchar) as motivo_venda_tipo
      ,cast(MODIFIEDDATE as date) as motivo_venda_data_att
    from  {{source('erp_adventure','SALESREASON')}}
)


select * from rename