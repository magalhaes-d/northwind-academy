with
    renaming as (
        select
            cast(orderid as string) || '-' || cast(productid as string) as order_detail_sk
            , cast(orderid as int) as order_fk
            , cast(productid as int) as product_fk
            , cast(discount as numeric(18,2)) as discount
            , cast(unitprice as numeric(18,2)) as unit_price
            , cast(quantity as int) as quantity
        from {{ source('erp_northwind', 'orderdetail') }}
    )

select *
from renaming