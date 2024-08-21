with
    Estado as(
        select 
            cast(STATEPROVINCEID as int) as pk_State
            ,cast(NAME as varchar) as NOME_ESTADO
            ,cast(COUNTRYREGIONCODE as varchar) as fk_Country
            ,cast(TERRITORYID as int) as fk_SalesID_Territory
            --STATEPROVINCECODE
            --ISONLYSTATEPROVINCEFLAG
            --ROWGUID
            --MODIFIEDDATE
        from {{ source('erp', 'StateProvince') }}
    )

select *
from Estado