with 
    rename as (
        select 
             PK_ID_CARTAO_CLIENTE 
            ,CARTAO_CLIENTE_TIPO_CARTAO 
            ,CARTAO_CLIENTE_NUMERO 
            ,CARTAO_CLIENTE_MES_EXPIRA 
            ,CARTAO_CLIENTE_ANO_EXPIRA 
            ,CARTAO_CLIENTE_MES_EXPIRA ||'/'||CARTAO_CLIENTE_ANO_EXPIRA  as "CARTAO_CLIENTE_DATA_EXPIRA"
            ,CARTAO_CLIENTE_DATA_ATT
        from {{ref("stg_erp__cartao_credito_cliente")}}
)

select * from rename