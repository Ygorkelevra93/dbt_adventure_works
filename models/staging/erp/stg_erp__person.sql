with 
    person as (
        select * 
        from  {{source('erp_adventure','PERSON')}} --where BUSINESSENTITYID = '1704' -- Feito teste para correção do erro de nomes vazio (era o nome do meio nulo na concatenação que eu havia feito)

    )

    ,rename as (
        select
             cast(BUSINESSENTITYID as int) as pk_id_person_entidade_negocio
            ,cast(PERSONTYPE as varchar) as person_tipo_cod
            ,case
                when PERSONTYPE = 'SC' then 'Store Contact'
                when PERSONTYPE = 'IN' then 'Individual (retail) customer'
                when PERSONTYPE = 'SP' then 'Sales person'
                when PERSONTYPE = 'EM' then 'Employee (non-sales)'
                when PERSONTYPE = 'VC' then 'Vendor contact'
                when PERSONTYPE = 'GC' then 'General contact'
                else 'Verificar'
            end as person_tipo_nome        
            ,cast(coalesce(FIRSTNAME,'')||' '||coalesce(MIDDLENAME,'')||' '||coalesce(LASTNAME,'') as varchar) as person_name
            ,cast(EMAILPROMOTION as int) as person_tipo_email_promocional
            ,cast(MODIFIEDDATE as date) as person_data_att
            --,cast(NAMESTYLE as varchar) as NAMESTYLE
            --,cast(ADDITIONALCONTACTINFO as varchar) as ADDITIONALCONTACTINFO
            --,cast(TITLE as varchar) as TITLE
            --,cast(SUFFIX as varchar) as SUFFIX
            --,cast(DEMOGRAPHICS as varchar) as DEMOGRAPHICS
            --,cast(ROWGUID as varchar) as ROWGUID
        from person 
    )

select * from rename    
--where pk_id_person_entidade_negocio =  '1704'