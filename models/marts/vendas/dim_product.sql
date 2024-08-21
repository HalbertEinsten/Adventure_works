with
    stg_Product as (
        select 
            PK_PRODUTO
            ,NOME_PRODUTO
        from {{ ref('stg_erp__Product') }}
    )

select *
from stg_Product


