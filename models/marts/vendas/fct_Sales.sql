with
    int_Order as (
        select *
        from {{ ref('int_comercial__detalhamento_ordens') }}
     )
     , dim_Local as (
        select *
        from {{ ref('dim_Local') }}
     )
     , dim_SalesReason as (
        select *
        from {{ ref('dim_SalesReason') }}
     )
     ,int_SalesOrderSalesReason as (
        select *
        from {{ ref('stg_erp__SalesOrderHeaderSalesReason') }}
     )
     , dim_product as (
        select *
        from {{ ref('dim_product') }}
     )
     , dim_Customer as (
        select *
        from {{ ref('dim_Customer') }}
     )
     , joined as (
        select 
            int_comercial__detalhamento_ordens.SK_SALES
            ,int_comercial__detalhamento_ordens.FK_SALESID
            ,int_comercial__detalhamento_ordens.QNT_PEDIDO
            ,int_comercial__detalhamento_ordens.PRECO_DA_UNIDADE     
            ,int_comercial__detalhamento_ordens.DESCONTO_PRODUTO
            ,int_comercial__detalhamento_ordens.PK_SALESID
            ,int_comercial__detalhamento_ordens.DT_ORDER
            ,int_comercial__detalhamento_ordens.STATUS_COMPRA
            ,int_comercial__detalhamento_ordens.CARTAO
            ,int_comercial__detalhamento_ordens.TOTAL_NEGOCIADO
            ,int_comercial__detalhamento_ordens.RECEITA_COM_DESCONTO
            ,int_comercial__detalhamento_ordens.TAXA_LOCALIDADE
            ,int_comercial__detalhamento_ordens.TAXA_FRETE
            ,int_comercial__detalhamento_ordens.TOTAL_BRUTO
            ,int_comercial__detalhamento_ordens.TOTAL_LIQUIDO
            ,int_comercial__detalhamento_ordens.FRETE_RATEADO
            ,int_comercial__detalhamento_ordens.LUCRO
            ,dim_Local.CIDADE
            ,dim_Local.NOME_ESTADO
            ,dim_Local.NOME_PAIS
            ,dim_Customer.PK_CUSTOMER as CustomerID
            ,dim_product.NOME_PRODUTO
            ,dim_SalesReason.MOTIVO
            ,dim_SalesReason.CATEGORIA_MOTIVO
        from int_comercial__detalhamento_ordens
        left join dim_Customer
                on int_comercial__detalhamento_ordens.FK_TERRITORY = dim_Customer.fk_TerritoryID
        left join dim_product
                on int_comercial__detalhamento_ordens.FK_PRODUCT = dim_product.pk_produto
        left join int_SalesOrderSalesReason
                on int_comercial__detalhamento_ordens.PK_SALESID = int_SalesOrderSalesReason.fk_SalesOrder
        left join dim_SalesReason
                on int_SalesOrderSalesReason.fk_SalesReason = dim_SalesReason.pk_SalesReason
        left join dim_Local
                on int_comercial__detalhamento_ordens.fk_Territory = dim_Local.fk_SalesID_Territory
        
     )

     select *
     from joined