with 
    clientes as(
        select * 
        from {{ref("stg_erp__clientes")}}
    )

    ,person as (
        select*
        from {{ref("stg_erp__person")}} --where PK_ID_PERSON_ENTIDADE_NEGOCIO = '1704'
    )
    ,store as (
        select *
        from {{ref("stg_erp__loja")}}
    )

    ,rename_join as (
        select
             pk_id_customer
            ,PK_ID_PERSON_ENTIDADE_NEGOCIO
            ,PERSON_TIPO_COD
            ,PERSON_TIPO_NOME
            ,PERSON_NAME            
            ,PERSON_TIPO_EMAIL_PROMOCIONAL
            ,PERSON_DATA_ATT
        from clientes
        left join person on clientes.fk_id_person = person.pk_id_person_entidade_negocio
        left join store on store.pk_id_store = clientes.fk_id_store
   )

select * from rename_join
-- where pk_id_customer = '20562' --testes para buscar o cliente com nome vazio
-- where PK_ID_PERSON_ENTIDADE_NEGOCIO =  '1704'