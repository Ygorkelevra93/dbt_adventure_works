with 
    subcategoria as (
        select *
        from {{ref("stg_erp__produtos_subcategoria")}}
    )

    ,categoria as (
        select *
        from {{ref("stg_erp__produtos_categoria")}}
    )

    ,produtos as (
        select *
        from {{ref("stg_erp__produtos")}}
    )
    
    ,rename as (
        select 
             cast(produtos.PK_ID_PRODUTO as int ) as pk_id_produto
            ,cast(produtos.PRODUTO_NOME as varchar ) as produto_nome
            ,cast(subcategoria.subcategoria_nome as varchar ) as produto_subcategoria
            ,cast(categoria.categoria_nome as varchar ) as produto_categoria
            ,cast(produtos.PRODUTO_DATA_PHASE_IN as date ) as produto_data_phase_in
            ,cast(produtos.PRODUTO_DATA_PHASE_OUT as date ) as produto_data_phase_out
            ,cast(produtos.produto_preco_unitario_custo as float ) as produto_preco_unitario_custo
            ,cast(produtos.PRODUTO_PRECO_LISTA as float ) as produto_preco_lista
        from produtos
        left join subcategoria on produtos.fk_id_subcategoria = subcategoria.pk_id_subcategoria
        left join categoria on subcategoria.fk_id_categoria = categoria.pk_id_categoria
    )

select * from rename