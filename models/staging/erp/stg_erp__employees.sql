with
    source_employees as (
        select *
        from {{ source('erp_northwind', 'employee') }}
    )

    , casting as (
        select
            cast(id as int) as employee_sk
            , cast(reportsto as int) as manager_fk
            , firstname || ' ' || lastname as full_name
            , cast(title as varchar) as position_title
            , cast(birthdate as date) as birthdate
            , cast(hiredate as date) as hiredate
            , cast(city as varchar) as city
            , cast(region as varchar) as region
            , cast(country as varchar) as country
            -- , cast(lastname as varchar) as
            -- , cast(firstname as varchar) as
            -- , cast(titleofcourtesy as varchar) as
            -- , cast(address as varchar) as
            -- , cast(postalcode as varchar) as
            -- , cast(homephone as varchar) as
            -- , cast(extension as varchar) as
            -- , cast(photo as varchar) as
            -- , cast(notes as varchar) as notes
            -- , cast(photopath as varchar) as
        from source_employees
    )

select *
from casting
