-- 1. Aggregate staging users to one row per email
with aggregated as (
    select
        email,
        max(full_name) as full_name,
        max(country) as country,
        min(signup_date) as signup_date
    from {{ ref('stg_users') }}
    group by email
),

-- 2. Assign canonical dim_user_id
canonical as (
    select
        dense_rank() over (order by signup_date) as dim_user_id,
        email,
        full_name,
        country,
        signup_date
    from aggregated
)

-- 3. Final table: canonical dimension
select *
from canonical
