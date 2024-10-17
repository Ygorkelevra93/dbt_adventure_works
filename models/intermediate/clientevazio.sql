with 
    clientes as(
        select * 
        from {{ref("stg_erp__clientes")}}
    )

    ,person as (
        select*
        from {{ref("stg_erp__person")}}
    )
    ,store as (
        select *
        from {{ref("stg_erp__loja")}}
    )
    ,vendas as (
        select 
            PK_ORDEM_DE_VENDA_ID
            ,FK_ID_CLIENTE
        from {{ref("stg_erp__vendas_cabecalho")}}
    )

    
    ,joined as (
        select
            PK_ORDEM_DE_VENDA_ID
            ,FK_ID_CLIENTE
            ,clientes.fk_id_person
            ,clientes.fk_id_store
            ,clientes.fk_id_territory
            --,person.PERSON_TIPO_COD
            ,person.PERSON_TIPO_NOME
            ,person.PERSON_NAME
            ,store.STORE_NAME
            ,coalesce(person.PERSON_NAME, store.STORE_NAME ) as nome
            
        from vendas
        left join clientes on clientes.pk_id_customer = vendas.fk_id_cliente
        left join person on person.PK_ID_PERSON_ENTIDADE_NEGOCIO = clientes.FK_ID_PERSON
        left join store on store.PK_ID_STORE = clientes.fk_id_store
    )


select * from joined
--where pk_id_customer = '29825'
where nome is null 
     --fk_id_cliente = '11000'