with
    int_products as (
        select *
        from {{ ref('int_products__left_joins') }}
    )

select *
from int_products