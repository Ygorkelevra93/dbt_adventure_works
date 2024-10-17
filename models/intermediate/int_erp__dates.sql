with 
    raw_generated_data as (
        select
        *
        from {{ref("stg_erp__dates")}}
    )

    , portuguese_renamed as (
        select 
            raw_generated_data.*
            , case
                when raw_generated_data.day_of_week = 1 then 'Domingo'
                when raw_generated_data.day_of_week = 2 then 'Segunda-feira'
                when raw_generated_data.day_of_week = 3 then 'Terça-feira'
                when raw_generated_data.day_of_week = 4 then 'Quarta-feira'
                when raw_generated_data.day_of_week = 5 then 'Quinta-feira'
                when raw_generated_data.day_of_week = 6 then 'Sexta-feira'
                when raw_generated_data.day_of_week = 7 then 'Sábado'
            end as day_of_week_name_pt
            , case
                when raw_generated_data.month_of_year = 1 then 'Janeiro'
                when raw_generated_data.month_of_year = 2 then 'Fevereiro'
                when raw_generated_data.month_of_year = 3 then 'Março'
                when raw_generated_data.month_of_year = 4 then 'Abril'
                when raw_generated_data.month_of_year = 5 then 'Maio'
                when raw_generated_data.month_of_year = 6 then 'Junho'
                when raw_generated_data.month_of_year = 7 then 'Julho'
                when raw_generated_data.month_of_year = 8 then 'Agosto'
                when raw_generated_data.month_of_year = 9 then 'Setembro'
                when raw_generated_data.month_of_year = 10 then 'Outubro'
                when raw_generated_data.month_of_year = 11 then 'Novembro'
                when raw_generated_data.month_of_year = 12 then 'Dezembro'
            end as month_of_year_pt
            ,YEAR_NUMBER||'_'||MONTH_OF_YEAR as Periodo_consolidado
            ,YEAR_NUMBER||'_'||QUARTER_OF_YEAR as Periodo_tri_consolidado
        from raw_generated_data
    )

select *
from portuguese_renamed