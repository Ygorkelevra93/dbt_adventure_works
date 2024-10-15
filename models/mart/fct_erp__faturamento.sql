with 
    rename as(
        select 
             PK_ID_ORDEM_DE_VENDA as "Nota Fiscal"
            ,FK_ID_CLIENTE as "ID Cliente"
            ,FK_ID_VENDEDOR as "ID Vendedor"
            ,FK_ID_TERRITORIO as "ID Território Venda"
            ,FK_ID_REQUISICAO_MATERIAL as "ID Requisição de Material"
            ,FK_ID_ENDERECO_ENTREGA as "ID Endereço Entrega"
            ,FK_ID_TIPO_ENTREGA as "ID Tipo Entrega"
            ,FK_ID_CARTAO_CLIENTE as "ID Cartão Cliente"
            ,FK_ID_COTACAO_MOEDA as "ID Cotação dia"
            ,FK_ID_PRODUTO as "ID Produto"
            ,FK_ID_CONDICAO_ESPECIAL_VENDA as "ID Condição Especial oferta"
            ,FCT_VENDAS_DATA_VENDA as "Data Venda"
            ,FCT_VENDAS_PRAZO_ENTREGA as "Data Prazo de Entrega"
            ,FCT_VENDAS_DATA_EMBARQUE as "Data de Embarque"
            ,FCT_VENDAS_VALOR_BRUTO_IMPRESSO_NOTA as "Valor Subtotal Nota"
            ,FCT_VENDAS_VALOR_IMPOSTOS_NOTA as "Valor Impostos Nota"
            ,FCT_VENDAS_VALOR_FRETE_NOTA as "Valor Frete Nota"
            ,FCT_VENDAS_VALOR_TOTAL_IMPRESSO_NOTA as "Valor Total Impresso Nota"
            ,FCT_VENDAS_QUANTIDADE_PRODUTO as "Quantidade Comprada"
            ,FCT_VENDAS_PRECO_UNITARIO_VENDA as "Preço Venda Unitário"
            ,FCT_VENDAS_PERCENTUAL_DESCONTO_APLICADO as "Percentual Desconto Aplicado"
            ,FCT_VENDAS_VALOR_TOTAL_NEGOCIADO as "Valor Total Negociado"
            ,FCT_VENDAS_VALOR_LIQUIDO_NEGOCIADO as "Valor Total Negociado Líquido"
            ,FCT_VENDAS_CUSTO_TOTAL_PRODUTO as "Valor Custo Produtos"
            ,FCT_VENDAS_PRECO_UNITARIO_CUSTO as "Valor Custo Produto Unitário"
            ,FCT_VENDAS_MARGEM_LIQUIDA as "Margem Líquida"
            ,FCT_VENDAS_MARGEM_BRUTA as "Margem Bruta"
            ,fct_vendas_status_venda_nome as "Status Venda"
            ,FCT_VENDAS_TIPO_VENDA as "Tipo Venda"
            ,FCT_VENDAS_ORDEM_COMPRA as "Ordem de Compra"
            ,FCT_VENDAS_NUMERO_CONTA as "Número Conta"
            
        from {{ref("int_erp__fct_vendas")}}
)

select * from rename