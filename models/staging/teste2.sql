select 
    year(cast(DUEDATE as date)) as ano
    ,sum(SUBTOTAL) as total_bruto
    ,sum(TAXAMT) as total_impostos
    ,sum(FREIGHT) as total_frete
    ,sum(TOTALDUE) as total_final
    
from {{source('erp_adventure','SALESORDERHEADER')}}
 group by year(cast(DUEDATE as date))
 order by year(cast(DUEDATE as date)) asc

