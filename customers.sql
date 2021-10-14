with 
order_agg as
(
    select
      customer_id
    , min(created_at) first_order_at
    , count(id) number_of_orders
    from `analytics-engineers-club.coffee_shop.orders` ord
    group by 1
)

select
  cust.id customer_id
, cust.name
, cust.email
, first_order_at
, number_of_orders
from `analytics-engineers-club.coffee_shop.customers` cust
left join order_agg
on cust.id = order_agg.customer_id