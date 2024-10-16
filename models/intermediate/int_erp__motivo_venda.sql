with 
    ordemVenda as(
        select 
            distinct pk_ordem_de_venda_ID
        from {{ref("stg_erp__vendas_cabecalho")}}
    ) 
    ,relacaoVenda as  (
        select *
        from {{ref("stg_erp__relacao_venda_motivovenda")}}
    )
    ,motivoVenda as (
        select *
        from {{ref("stg_erp__motivo_venda")}}
    )
    
    ,joined as (
        select 
             ordemVenda.pk_ordem_de_venda_ID  as  PK_ID_ORDEM_DE_VENDA
            ,coalesce(motivoVenda.MOTIVO_VENDA_NOME,'Vazio') as MOTIVO_VENDA_NOME
            ,coalesce(motivoVenda.MOTIVO_VENDA_TIPO,'Vazio') as MOTIVO_VENDA_TIPO
        from ordemVenda 
        left join relacaoVenda on relacaoVenda.pk_id_ordem_de_venda = ordemVenda.pk_ordem_de_venda_ID
        left join motivoVenda on motivoVenda.pk_id_motivo_venda = relacaoVenda.fk_id_temp_motivo_venda
    )
select * from joined    

