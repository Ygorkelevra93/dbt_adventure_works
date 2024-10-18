{{ config(
    description="Teste singular que verifica se o valor total negociado de vendas em 2011 corresponde ao valor esperado de 12.646.112,16. Foi configurado como aviso (warn) para não interromper o pipeline caso a condição não seja atendida.",
    severity='warn'
) }}

/* {{ config(severity = 'warn') }} */ 
/* Criado uma configuração de aviso para ser usada sem travar o pipeline*/

WITH vendas_2011 AS (
    SELECT 
      cast(SUM(fct_vendas_valor_total_negociado) as number (18,2)) AS total
    FROM {{ ref("int_erp__fct_vendas") }}
    WHERE YEAR(fct_vendas_data_venda) = '2011'
)

SELECT *
FROM vendas_2011
WHERE total != '12646112.16'