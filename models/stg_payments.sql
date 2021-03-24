select
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    "STATUS" as payment_status,
    amount / 100 as amount,
    created,
    _batched_at as last_updated_at
from raw.stripe.payment