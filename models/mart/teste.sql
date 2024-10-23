select 
    year(ORDEM_DE_VENDA_DATA_ATT) as ano
    ,sum(ORDEM_DE_VENDA_VALOR_BRUTO) as total_bruto
    ,sum(ORDEM_DE_VENDA_VALOR_IMPOSTOS) as total_impostos
    ,sum(ORDEM_DE_VENDA_VALOR_FRETE) as total_frete
    ,sum(ORDEM_DE_VENDA_VALOR_TOTAL) as total_final
 
from {{ref("stg_erp__vendas_cabecalho")}}
group by year(ORDEM_DE_VENDA_DATA_ATT)
order by year(ORDEM_DE_VENDA_DATA_ATT) asc