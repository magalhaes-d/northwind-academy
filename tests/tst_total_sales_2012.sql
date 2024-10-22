/*
    Test to check whether total sales for 2012 result in:
    R$ 226,298.5
*/

with
    total_sales as (
        select sum(gross_sales) as total
        from {{ ref('int_orders__left_joins') }}
        where order_date between '2012-01-01' and '2012-12-31'
    )

select *
from total_sales
where total not between 226298.45 and 226298.55