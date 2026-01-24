DROP TABLE IF EXISTS Customers;

Create table Customers (
   customer_id integer primary key,
   customer_unique_id integer ,
   customer_zip_code_prefix integer,
   customer_city varchar,
   customer_state varchar
);
select * from Customers






DROP TABLE IF EXISTS orders;
Create table  orders(
order_id integer primary key,
customer_id integer ,
order_status varchar,
order_purchase_timestamp timestamp,
order_approved_at timestamp,
order_delivered_carrier_date timestamp,
order_delivered_customer_date timestamp,
order_estimated_delivery_date timestamp,
 CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)

);
select * from orders







DROP TABLE IF EXISTS payments;
create table payments (
payment_id integer primary key,
order_id integer, 
payment_sequential integer,
payment_type varchar,
payment_installment integer,
payment_value integer,
constraint fk_payment_order
 foreign key (order_id)
 references orders(order_id)
)
select * from payments 






DROP TABLE IF EXISTS reviews;
create table reviews (
review_id integer primary key,
order_id integer,
review_score integer,
review_comment_title varchar,
review_comment_message text,
review_creation_date timestamp,
review_answer_timestamp timestamp,
constraint fk_reviews_orders
 foreign key (order_id)
references orders(order_id)
);






Drop table if exists products;
create table products (
product_id integer primary key ,
product_category_name varchar ,
product_weight_g integer, 
product_length_cm integer,
product_height_cm integer ,
product_width_cm integer
)




drop table if exists sellers ;
create table sellers (
seller_id integer primary key ,
seller_zip_code_prefix integer,
seller_city  varchar ,
seller_state varchar
)
select * from sellers







drop table if exists order_items
create table order_items (
order_id integer ,
product_id integer,
seller_id integer,
order_item_shipping_limit_date timestamp,
order_item_price numeric(10,2),
order_item_freight_value numeric(10,2),
primary key (order_id , product_id),

constraint fk_items_order
foreign key (order_id)
references orders(order_id),

constraint fk_items_product
foreign key (product_id)
references products(product_id),

constraint fk_items_seller
foreign key (seller_id)
references sellers(seller_id)

);
select * from order_items






drop  table if exists product_categories_name;
create table product_categories_name(
product_category_name varchar,
product_category_name_english varchar
)

