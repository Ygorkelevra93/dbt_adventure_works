with 
    rename as (
        select 
             PK_ID_CUSTOMER as "ID Cliente"
            ,PERSON_TIPO_COD as "Tipo Cliente Abrev."
            ,PERSON_TIPO_NOME as "Tipo Cliente"
            ,PERSON_NAME as "Nome Cliente"       
        from {{ref("int_erp__clientes")}}
)

select * from rename

