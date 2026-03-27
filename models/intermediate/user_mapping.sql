with canonical as (
    select *
    from {{ ref('dim_users') }}
)

select
    u.user_id,
    c.dim_user_id
from {{ ref('stg_users') }} u
join canonical c
  on u.email = c.email
