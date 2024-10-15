with 
    cidade as  (
        select *
        from {{ref("stg_erp__cidade")}}
    )
    ,estado as (
        select *
        from {{ref("stg_erp__estado")}}
    )
    ,pais as (
        select *
        from {{ref("stg_erp__pais")}}
    )

select 
    pk_id_endereco
    ,endereco_cidade as cidade
    ,estado_nome as estado
    ,pais_nome as pais
    ,pais_cod_pais
from cidade 
left join estado on pk_estado_id = fk_endereco_id_estado 
left join pais on estado_cod_pais = pais_cod_pais
