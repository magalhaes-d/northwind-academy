with
    renaming as (
    select
        cast(id as int) as supplier_sk
        , cast(companyname as varchar) as supplier_company_name
        , cast(city as varchar) as supplier_city
        , cast(country as varchar) as supplier_country
    from {{ source('erp_northwind', 'supplier') }}
    )

select *
from renaming