with
    stg_City as (
        select *
        from {{ ref('stg_erp__City') }}
    )
    , stg_State as (
        select *
        from {{ ref('stg_erp__State') }}
    )
    , stg_Country as (
        select *
        from {{ ref('stg_erp__Country') }}
    )
    , joined as (
        select
            stg_City.PK_CITY
            , stg_City.CIDADE
            , stg_State.PK_STATE
            , stg_State.NOME_ESTADO
            , stg_Country.PK_COUNTRY
            , stg_Country.NOME_PAIS
        from stg_City
        left join stg_State
                on stg_City.fk_State = stg_State.pk_State
        left join stg_Country
                on stg_State.fk_Country = stg_Country.pk_Country
    )

select *
from joined