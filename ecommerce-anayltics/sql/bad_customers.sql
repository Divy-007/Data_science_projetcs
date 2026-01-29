with  customer_reviews as (
    select
        o.customer_id,
        avg(r.review_score) AS avg_review_score
    FROM ecommerce.orders o
    JOIN ecommerce.reviews r
      ON o.order_id = r.order_id
    GROUP BY o.customer_id
)


select cp.customer_id,
case
   when cp.customer_net_profit<0 then 'yes'
   when (cp.customer_freight_value/nullif(cp.customer_revenue,0)>0.3) then 'yes'
   when cr.avg_review_score<=2 and cp.customer_total_order>=5 then 'yes'
   else 'no'
end as bad_customer
from ecommerce.customer_profit cp
left join customer_reviews cr
on  cp.customer_id=cr.customer_id;
