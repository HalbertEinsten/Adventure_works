with
    Motivo as (
        select
            cast(SALESREASONID as int) as pk_SalesReason
            ,cast(NAME as varchar) as motivo
            ,cast(REASONTYPE as varchar) as categoria_motivo
            --MODIFIEDDATE
        from {{ source('erp', 'SalesReason') }}
    )
select *
from Motivo

