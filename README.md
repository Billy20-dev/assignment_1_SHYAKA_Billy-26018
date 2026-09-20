* Student Name: SHYAKA Billy
* Student ID: 26018
* Repository: assignment_1_shyaka-26018

Assignment Summary

This assignment implements SQL queries for a Sunrise Supermarket database. The database contains customers, product categories, products, orders, and order items.

The assignment demonstrates the use of:

* JOIN operations
* LEFT JOIN
* Common Table Expressions (CTEs)
* Window functions
* Aggregate functions
* Ranking and row numbering
* Running totals
* Date calculations

Database Structure

The database contains the following tables:

* CUSTOMERS
* PRODUCTS
* ORDERS
* ORDER_ITEMS

The dataset includes the required supermarket information for customers,  products, orders, and order items.

How to Run

1. Database Setup

Open Oracle SQL Developer and connect to the appropriate Oracle database.

Run:

sql/database_setup.sql

This script creates the database tables and inserts the required sample data.

2. Assignment Queries

After the database setup has been completed, run:

sql/assignment_queries.sql

This file contains all eight assignment queries.

Business Scenario

Sunrise_Supermarket needs a database system to manage customers, products, product categories, and customer orders.

The SQL queries help the supermarket understand customer purchases, product sales, customer spending, order history, and revenue patterns.

Query Explanations

1. Orders + Customers — JOIN

This query uses an INNER JOIN to connect orders with their customers. It displays order information together with the customer who placed each order.

2. Order Items + Products — JOIN

This query joins order items with products to show which products are included in each order, together with their quantities and prices.

3. Customers + Orders — LEFT JOIN

This query uses a LEFT JOIN to display all customers and their orders. Customers without orders can still appear in the results.

4. Customers Above Average Spending — CTE

This query uses a Common Table Expression (CTE) to calculate each customer’s total spending and then identifies customers whose spending is above the average customer spending.

5. Customer Spending Ranking — Window Function

The RANK() window function ranks customers according to their total spending, with the highest-spending customers receiving the highest ranking position.

6. Customer Order Numbering — Window Function

The ROW_NUMBER() function numbers each customer’s orders chronologically, beginning with order number one for each customer.

7. Running Revenue — Window Function

This query calculates revenue for each order and uses a window function to calculate cumulative running revenue over time.

8. Days Between Orders — Window Function

The LAG() function retrieves each customer’s previous order date. The query then calculates the number of days between consecutive orders.

Results and Interpretation

The queries provide information that can help Sunrise Supermarket understand:

* Customer purchasing activity
* Customer spending levels
* Customer spending rankings
* Product and order relationships
* Order frequency
* Revenue accumulation over time
* Time between customer purchases

These results can be used to better understand customer behavior and supermarket sales activity.

Challenges

Some challenges encountered during the assignment included working with multiple related tables, creating JOIN conditions correctly, using aggregate functions with GROUP BY, and understanding window functions such as RANK(), ROW_NUMBER(), and LAG().

Testing each query in Oracle SQL Developer helped verify that the queries produced the expected results.

Files in This Repository

assignment_1_shyaka-26018/
│
├── README.md
└── sql/
    ├── database_setup.sql
    └── assignment_queries.sql

Conclusion

This assignment demonstrates the use of SQL techniques to retrieve, analyze, and interpret data from the Sunrise Supermarket database using Oracle Database.