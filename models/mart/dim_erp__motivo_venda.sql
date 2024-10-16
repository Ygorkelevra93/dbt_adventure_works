with 
    rename as (
        select 
             PK_ID_ORDEM_DE_VENDA as "Id Ordem de Venda"
            ,MOTIVO_VENDA_NOME as "Tipo Venda"
            ,MOTIVO_VENDA_TIPO as "Classificação Tipo Venda "
        from {{ref("int_erp__motivo_venda")}}
)

select * from rename