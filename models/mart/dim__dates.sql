with 
    rename as (
        select 
            DATE_DAY as Data
            ,PRIOR_DATE_DAY as "Dia Anterior"
            ,NEXT_DATE_DAY as "Dia posterior"
            ,PRIOR_YEAR_DATE_DAY as "Dia atual no ano anterior"
            ,PRIOR_YEAR_OVER_YEAR_DATE_DAY as "Dia seguinte no ano anterior"
            ,DAY_OF_WEEK 
            ,DAY_OF_WEEK_ISO 
            ,DAY_OF_MONTH as "Dia do Mês"
            ,DAY_OF_YEAR as "Dia do Ano"
            ,WEEK_START_DATE as "Começo da Semana"
            ,WEEK_END_DATE as "Fim da Semana"
            ,PRIOR_YEAR_WEEK_START_DATE 
            ,PRIOR_YEAR_WEEK_END_DATE 
            ,WEEK_OF_YEAR as "Semana do Ano"
            ,ISO_WEEK_START_DATE
            ,ISO_WEEK_END_DATE
            ,PRIOR_YEAR_ISO_WEEK_START_DATE 
            ,PRIOR_YEAR_ISO_WEEK_END_DATE 
            ,ISO_WEEK_OF_YEAR 
            ,PRIOR_YEAR_WEEK_OF_YEAR 
            ,PRIOR_YEAR_ISO_WEEK_OF_YEAR 
            ,MONTH_OF_YEAR as "Número Mês"
            ,MONTH_START_DATE as "Começo do Mês"
            ,MONTH_END_DATE as "Final do Mês"
            ,PRIOR_YEAR_MONTH_START_DATE 
            ,PRIOR_YEAR_MONTH_END_DATE 
            ,QUARTER_OF_YEAR as "Trimestre Ano"
            ,QUARTER_START_DATE as "Início Trimestre"
            ,QUARTER_END_DATE as "Final Trimestre"
            ,YEAR_NUMBER as "Ano"
            ,YEAR_START_DATE as "Primeiro dia do Ano"
            ,YEAR_END_DATE as "Último dia do Ano"
            ,DAY_OF_WEEK_NAME_PT as "Dia da Semana"
            ,MONTH_OF_YEAR_PT as "Mês Nome"
            ,Periodo_consolidado as "Período Consolidado"
        from {{ref("int_erp__dates")}}
)

select * from rename 