select
    user_id,
    lower(trim(full_name)) as full_name,
    lower(trim(email)) as email,
    country,
    signup_date
from {{ ref('users') }}
