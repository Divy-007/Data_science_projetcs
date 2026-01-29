-- Assumption:
-- Estimated cost is calculated as 60% of total order item price

select order_id,sum(order_item_price)*0.6 as estimated_cost
from ecommerce.order_items 
group by order_id;




