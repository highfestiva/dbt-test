select
    order_id,
    user_id,
    product,
    quantity,
    total_price,
    order_date
from {{ ref('orders') }}
