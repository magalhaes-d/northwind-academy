select *
from {{ ref('int_employees__self_join') }}
