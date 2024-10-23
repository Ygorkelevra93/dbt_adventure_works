/*TESTE CRIADO PARA CONFERIR SE O VALOR SOFREU ALTERAÇÕES DA CAMADA RAW PARA STAGE - CAUSADO POR ARREDONDAMENTO */
select 
    year(cast(ORDERDATE as date)) as ano
    ,sum(SUBTOTAL) as total_bruto
    ,sum(TAXAMT) as total_impostos
    ,sum(FREIGHT) as total_frete
    ,sum(TOTALDUE) as total_final
    
from {{source('erp_adventure','SALESORDERHEADER')}}
 group by year(cast(ORDERDATE as date))
 order by year(cast(ORDERDATE as date)) asc

