CREATE TABLE orders (
 orders_id varchar(20),
 orders_date DATE,
 customer_id VARCHAR(20),
 product VARCHAR(50),
 quantity INT,
 unit_price NUMERIC(10,2),
 shipping_address VARCHAR(100),
 payment_method VARCHAR(30), 
 order_status VARCHAR(30), 
 tracking_number VARCHAR(20),
 items_in_cart INT, 
 coupon_code VARCHAR(30),
 referral_source VARCHAR(30),
 total_price NUMERIC(10,2) );


SELECT * from orders

SELECT COUNT(*) AS total_orders, 
       AVG(total_price) AS avg_order_value,
       SUM(total_price) AS total_revenue
FROM orders;

SELECT order_id, product, total_price
FROM orders
WHERE total_price >3330.41
ORDER BY total_price DESC;

SELECT product, SUM(total_price) AS total_sales, COUNT(*) AS orders_count
FROM orders
GROUP BY product
ORDER BY total_sales DESC;

SELECT payment_method , COUNT(*) AS order_count
FROM orders
GROUP BY payment_method
ORDER BY order_count DESC;

SELECT referral_source , COUNT(*) AS orders , AVG(total_price) AS avg_value
FROM orders
GROUP BY referral_source 
HAVING COUNT(*)>200
ORDER BY avg_value DESC;
