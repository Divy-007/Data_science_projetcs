/*drop table to remove wrong assumption*/
DROP TABLE IF EXISTS ecommerce.customers CASCADE;
/*create table to define correct ones*/
Create table ecommerce.customers (
   customer_id varchar primary key,
   customer_unique_id varchar ,
   customer_zip_code_prefix integer,
   customer_city varchar,
   customer_state varchar
);
/*selecting from created tables for checking creating or not */
select * from ecommerce.customers;





DROP TABLE IF EXISTS ecommerce.orders CASCADE;
Create table  ecommerce.orders(
order_id varchar primary key,
customer_id varchar not null ,
order_status varchar,
order_purchase_timestamp timestamp,
order_approved_at timestamp,
order_delivered_carrier_date timestamp,
order_delivered_customer_date timestamp,
order_estimated_delivery_date timestamp,
 CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES ecommerce.customers(customer_id)

);
select * from ecommerce.orders;
/*checking foreign key manually  (SQL audit)*/
select count(*)
from ecommerce.orders o
left join ecommerce.customers c
on o.customer_id=c.customer_id
where c.customer_id is null ;








DROP TABLE IF EXISTS ecommerce.payments CASCADE;
create table ecommerce.payments (
order_id varchar not null, 
payment_sequential integer,
payment_type varchar,
payment_installment integer,
payment_value numeric(10,2),
CONSTRAINT pk_payments
     PRIMARY KEY (order_id, payment_sequential),


constraint fk_payment_order
 foreign key (order_id)
 references ecommerce.orders(order_id)
);

select * from ecommerce.payments ;
select count(*)
from ecommerce.payments p
left join ecommerce.orders o
on p.order_id=o.order_id
where o.order_id is null;




DROP TABLE IF EXISTS ecommerce.reviews CASCADE;
create table ecommerce.reviews (
review_id varchar primary key,
order_id varchar not null,
review_score integer,
review_comment_title varchar,
review_comment_message text,
review_creation_date timestamp,
review_answer_timestamp timestamp,
constraint fk_reviews_orders
 foreign key (order_id)
references ecommerce.orders(order_id)
);
select count(*) 
from ecommerce.reviews r
left join ecommerce.orders o
on r.order_id=o.order_id
where o.order_id is null;



DROP TABLE IF EXISTS ecommerce.products CASCADE;
create table ecommerce.products (
product_id varchar primary key ,
product_category_name varchar,
product_name_lenght integer,
product_description_lenght integer,
product_photos_qty integer,
product_weight_g integer, 
product_length_cm integer,
product_height_cm integer ,
product_width_cm integer
);







DROP TABLE IF EXISTS ecommerce.sellers CASCADE;
create table ecommerce.sellers (
seller_id varchar primary key ,
seller_zip_code_prefix integer,
seller_city  varchar ,
seller_state varchar
);
select * from ecommerce.sellers;






DROP TABLE IF EXISTS ecommerce.order_items CASCADE;
create table ecommerce.order_items (
order_id varchar not null,
order_item_id integer , 
product_id varchar not null ,
seller_id varchar not null,
order_item_shipping_limit_date timestamp,
order_item_price numeric(10,2),
order_item_freight_value numeric(10,2),
primary key (order_id , order_item_id),

constraint fk_items_order
foreign key (order_id)
references ecommerce.orders(order_id),

constraint fk_items_product
foreign key (product_id)
references ecommerce.products(product_id),

constraint fk_items_seller
foreign key (seller_id)
references ecommerce.sellers(seller_id)

);
select * from ecommerce.order_items;



DROP TABLE IF EXISTS ecommerce.product_categories_name CASCADE;
create table ecommerce.product_categories_name(
product_category_name varchar,
product_category_name_english varchar
);


