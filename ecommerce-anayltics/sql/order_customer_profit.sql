DROP VIEW IF EXISTS ecommerce.order_customer_profit;
CREATE OR REPLACE VIEW ecommerce.order_customer_profit AS
select c.customer_unique_id,o.customer_id,
op.order_id,op.freight_value,op.order_net_profit
from ecommerce.customers c
left join ecommerce.orders o 
on c.customer_id=o.customer_id
left join ecommerce.order_profit op
on o.order_id=op.order_id;

