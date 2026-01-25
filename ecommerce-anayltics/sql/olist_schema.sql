DROP TABLE IF EXISTS ecommerce.customers CASCADE;
Create table ecommerce.customers (
   customer_id integer primary key,
   customer_unique_id varchar ,
   customer_zip_code_prefix integer,
   customer_city varchar,
   customer_state varchar
);

select * from ecommerce.customers;





DROP TABLE IF EXISTS ecommerce.orders CASCADE;
Create table  ecommerce.orders(
order_id integer primary key,
customer_id integer not null ,
order_status varchar,
order_purchase_timestamp timestamp,
order_approved_at timestamp,
order_delivered_carrier_date timestamp,
order_delivered_customer_date timestamp,
order_estimated_delivery_date timestamp,
 CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES ecommerce.customers(customer_id)

);
select * from ecommerce.orders;





DROP TABLE IF EXISTS ecommerce.payments CASCADE;
create table ecommerce.payments (
payment_id integer primary key,
order_id integer not null, 
payment_sequential integer,
payment_type varchar,
payment_installment integer,
payment_value integer,
constraint fk_payment_order
 foreign key (order_id)
 references ecommerce.orders(order_id)
);

select * from ecommerce.payments ;





DROP TABLE IF EXISTS ecommerce.reviews CASCADE;
create table ecommerce.reviews (
review_id integer primary key,
order_id integer not null,
review_score integer,
review_comment_title varchar,
review_comment_message text,
review_creation_date timestamp,
review_answer_timestamp timestamp,
constraint fk_reviews_orders
 foreign key (order_id)
references ecommerce.orders(order_id)
);





DROP TABLE IF EXISTS ecommerce.products CASCADE;
create table ecommerce.products (
product_id integer primary key ,
product_category_name varchar ,
product_weight_g integer, 
product_length_cm integer,
product_height_cm integer ,
product_width_cm integer
);







DROP TABLE IF EXISTS ecommerce.sellers CASCADE;
create table ecommerce.sellers (
seller_id integer primary key ,
seller_zip_code_prefix integer,
seller_city  varchar ,
seller_state varchar
);
select * from ecommerce.sellers;






DROP TABLE IF EXISTS ecommerce.order_items CASCADE;
create table ecommerce.order_items (
order_id integer not null,
product_id integer not null ,
seller_id integer not null,
order_item_shipping_limit_date timestamp,
order_item_price numeric(10,2),
order_item_freight_value numeric(10,2),
primary key (order_id , product_id),

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


