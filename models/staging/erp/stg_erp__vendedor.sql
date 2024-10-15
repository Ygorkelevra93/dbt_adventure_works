with 
    salesperson as (
        select 
             cast (BUSINESSENTITYID as int) as pk_id_salesperson_entidade_negocio
            ,cast (TERRITORYID as int) as fk_id_territorio
            ,cast (SALESQUOTA as float) as salesperson_meta
            ,cast (BONUS as float) as salesperson_bonus
            ,cast (COMMISSIONPCT as float) as salesperson_comissao
            ,cast (SALESYTD as float) as salesperson_vendas_acumuladas
            ,cast (SALESLASTYEAR as float) as salesperson_vendas_ano_anterior
            ,cast (ROWGUID as varchar) as salesperson_row_GUID
            ,cast (MODIFIEDDATE as date) as salesperson_data_att
        from  {{source('erp_adventure','SALESPERSON')}}
    )

select * from salesperson