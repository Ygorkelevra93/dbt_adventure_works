with rename as (
    select
 cast(ADDRESSID as int) as pk_id_endereco
,cast(STATEPROVINCEID as int) as fk_endereco_id_estado
,cast(ADDRESSLINE1 as varchar) ||' '||cast(ADDRESSLINE2 as varchar) as endereco_descricao
,cast(MODIFIEDDATE as date) as endereco_data_att
,cast(CITY as varchar) as endereco_cidade
--,cast(ADDRESSLINE2 as varchar) as ADDRESSLINE2
--,cast(POSTALCODE as varchar) as POSTALCODE
--,cast(SPATIALLOCATION as varchar) as SPATIALLOCATION
--,cast(ROWGUID as varchar) as ROWGUID
    from  {{source('erp_adventure','ADDRESS')}}

)


select * from rename




