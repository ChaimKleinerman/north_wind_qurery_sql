-- Active: 1695105578757@@127.0.0.1@5432@northwind@public
SELECT count(order_id) as number_of_orders,employee_id from orders
GROUP BY employee_id

-- q2
select sum(order_details.quantity),products.category_id from order_details,
products
GROUP BY category_id

select sum(order_details.quantity),products.category_id from order_details
inner JOIN products
on products.product_id = order_details.product_id
GROUP BY category_id
ORDER BY sum(order_details.quantity) DESC


-- q3

select c.contact_name,avg(od.unit_price) from customers as c
inner JOIN orders as o
on o.customer_id = c.customer_id
inner join order_details as od
on o.order_id = od.order_id
GROUP BY contact_name
order BY avg(unit_price) DESC
-- q4

select c.contact_name,avg(od.unit_price) from customers as c
inner JOIN orders as o
on o.customer_id = c.customer_id
inner join order_details as od
on o.order_id = od.order_id
GROUP BY contact_name
order BY avg(unit_price) DESC
LIMIT 10
-- q5

select extract('month' from o.order_date) as month_date, 
sum(od.unit_price *od.quantity) as total_sales
 from orders as o 
 inner JOIN order_details as od
 on o.order_id = od.order_id 
GROUP BY (month_date)
ORDER BY month_date
-- q6

SELECT units_in_stock, product_name FROM products
WHERE units_in_stock < 10
-- q7

-- SELECT c.contact_name, ( od.quantity) AS total_quantity
-- FROM customers AS c
-- INNER JOIN orders AS o ON o.customer_id = c.customer_id
-- INNER JOIN order_details AS od ON od.order_id = o.order_id
-- -- GROUP BY c.contact_name, o.order_id
-- ORDER BY c.contact_name, total_quantity DESC
-- -- LIMIT 1;

SELECT order_id, sum(quantity) from order_details
GROUP BY order_id
ORDER BY 
