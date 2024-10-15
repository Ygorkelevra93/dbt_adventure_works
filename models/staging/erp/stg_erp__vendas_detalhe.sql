with 
    rename as (
        select
           cast(SALESORDERDETAILID as int) as pk_id_vendasdetalhe
          ,cast(SALESORDERID as int) as fk_id_vendascabecalho
          ,cast(PRODUCTID as int) as fk_id_produto
          ,cast(SPECIALOFFERID as int) as fk_id_condicao_especial_venda      
          ,cast(ORDERQTY as int) as vendasdetalhe_quantidade
          ,cast(UNITPRICE as float) as vendasdetalhe_preco_unitario_venda
          ,cast(UNITPRICEDISCOUNT as float) as vendasdetalhe_perc_desconto_produto
          ,ORDERQTY * UNITPRICE as vendasdetalhe_total_negociado
          ,ORDERQTY * (UNITPRICE * (1-UNITPRICEDISCOUNT)) as vendasdetalhe_valor_liquido_negociado
          ,cast(CARRIERTRACKINGNUMBER as varchar) as vendasdetalhe_track_number    
        from  {{source('erp_adventure','SALESORDERDETAIL')}}
    )   

select * from rename
