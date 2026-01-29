select order_id,
sum(order_item_price) as order_revenue
from ecommerce.order_items oi
group by oi.order_id;

