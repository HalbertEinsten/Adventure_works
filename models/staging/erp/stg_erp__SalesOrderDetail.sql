with
    rennamed as (
        select 
            cast(SALESORDERID as int) as fk_SalesID
            ,cast(ORDERQTY as int) as Qnt_pedido
            ,cast(UNITPRICE as numeric(18,2)) as preco_da_unidade
            ,cast(UNITPRICEDISCOUNT as numeric(18,2)) as desconto_produto
            --SALESORDERDETAILID
            --CARRIERTRACKINGNUMBER
            --PRODUCTID
            --SPECIALOFFERID
            --ROWGUID
            --MODIFIEDDATE
        from {{source('erp','SalesOrderDetail')}}
    )

select *
from rennamed
