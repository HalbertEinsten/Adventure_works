with
    stg_Motivo as (
        select
            PK_SALESREASON
            ,MOTIVO
            ,CATEGORIA_MOTIVO
        from {{ ref('stg_erp__SalesReason') }}
    )

select *
from stg_Motivo


