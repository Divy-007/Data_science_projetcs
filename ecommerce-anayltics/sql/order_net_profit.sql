CREATE OR REPLACE VIEW ecommerce.order_profit AS
SELECT
    r.order_id,
    r.order_revenue,
    c.estimated_cost,
    f.freight_value,
    r.order_revenue
      - c.estimated_cost
      - f.freight_value AS order_net_profit
FROM ecommerce.order_revenue r
JOIN ecommerce.estimated_cost c
  ON r.order_id = c.order_id
JOIN ecommerce.order_freight f
  ON r.order_id = f.order_id;
