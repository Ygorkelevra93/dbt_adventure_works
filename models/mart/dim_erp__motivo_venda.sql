with rename as (
    select 
     PK_ID_MOTIVO_VENDA as "Id Tipo Venda"
    ,MOTIVO_VENDA_NOME as "TIpo Venda"
    ,MOTIVO_VENDA_TIPO as "Classificação Tipo Venda "
    --,MOTIVO_VENDA_DATA_ATT as "Data Atualização"
    from {{ref("stg_erp__motivo_venda")}}
)


select * from rename