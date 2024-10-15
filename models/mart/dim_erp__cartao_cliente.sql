with 
    rename as (
        select 
             PK_ID_CARTAO_CLIENTE as "ID Cartão Cliente"
            ,CARTAO_CLIENTE_TIPO_CARTAO as "Tipo Cartão Cliente"
            ,CARTAO_CLIENTE_MES_EXPIRA as "Mês Expiração"
            ,CARTAO_CLIENTE_ANO_EXPIRA as "Ano Expiração"
            ,CARTAO_CLIENTE_DATA_EXPIRA  as "Data Expiração"
        from {{ref("int_erp__tipo_cartao")}}
)

select * from rename