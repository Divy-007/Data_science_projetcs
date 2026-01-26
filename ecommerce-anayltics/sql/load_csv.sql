/*tuncate the table before loading the dataset for validation of  the data */
TRUNCATE ecommerce.orders CASCADE;
TRUNCATE ecommerce.customers CASCADE;
TRUNCATE ecommerce.payments CASCADE;
TRUNCATE ecommerce.product_categories_name CASCADE;
TRUNCATE ecommerce.products CASCADE;
TRUNCATE ecommerce.reviews CASCADE;
TRUNCATE ecommerce.sellers CASCADE;
TRUNCATE ecommerce.order_items CASCADE;


/*loading the data from csv file by using copy command*/
copy ecommerce.customers from 'D:/Data_science_projects/ecommerce-anayltics/data/raw/olist_customers_dataset.csv'
delimiter ','
csv header;
/*checking if data is load or not */
SELECT COUNT(*) FROM ecommerce.customers;
SELECT customer_id
FROM ecommerce.customers
LIMIT 5;
/*checking why error occurs in this row */
SELECT *
FROM ecommerce.customers
WHERE customer_id = '9ef432eb6251297304e76186b10a928d';






copy ecommerce.orders from 'D:/Data_science_projects/ecommerce-anayltics/data/raw/olist_orders_dataset.csv'
delimiter ','
csv header;
SELECT COUNT(*) FROM ecommerce.orders;





copy ecommerce.payments from 'D:/Data_science_projects/ecommerce-anayltics/data/raw/olist_order_payments_dataset.csv'
delimiter ','
csv header;
SELECT COUNT(*) FROM ecommerce.payments;


copy ecommerce.reviews from 'D:/Data_science_projects/ecommerce-anayltics/data/raw/olist_order_reviews_dataset.csv'
delimiter ','
csv header;
SELECT COUNT(*) FROM ecommerce.reviews;




copy ecommerce.products from 'D:/Data_science_projects/ecommerce-anayltics/data/raw/olist_products_dataset.csv'
delimiter ','
csv header;
SELECT COUNT(*) FROM ecommerce.products;



copy ecommerce.sellers from 'D:/Data_science_projects/ecommerce-anayltics/data/raw/olist_sellers_dataset.csv'
delimiter ','
csv header;
SELECT COUNT(*) FROM ecommerce.sellers;

copy ecommerce.product_categories_name from 'D:/Data_science_projects/ecommerce-anayltics/data/raw/product_category_name_translation.csv'
delimiter ','
csv header;
SELECT COUNT(*) FROM ecommerce.product_categories_name;















COPY ecommerce.order_items
FROM 'D:/Data_science_projects/ecommerce-anayltics/data/raw/olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

SELECT COUNT(*) FROM ecommerce.order_items;





