with 
    rename as (
        select 
             PK_ID_ENDERECO as "ID Endereço"
            ,CIDADE as "Cidade"
            ,ESTADO as "Estado"
            ,PAIS as "País"
            ,pais_cod_pais as "País Abrev."
        from {{ref("int_erp__regiao")}}
)

select * from rename