with
    rennamed as (
        select 
            cast(SALESORDERID as int) as pk_SalesID 
            ,cast(ORDERDATE  as date) as dt_order
            ,cast(STATUS as int) as status_compra
            ,cast(CREDITCARDID  as varchar) as cartao
            ,cast(TOTALDUE as varchar) as Total_negociado
            ,cast(SUBTOTAL  as varchar) as Receita_com_desconto
            ,cast(TAXAMT  as varchar) as taxa_localidade
            ,cast(FREIGHT as varchar) as taxa_frete 
            ,cast(TERRITORYID as int) as fk_Territory
            --CURRENCYRATEID
            --CREDITCARDAPPROVALCODE
            --BILLTOADDRESSID
            --SHIPTOADDRESSID
            --SHIPMETHODID
            --ONLINEORDERFLAG
            --PURCHASEORDERNUMBER
            --ACCOUNTNUMBER
            --DUEDATE
            --SHIPDATE
            --REVISIONNUMBER
            --COMMENT
            --ROWGUID
            --MODIFIEDDATE
        from {{source('erp','SalesOrderHeader')}}
    )

select *
from rennamed
