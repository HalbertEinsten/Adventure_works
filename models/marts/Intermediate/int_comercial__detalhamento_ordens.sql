with
    SalesOrderHeader as (
        select*
        from {{ ref('stg_erp__SalesOrderHeader') }}
    )
    , SalesOrderDetail as (
        select*
        from {{ ref('stg_erp__SalesOrderDetail') }}
    )
    , joined as(
        select
            SalesOrderDetail.FK_SALESID
            ,SalesOrderDetail.QNT_PEDIDO
            ,SalesOrderDetail.PRECO_DA_UNIDADE
            ,SalesOrderDetail.DESCONTO_PRODUTO
            ,SalesOrderHeader.PK_SALESID
            ,SalesOrderHeader.DT_ORDER
            ,SalesOrderHeader.STATUS_COMPRA
            ,SalesOrderHeader.CARTAO
            ,SalesOrderHeader.TOTAL_NEGOCIADO
            ,SalesOrderHeader.RECEITA_COM_DESCONTO
            ,SalesOrderHeader.TAXA_LOCALIDADE
            ,SalesOrderHeader.TAXA_FRETE
            ,SalesOrderHeader.FK_TERRITORY
            ,SalesOrderDetail.FK_PRODUCT
        from SalesOrderDetail
        inner join SalesOrderHeader
        on SalesOrderDetail.fk_SalesID = SalesOrderHeader.pk_SalesID
    )
    , metricas as (
        select 
            *
            ,PRECO_DA_UNIDADE * QNT_PEDIDO as total_bruto
            ,PRECO_DA_UNIDADE * (1- DESCONTO_PRODUTO) * QNT_PEDIDO as total_liquido
            ,TAXA_FRETE / count(*) over(partition by fk_SalesID) as frete_rateado
            ,PRECO_DA_UNIDADE * (1 - DESCONTO_PRODUTO)
                * QNT_PEDIDO
                - TAXA_FRETE / count(*) over(partition by fk_SalesID) as lucro
        from joined
    )
    , chave_primaria as (
        select
            fk_SalesID::varchar || '-' || fk_SalesID::varchar as sk_Sales
            ,*
        from metricas
    )
select *
from chave_primaria

