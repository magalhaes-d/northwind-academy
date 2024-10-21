with
    stg_orders as (
        select *
        from {{ ref('stg_erp__orders') }}
    )

    , stg_orders_detail as (
        select *
        from {{ ref('stg_erp__orders_detail') }}
    )

    , joining as (
        select
            stg_erp__orders_detail.order_detail_sk
            , stg_erp__orders_detail.order_fk
            , stg_erp__orders_detail.product_fk
            , stg_erp__orders.customer_fk
            , stg_erp__orders.employee_fk
            , stg_erp__orders.ship_via
            , stg_erp__orders.order_date
            , stg_erp__orders.required_date
            , stg_erp__orders.shipped_date
            , stg_erp__orders_detail.discount
            , stg_erp__orders_detail.unit_price
            , stg_erp__orders_detail.quantity
            , stg_erp__orders.freight
            , stg_erp__orders.ship_name
            , stg_erp__orders.ship_city
            , stg_erp__orders.ship_region
            , stg_erp__orders.ship_country
        from stg_erp__orders_detail
        inner join stg_erp__orders
            on stg_erp__orders_detail.order_fk = stg_erp__orders.order_sk
    )

    , metrics as (
        select
            *
            , quantity * unit_price as gross_sales
            , quantity * unit_price * (1 - discount) as net_sales
            , freight / (count(*) over (partition by order_fk)) fright_per_product
            , case
                when discount > 0 then true
                else false
            end as has_discount
        from joining
    )

    , final as (
        select
            order_detail_sk
            , order_fk
            , product_fk
            , customer_fk
            , employee_fk
            , ship_via
            , order_date
            , required_date
            , shipped_date
            , discount
            , unit_price
            , quantity
            , gross_sales
            , net_sales
            , cast(fright_per_product as numeric(18,2)) as fright_per_product
            -- , freight
            , ship_name
            , ship_city
            , ship_region
            , ship_country
            , has_discount
        from metrics
    )

select *
from final
