with
    City as (
        select 
            cast(ADDRESSID as int) as pk_City
            ,cast(CITY as varchar) as CIDADE
            ,cast(STATEPROVINCEID as int) as fk_State
            --ADDRESSLINE1
            --ADDRESSLINE2
            --POSTALCODE
            --SPATIALLOCATION
            --ROWGUID
            --MODIFIEDDATE
        from {{ source('erp', 'Address') }}
    )
select *
from City

