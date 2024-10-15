with 
    rename as (
        select
            -- chave primaria
            cast (SALESORDERID as int) as pk_ordem_de_venda_ID
            -- chaves estrangeiras
            ,cast (CUSTOMERID as int) as fk_id_cliente 
            ,cast (SALESPERSONID as int) as fk_id_vendedor 
            ,cast (TERRITORYID as int) as fk_id_territorio
            ,cast (BILLTOADDRESSID as int) as fk_id_requisicao_material 
            ,cast (SHIPTOADDRESSID as int) as fk_id_endereco_entrega 
            ,cast (SHIPMETHODID as int) as fk_id_tipo_entrega
            ,cast (CREDITCARDID as int) as fk_id_cartao_cliente
            ,cast (CURRENCYRATEID as int) as fk_id_cotacao_moeda 
            -- datas
            ,cast (ORDERDATE as date) as ordem_de_venda_data_venda 
            ,cast (DUEDATE as date) as ordem_de_venda_data_prazo_entrega 
            ,cast (SHIPDATE as date) as ordem_de_venda_data_embarque 
            ,cast (MODIFIEDDATE as date) as ordem_de_venda_data_att
            -- valores, metricas
            ,cast (SUBTOTAL as number(18,2)) as ordem_de_venda_valor_bruto 
            ,cast (TAXAMT as number(18,2)) as ordem_de_venda_valor_impostos 
            ,cast (FREIGHT as number(18,2)) as ordem_de_venda_valor_frete 
            ,cast (TOTALDUE as number(18,2)) as ordem_de_venda_valor_total 
            -- dados informacionais
            ,cast (REVISIONNUMBER as varchar) as ordem_de_venda_numero_revisao 
            ,cast (STATUS as varchar) as ordem_de_venda_status 
            --,cast (ONLINEORDERFLAG as varchar) as ordem_de_venda_venda_online   -- 0 se for colocado por vendedor  1 se entrou online pelo cliente  
            ,case 
                when ONLINEORDERFLAG = '1' then 'Venda Loja'
                when ONLINEORDERFLAG = '0' then 'Venda Online'
                end as ordem_de_venda_tipo_venda
            ,cast (PURCHASEORDERNUMBER as varchar) as ordem_de_venda_ref_ordem_compra 
            ,cast (ACCOUNTNUMBER as varchar) as ordem_de_venda_numero_conta 
            ,cast (CREDITCARDAPPROVALCODE as varchar) as ordem_de_venda_cod_aprov_cartao 
            ,cast (COMMENT as varchar) as ordem_de_venda_observacoes
        from  {{source('erp_adventure','SALESORDERHEADER')}}
    )

select * from rename