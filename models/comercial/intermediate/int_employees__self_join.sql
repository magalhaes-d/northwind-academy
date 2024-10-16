with
    employees as (
        select *
        from {{ ref('stg_erp__employees') }}
    )

    , joining as (
        select
            employees.employee_sk
            , employees.manager_fk
            , employees.full_name
            , managers.full_name as manager_name
            , employees.position_title
            , employees.birthdate
            , employees.hiredate
            , employees.city
            , employees.region
            , employees.country
        from employees
        left join employees as managers
            on employees.manager_fk = managers.employee_sk
    )

select *
from joining
