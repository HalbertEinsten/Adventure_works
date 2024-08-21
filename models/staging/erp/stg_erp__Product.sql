with
    Produto as (
        select
            cast(PRODUCTID as int) as pk_produto
            ,cast(NAME as varchar) as nome_produto
            --PRODUCTNUMBER
            --MAKEFLAG
            --FINISHEDGOODSFLAG
            --COLOR
            --SAFETYSTOCKLEVEL
            --REORDERPOINT
            --STANDARDCOST
            --LISTPRICE
            --SIZE
            --SIZEUNITMEASURECODE   
            --WEIGHTUNITMEASURECODE
            --WEIGHT
            --DAYSTOMANUFACTURE
            --PRODUCTLINE
            --CLASS
            --STYLE
            --PRODUCTSUBCATEGORYID
            --PRODUCTMODELID
            --SELLSTARTDATE
            --SELLENDDATE
            --DISCONTINUEDDATE
            --ROWGUID
            --MODIFIEDDATE
        from {{ source('erp', 'Product') }}
    )
select *
from Produto



