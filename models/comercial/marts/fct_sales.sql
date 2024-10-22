with
    int_orders as (
        select *
        from {{ ref('int_orders__left_joins') }}
    )

    , dim_employees as (
        select *
        from {{ ref('dim_employees') }}
    )

    , dim_products as (
        select *
        from {{ ref('dim_products') }}
    )

select *
from int_orders