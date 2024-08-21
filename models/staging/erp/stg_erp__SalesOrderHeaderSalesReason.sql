with
    rennamed as (
        select 
            cast(SALESORDERID as int) as fk_SalesOrder
            ,cast(SALESREASONID as int) as fk_SalesReason
            --MODIFIEDDATE
        from {{ source('erp', 'SalesOrderHeaderSalesReason') }}
    )
select *
from rennamed

