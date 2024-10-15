with produto as (
    select * 
    from  {{source('erp_adventure','PRODUCT')}}

),

rename as (
    select 
     cast(PRODUCTID as int) as pk_id_produto
    ,cast(PRODUCTSUBCATEGORYID as int ) as fk_id_subcategoria
    ,cast(PRODUCTMODELID as int ) as fk_id_modelo_produto
    ,cast(SELLSTARTDATE as date ) as produto_data_phase_in
    ,cast(SELLENDDATE as date ) as produto_data_phase_out
    ,cast(STANDARDCOST as number(18,2)) as produto_preco_unitario_custo
    ,cast(LISTPRICE as number(18,2)) as produto_preco_lista
    ,cast(WEIGHT as number(18,2)) as produto_peso
    ,cast(NAME as varchar) as produto_nome
    ,cast(PRODUCTNUMBER as varchar) as produto_numero_de_serie
    ,cast(MAKEFLAG as varchar) as produto_flag
    ,cast(FINISHEDGOODSFLAG as varchar) as produto_flag_acabado
    ,cast(COLOR as varchar) as produto_cor
    ,cast(SAFETYSTOCKLEVEL as int) as produto_nivel_seguranca_repo
    ,cast(REORDERPOINT as int) as produto_nivel_recompra
    ,cast(SIZE as varchar) as produto_tamanho
    ,cast(SIZEUNITMEASURECODE as varchar) as produto_unidade_medida_tamanho
    ,cast(WEIGHTUNITMEASURECODE as varchar) as produto_unidade_medida_peso
    ,cast(DAYSTOMANUFACTURE as int ) as produto_dias_de_producao
    ,cast(PRODUCTLINE as varchar ) as produto_nome_linha
    ,cast(CLASS as varchar ) as produto_classe
    ,cast(STYLE as varchar ) as produto_estilo
    ,cast(MODIFIEDDATE as date ) as produto_data_att
    --,cast(DISCONTINUEDDATE as varchar ) as produto_data_obsoleto
    --,cast(ROWGUID as varchar ) as ROWGUID
    from produto
)


select * from rename