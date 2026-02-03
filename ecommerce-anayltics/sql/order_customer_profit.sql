CREATE OR REPLACE VIEW ecommerce.order_customer_profit AS

select o.customer_id,
op.order_id,op.freight_value,op.order_net_profit
from ecommerce.orders o
left join ecommerce.order_profit op
on o.order_id=op.order_id;