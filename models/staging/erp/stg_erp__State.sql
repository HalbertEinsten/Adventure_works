with
    Estado as(
        select 
            cast(STATEPROVINCEID as int) as pk_State
            ,cast(NAME as varchar) as NOME_ESTADO
            ,cast(COUNTRYREGIONCODE as varchar) as fk_Country
            --STATEPROVINCECODE
            --ISONLYSTATEPROVINCEFLAG
            --TERRITORYID
            --ROWGUID
            --MODIFIEDDATE
        from {{ source('erp', 'StateProvince') }}
    )

select *
from Estado