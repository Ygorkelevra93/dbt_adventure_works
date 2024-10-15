with clientes as(
    select * 
    from {{ref("stg_erp__clientes")}}
),

person as (
    select*
    from {{ref("stg_erp__person")}}
), 

rename_join as (
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
   
)

select * from rename_join