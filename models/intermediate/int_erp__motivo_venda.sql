with 
    relacaoVenda as  (
        select *
        from {{ref("stg_erp__relacao_venda_motivovenda")}}
    )
    ,motivoVenda as (
        select *
        from {{ref("stg_erp__motivo_venda")}}
    )
    
    ,joined as (
        select 
             relacaoVenda.PK_ID_ORDEM_DE_VENDA  as  PK_ID_ORDEM_DE_VENDA
            ,motivoVenda.MOTIVO_VENDA_NOME as MOTIVO_VENDA_NOME
            ,motivoVenda.MOTIVO_VENDA_TIPO as MOTIVO_VENDA_TIPO
        from relacaoVenda 
        left join motivoVenda on motivoVenda.pk_id_motivo_venda = relacaoVenda.fk_id_temp_motivo_venda
    )
select * from joined    

