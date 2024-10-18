WITH vendas_2011 AS (
    SELECT 
      cast(SUM(fct_vendas_valor_total_negociado) as number (18,2)) AS total
    FROM {{ ref("int_erp__fct_vendas") }}
    WHERE YEAR(fct_vendas_data_venda) = '2011'
)

SELECT *
FROM vendas_2011
WHERE total != '12646112.16'
