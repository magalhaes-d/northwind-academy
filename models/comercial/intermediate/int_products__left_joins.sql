with
    stg_products as (
        select *
        from {{ ref('stg_erp__products') }}
    )

    , stg_category as (
        select *
        from {{ ref('stg_erp__category') }}
    )

    , stg_supplier as (
        select *
        from {{ ref('stg_erp__supplier') }}
    )

    , joining as (
        select
            stg_products.product_sk
            -- , stg_products.supplier_fk
            -- , stg_products.category_fk
            , stg_products.product_name
            , stg_products.quantity_per_unit
            , stg_products.unit_price
            , stg_products.units_in_stock
            , stg_products.units_on_order
            , stg_products.reorder_level
            , stg_products.is_discontinued
            , stg_category.category_name
            , stg_category.category_description
            , stg_supplier.supplier_company_name
            , stg_supplier.supplier_city
            , stg_supplier.supplier_country
        from stg_products
        left join stg_category
            on stg_category.category_sk = stg_products.category_fk
        left join stg_supplier
            on stg_supplier.supplier_sk = stg_products.supplier_fk
    )

select *
from joining