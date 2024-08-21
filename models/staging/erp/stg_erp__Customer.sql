with
    Cliente as (
        select 
            cast(CUSTOMERID as int) as pk_Customer
            ,cast(PERSONID as int)  as PersonID
            ,cast(TERRITORYID as int) as fk_TerritoryID
            --STOREID
            --ROWGUID
            --MODIFIEDDATE
        from {{ source('erp', 'Customer') }}
    )
select *
from Cliente

