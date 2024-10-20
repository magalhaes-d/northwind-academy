with
    renaming as (
    select
        cast(id as int) as category_sk
        , cast(categoryname as varchar) as category_name
        , cast(description as varchar) as category_description
    from {{ source('erp_northwind', 'category') }}
    )

select *
from renaming