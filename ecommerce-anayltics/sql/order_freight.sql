--- transpote and shipping cost per order
CREATE OR REPLACE VIEW ecommerce.order_freight AS
select order_id ,sum(order_item_freight_value) as freight_value
from ecommerce.order_items 
group by order_id;

