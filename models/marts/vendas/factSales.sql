with
    int_Order as (
        select *
        from {{ ref('stg_erp__SalesOrderHeader') }}
     )
     ,int_OrderDetail as (
        select *
        from {{ ref('stg_erp__SalesOrderDetail') }}
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
            int_OrderDetail.QNT_PEDIDO
            ,int_OrderDetail.PRECO_DA_UNIDADE
            ,int_OrderDetail.DESCONTO_PRODUTO
            ,int_OrderDetail.FK_PRODUCT
            ,dim_product.NOME_PRODUTO
            ,int_Order.PK_SALESID
            ,int_Order.DT_ORDER
            ,int_Order.STATUS_COMPRA
            ,int_Order.CARTAO
            ,int_Order.TOTAL_NEGOCIADO
            ,int_Order.RECEITA_COM_DESCONTO
            ,int_Order.TAXA_LOCALIDADE
            ,int_Order.TAXA_FRETE
            ,int_Order.FK_TERRITORY
            ,dim_SalesReason.PK_SALESREASON
            ,dim_SalesReason.MOTIVO
            ,dim_SalesReason.CATEGORIA_MOTIVO
            ,dim_Customer.PK_CUSTOMER
            ,dim_Customer.PERSONID
        from int_OrderDetail
        left join dim_product
                on int_OrderDetail.fk_Product = dim_product.pk_produto
        left join int_Order
                on int_OrderDetail.fk_SalesID = int_Order.pk_SalesID
        left join int_SalesOrderSalesReason
                on int_Order.pk_SalesID = int_SalesOrderSalesReason.fk_SalesOrder
        left join dim_SalesReason
                on int_SalesOrderSalesReason.fk_SalesReason = dim_SalesReason.pk_SalesReason
        left join dim_Customer
                on int_Order.fk_Territory = dim_Customer.fk_TerritoryID
        
     )

     select *
     from joined
