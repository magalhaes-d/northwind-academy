with
    renaming as (
        select
            cast(id as int) as product_sk
            , cast(supplierid as int) as supplier_fk
            , cast(categoryid as int) as category_fk
            , cast(productname as string) as product_name
            , cast(quantityperunit as string) as quantity_per_unit
            , cast(unitprice as numeric(18,2)) as unit_price
            , cast(unitsinstock as int) as units_in_stock
            , cast(unitsonorder as int) as units_on_order
            , cast(reorderlevel as int) as reorder_level
            , case
                when discontinued = '1' then true
                when discontinued = '0' then false
                else null
            end as is_discontinued
        from {{ source('erp_northwind', 'product') }}
    )

select *
from renaming