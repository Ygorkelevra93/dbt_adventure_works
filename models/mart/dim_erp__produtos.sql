with rename as (
    select
     PK_ID_PRODUTO as "ID Produto"
    ,PRODUTO_NOME as "Nome Produto"
    ,PRODUTO_SUBCATEGORIA as "Subcategoria"
    ,PRODUTO_CATEGORIA as "Categoria"
    ,PRODUTO_DATA_PHASE_IN as "Data Phase In"
    ,PRODUTO_DATA_PHASE_OUT as "Data Phase Out"
    --,PRODUTO_PRECO_UNITARIO_CUSTO as ""
    --,PRODUTO_PRECO_LISTA as ""
    from {{ref("int_erp__produtos")}}
)

select * from rename