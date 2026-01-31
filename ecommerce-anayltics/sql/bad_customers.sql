CREATE OR REPLACE VIEW ecommerce.loss_customer AS

WITH customer_reviews AS (
    SELECT
        o.customer_id,
        AVG(r.review_score) AS avg_review_score
    FROM ecommerce.orders o
    JOIN ecommerce.reviews r
        ON o.order_id = r.order_id
    GROUP BY o.customer_id
),

customer_risk AS (
    SELECT
        cp.customer_id,
        CASE WHEN cp.customer_net_profit < 0 THEN 40 ELSE 0 END AS profit_risk,
        CASE 
            WHEN cp.customer_freight_value / NULLIF(cp.customer_revenue, 0) > 0.4 
            THEN 30 ELSE 0 
        END AS freight_risk,
        CASE 
            WHEN cr.avg_review_score <= 2 
                 AND cp.customer_total_order >= 3 
            THEN 20 ELSE 0 
        END AS review_risk

    FROM ecommerce.customer_profit cp
    LEFT JOIN customer_reviews cr
        ON cp.customer_id = cr.customer_id
)

SELECT
    customer_id,
    profit_risk + freight_risk + review_risk AS risk_score,

    CASE
        WHEN (profit_risk + freight_risk + review_risk) >= 60
        THEN 'yes'
        ELSE 'no'
    END AS bad_customer

FROM customer_risk;


