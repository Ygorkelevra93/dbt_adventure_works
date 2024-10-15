with 
    vendadetalhe as (
        select *
        from {{ref("stg_erp__vendas_detalhe")}}
    )

    ,vendacabecalho as (
        select *
        from {{ref("stg_erp__vendas_cabecalho")}}
    )

    ,custoproduto as (
        select *
        from {{ref("int_erp__produtos")}}
    )

    ,status as (
        select *
        from {{ref("seedssale_order_status_description")}}
    )

    ,regra_negocio as (
        select 
            -- chave primaria
             vendacabecalho.PK_ORDEM_DE_VENDA_ID as pk_id_ordem_de_venda
            -- chaves estrangeiras
            ,vendacabecalho.FK_ID_CLIENTE as fk_id_cliente
            ,vendacabecalho.FK_ID_VENDEDOR as fk_id_vendedor
            ,vendacabecalho.FK_ID_TERRITORIO as fk_id_territorio
            ,vendacabecalho.FK_ID_REQUISICAO_MATERIAL as  fk_id_requisicao_material
            ,vendacabecalho.fk_id_endereco_entrega as  fk_id_endereco_entrega
            ,vendacabecalho.FK_id_tipo_entrega as fk_id_tipo_entrega
            ,vendacabecalho.FK_ID_CARTAO_CLIENTE as fk_id_cartao_cliente
            ,vendacabecalho.FK_ID_COTACAO_MOEDA as fk_id_cotacao_moeda
            ,vendadetalhe.FK_ID_PRODUTO as fk_id_produto
            ,vendadetalhe.FK_ID_CONDICAO_ESPECIAL_VENDA fk_id_condicao_especial_venda
            -- datas
            ,vendacabecalho.ORDEM_DE_VENDA_DATA_VENDA as fct_vendas_data_venda
            ,vendacabecalho.ORDEM_DE_VENDA_DATA_PRAZO_ENTREGA as fct_vendas_prazo_entrega
            ,vendacabecalho.ORDEM_DE_VENDA_DATA_EMBARQUE as fct_vendas_data_embarque
            ,vendacabecalho.ORDEM_DE_VENDA_DATA_ATT as fct_vendas_data_att
            --valores / metricas
            ,vendacabecalho.ORDEM_DE_VENDA_VALOR_BRUTO as fct_vendas_valor_bruto_impresso_nota
            ,vendacabecalho.ORDEM_DE_VENDA_VALOR_IMPOSTOS as fct_vendas_valor_impostos_nota
            ,vendacabecalho.ORDEM_DE_VENDA_VALOR_FRETE as fct_vendas_valor_frete_nota
            ,vendacabecalho.ORDEM_DE_VENDA_VALOR_TOTAL as fct_vendas_valor_total_impresso_nota
            ,vendadetalhe.VENDASDETALHE_QUANTIDADE as fct_vendas_quantidade_produto
            ,vendadetalhe.VENDASDETALHE_PRECO_UNITARIO_VENDA as fct_vendas_preco_unitario_venda
            ,vendadetalhe.VENDASDETALHE_PERC_DESCONTO_PRODUTO as fct_vendas_percentual_desconto_aplicado
            ,vendadetalhe.VENDASDETALHE_TOTAL_NEGOCIADO as fct_vendas_valor_total_negociado
            ,vendadetalhe.VENDASDETALHE_VALOR_LIQUIDO_NEGOCIADO as fct_vendas_valor_liquido_negociado
            ,custoproduto.produto_preco_unitario_custo * vendadetalhe.VENDASDETALHE_QUANTIDADE as fct_vendas_custo_total_produto
            ,custoproduto.produto_preco_unitario_custo as fct_vendas_preco_unitario_custo
            --metrica customizada calculo margem 
            ,vendadetalhe.VENDASDETALHE_VALOR_LIQUIDO_NEGOCIADO -
            (custoproduto.produto_preco_unitario_custo * vendadetalhe.VENDASDETALHE_QUANTIDADE) as fct_vendas_margem_liquida
            ,vendadetalhe.VENDASDETALHE_TOTAL_NEGOCIADO -
            (custoproduto.produto_preco_unitario_custo * vendadetalhe.VENDASDETALHE_QUANTIDADE) as fct_vendas_margem_bruta    

            -- informacao
            ,vendacabecalho.ORDEM_DE_VENDA_NUMERO_REVISAO as fct_vendas_numero_revisao
            ,vendacabecalho.ORDEM_DE_VENDA_STATUS as fct_vendas_status_venda
            ,status.status_description as fct_vendas_status_venda_nome
            ,vendacabecalho.ORDEM_DE_VENDA_TIPO_VENDA as fct_vendas_tipo_venda
            ,vendacabecalho.ORDEM_DE_VENDA_REF_ORDEM_COMPRA as fct_vendas_ordem_compra
            ,vendacabecalho.ORDEM_DE_VENDA_NUMERO_CONTA as fct_vendas_numero_conta
            ,vendacabecalho.ORDEM_DE_VENDA_COD_APROV_CARTAO as fct_vendas_cod_aprov_cartao
            ,vendacabecalho.ORDEM_DE_VENDA_OBSERVACOES as fct_vendas_observacoes
            
        from vendadetalhe
        left join vendacabecalho on vendacabecalho.pk_ordem_de_venda_ID = vendadetalhe.fk_id_vendascabecalho
        left join custoproduto on custoproduto.pk_id_produto = vendadetalhe.fk_id_produto
        left join status on status.status = vendacabecalho.ORDEM_DE_VENDA_STATUS
        order by vendacabecalho.ORDEM_DE_VENDA_DATA_VENDA, vendacabecalho.PK_ORDEM_DE_VENDA_ID
    )

select * from regra_negocio


