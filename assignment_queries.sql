-- Sunrise Supermarket - Assignment One
-- Student: SHYAKA Billy
-- Student ID: 26018
-- Assignment Queries


=========================================
-- QUESTION 1: ORDERS + CUSTOMERS
=========================================

SELECT
o.order_id,
o.order_date,
c.customer_id,
c.customer_name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id;

=========================================
-- QUESTION 2: ORDER ITEMS + PRODUCTS
=========================================

SELECT
oi.order_item_id,
oi.order_id,
p.product_id,
p.product_name,
oi.quantity,
oi.unit_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;


=========================================
-- QUESTION 3: CUSTOMERS + ORDERS USING LEFT JOIN
-- =========================================

SELECT
c.customer_id,
c.customer_name,
o.order_id,
o.order_date
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id;  



=========================================
-- QUESTION 4: CUSTOMERS ABOVE AVERAGE SPENDING
=========================================

WITH customer_spending AS (
SELECT
c.customer_id,
c.customer_name,
SUM(oi.quantity * oi.unit_price) AS total_spending
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
c.customer_id,
c.customer_name
)
SELECT
customer_id,
customer_name,
total_spending
FROM customer_spending
WHERE total_spending > (
SELECT AVG(total_spending)
FROM customer_spending
)
ORDER BY total_spending DESC;    
    

=========================================
-- QUESTION 5: CUSTOMER SPENDING RANKING
=========================================

SELECT
c.customer_id,
c.customer_name,
SUM(oi.quantity * oi.unit_price) AS total_spending,
RANK() OVER (
ORDER BY SUM(oi.quantity * oi.unit_price) DESC
) AS spending_rank
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
c.customer_id,
c.customer_name
ORDER BY spending_rank;


=========================================
-- QUESTION 6: CUSTOMER ORDER NUMBERING
-- =========================================

SELECT
c.customer_id,
c.customer_name,
o.order_id,
o.order_date,
ROW_NUMBER() OVER (
PARTITION BY c.customer_id
ORDER BY o.order_date
) AS customer_order_number
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY
c.customer_id,
o.order_date;


=========================================
-- QUESTION 7: RUNNING REVENUE
=========================================

SELECT
o.order_id,
o.order_date,
SUM(oi.quantity * oi.unit_price) AS order_revenue,
SUM(SUM(oi.quantity * oi.unit_price)) OVER (
ORDER BY o.order_date, o.order_id
) AS running_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY
o.order_id,
o.order_date
ORDER BY
o.order_date,
o.order_id;


=========================================
-- QUESTION 8: DAYS BETWEEN ORDERS
=========================================

SELECT
c.customer_id,
c.customer_name,
o.order_id,
o.order_date,
LAG(o.order_date) OVER (
PARTITION BY c.customer_id
ORDER BY o.order_date
) AS previous_order_date,
o.order_date - LAG(o.order_date) OVER (
PARTITION BY c.customer_id
ORDER BY o.order_date
) AS days_between_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY
c.customer_id,
o.order_date;


