-- tests/test_sales_sum_2011_not_equal.sql

WITH vendas_2011 AS (
    SELECT 
      cast(SUM(vendasdetalhe_total_negociado) as number (18,2)) AS total
    FROM {{ ref("int_erp__fct_vendas") }}
    WHERE YEAR(ordem_de_venda_data_venda) = '2011'
)

SELECT *
FROM vendas_2011
WHERE total = '12646112.16'