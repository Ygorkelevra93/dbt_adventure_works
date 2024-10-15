with 
    rename as (
        select
             cast(CREDITCARDID as int) as pk_id_cartao_cliente
            ,cast(CARDTYPE as varchar) as cartao_cliente_tipo_cartao
            ,cast(CARDNUMBER as varchar) as cartao_cliente_numero
            ,cast(EXPMONTH as int) as cartao_cliente_mes_expira
            ,cast(EXPYEAR as int) as cartao_cliente_ano_expira
            ,cast(MODIFIEDDATE as date) as cartao_cliente_data_att
        from  {{source('erp_adventure','CREDITCARD')}}
)

select * from rename
