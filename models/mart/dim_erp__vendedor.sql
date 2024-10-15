with 
    rename as (
        select 
              PK_ID_SALESPERSON as "ID Vendedor"
             ,FK_ID_TERRITORIO as "ID Território Vendedor"
             ,SALESPERSON_NOME as "Vendedor"
             ,SALESPERSON_TIPO_CLIENTE_COD as "Tipo Pessoa Cód"
             ,SALESPERSON_TIPO_CLIENTE as "Tipo Pessoa"
             ,SALESPERSON_META as "Meta Vendedor"
             ,SALESPERSON_BONUS as "Bônus Vendedor"
             ,SALESPERSON_COMISSAO as "Percentual Comissão"
             ,SALESPERSON_VENDAS_ACUMULADAS as "Vendas Acumuladas no Ano / Vendedor"
             ,SALESPERSON_VENDAS_ANO_ANTERIOR as "Vendas Período Anterior / Vendedor"
        from {{ref("int_erp__vendedor")}}
)

select * from rename

