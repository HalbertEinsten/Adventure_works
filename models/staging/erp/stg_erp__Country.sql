with
    Pais as(
        select 
            cast(COUNTRYREGIONCODE as varchar) as pk_Country
            ,cast(NAME as varchar) as nome_Pais
            --MODIFIEDDATE
        from {{ source('erp', 'CountryRegion') }}
    )

select *
from Pais