-- 1. Gerando as datas entre 31/05/2011 e 31/12/2014
WITH 
    DateRange AS (
        SELECT TO_DATE('2011-05-31') AS DateKey
        UNION ALL
        SELECT DATEADD(DAY, 1, DateKey)
    FROM DateRange
    WHERE DateKey < '2014-12-31'
)
-- 2. Inserindo os dados na DimCalendar
SELECT 
     DateKey as pk_data
    ,YEAR(DateKey) AS ano
    ,MONTH(DateKey) AS mes
    ,DAY(DateKey) AS dia
    ,EXTRACT(DOW FROM DateKey) AS dia_semana -- Day of the week (0 = Sunday, 6 = Saturday)
    ,WEEKOFYEAR(DateKey) AS semana_ano          -- Week number
    ,QUARTER(DateKey) AS trimestre_ano          -- Quarter (1-4)
    ,YEAR(DateKey) ||'_'||MONTH(DateKey) as ano_mes
    ,TO_CHAR(DateKey, 'MMMM') AS MonthName -- Full month name
    ,dayname(DateKey) AS WeekdayName  -- Full weekday name
FROM DateRange






