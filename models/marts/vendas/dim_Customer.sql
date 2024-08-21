with
    stg_Customer as (
        select 
        PK_CUSTOMER
        ,PERSONID
        ,fk_TerritoryID
        from {{ ref('stg_erp__Customer') }}
    )

select *
from stg_Customer