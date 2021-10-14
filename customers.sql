select
cust.id customer_id
,cust.name
,cust.email
,min(ord.created_at) first_order_at
,count(ord.id) number_of_orders
from `analytics-engineers-club.coffee_shop.customers` cust
left join `analytics-engineers-club.coffee_shop.orders` ord
on cust.id = ord.customer_id
group by 1,2,3