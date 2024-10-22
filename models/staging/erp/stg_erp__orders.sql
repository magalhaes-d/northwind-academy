with
    renaming as (
        select
            cast(id as int) order_sk
            , cast(customerid as string) as customer_fk
            , cast(employeeid as int) as employee_fk
            , cast(orderdate as date) as order_date
            , cast(requireddate as date) as required_date
            , cast(shippeddate as date) as shipped_date
            , cast(shipvia as int) as ship_via
            , cast(freight as numeric) as freight
            , cast(shipname as string) as ship_name
            , cast(shipcity as string) as ship_city
            , cast(shipregion as string) as ship_region
            , cast(shipcountry as string) as ship_country
        from {{ source('erp_northwind', '_order_') }}
    )

select *
from renaming