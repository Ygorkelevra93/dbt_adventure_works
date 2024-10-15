with rename as (
    select
cast(COUNTRYREGIONCODE as varchar ) as pais_cod_pais
,cast(NAME as varchar ) as pais_nome
,cast(MODIFIEDDATE as varchar ) as pais_data_att
    from  {{source('erp_adventure','COUNTRYREGION')}}

)


select * from rename
