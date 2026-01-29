CREATE OR REPLACE VIEW ecommerce.customer_profit  AS

select o.customer_id,
sum(p.order_revenue) as customer_revenue,
sum(p.estimated_cost) as customer_cost,
sum(p.freight_value) as customer_freight_value,
sum(p.order_net_profit) as customer_net_profit,
count(distinct o.order_id) as customer_total_order
from  ecommerce.orders o
join ecommerce.order_profit p
on o.order_id=p.order_id
group by o.customer_id ;

