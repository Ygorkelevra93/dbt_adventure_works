with rename as (
    select 
     PK_ID_CUSTOMER as "ID Cliente"
    --,PK_ID_PERSON_ENTIDADE_NEGOCIO as "ID Entidade Pessoa"
    ,PERSON_TIPO_COD as "Tipo Cliente Abrev."
    ,PERSON_TIPO_NOME as "Tipo Cliente"
    ,PERSON_NAME as "Nome Cliente"
    --,PERSON_TIPO_EMAIL_PROMOCIONAL as "Tipo email promocional"
    --,PERSON_DATA_ATT as "Data Atualização"
    
    from {{ref("int_erp__clientes")}}
)


select * from rename

