with stg_orders as (
  select * from {{ ref('stg_orders') }}
),
stg_payments as (
    select * from {{ ref('stg_payments' ) }}
),
successful_payments as (
  select
    order_id,
    sum(amount) as total_amount
  from stg_payments
  where payment_status != 'fail'
  group by order_id
)
select
  sp.order_id as order_id,
  o.customer_id,
  o.order_date,
  sp.total_amount as amount,
  o.status as order_status
from 
  stg_orders o
  left join successful_payments sp on o.order_id = sp.order_id
