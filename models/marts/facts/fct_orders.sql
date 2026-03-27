select
    o.order_id,
    m.dim_user_id,
    o.product,
    o.quantity,
    o.total_price,
    o.order_date
from {{ ref('stg_orders') }} o
join {{ ref('user_mapping') }} m
  on o.user_id = m.user_id
