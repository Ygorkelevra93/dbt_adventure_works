with 
    rename as (
        select
            cast(STATEPROVINCEID as int) as pk_estado_id
            ,cast(TERRITORYID as int) as fk_id_territorio
            ,cast(STATEPROVINCECODE as varchar) as estado_cod_estado
            ,cast(COUNTRYREGIONCODE as varchar) as estado_cod_pais
            ,cast(ISONLYSTATEPROVINCEFLAG as varchar) as estado_eh_pais
            ,cast(NAME as varchar) as estado_nome
            ,cast(MODIFIEDDATE as varchar) as estado_data_att
        from  {{source('erp_adventure','STATEPROVINCE')}}
)

select * from rename