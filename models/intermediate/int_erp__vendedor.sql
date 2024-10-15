with 
    salesperson as (
        select *
        from  {{ref("stg_erp__vendedor")}}
    )

    ,person as (
        select *
        from {{ref("stg_erp__person")}}    
    )

    ,rename as (
        select 
             PK_ID_SALESPERSON_ENTIDADE_NEGOCIO as pk_id_salesperson
            ,FK_ID_TERRITORIO 
            ,PERSON_NAME as salesperson_nome
            ,PERSON_TIPO_COD as salesperson_tipo_cliente_cod
            ,PERSON_TIPO_NOME as  salesperson_tipo_cliente
            ,SALESPERSON_META
            ,SALESPERSON_BONUS
            ,SALESPERSON_COMISSAO
            ,SALESPERSON_VENDAS_ACUMULADAS
            ,SALESPERSON_VENDAS_ANO_ANTERIOR    
        from salesperson
        left join person on person.pk_id_person_entidade_negocio = salesperson.pk_id_salesperson_entidade_negocio
    ) 

select * from rename