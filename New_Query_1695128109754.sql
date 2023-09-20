-- Active: 1695105578757@@127.0.0.1@5432@northwind@public

-- q7

SELECT
    c.contact_name,
    sum(od.quantity) as amount
FROM order_details as od
    INNER JOIN orders AS o ON o.order_id = od.order_id
    INNER JOIN customers AS c ON c.customer_id = o.customer_id
GROUP BY
    od.order_id,
    c.contact_name
ORDER BY amount DESC
limit 1

-- q8

select
    c.country,
    sum(
        od.unit_price * quantity * (1 - discount)
    ) as total_revenue
from customers as c
    inner join orders as o ON o.customer_id = c.customer_id
    inner JOIN order_details as od on o.order_id = od.order_id
GROUP BY c.country
order by total_revenue DESC

-- q9

select
    s.company_name,
    count(o.order_id)
from orders as o
    inner JOIN shippers as s on s.shipper_id = o.ship_via
GROUP BY s.company_name

-- q10

SELECT
    p.product_name,
    p.product_id,
    od.order_id
FROM products AS p
    LEFT OUTER JOIN order_details AS od ON p.product_id = od.product_id
WHERE od.order_id IS NULL;

--targil b

-- q1

select contact_name
from customers
where customer_id not in(
        select customer_id
        from orders
    )

--q2

select contact_name
from customers
where customer_id in(
        select customer_id
        from orders
        GROUP BY customer_id
        HAVING
            count(order_id) > 10
    ) -- q3

select product_name
from products
where (unit_price * (1 - discontinued)) > (
        select
            avg(unit_price * (1 - discontinued))
        from products
    )

-- q4

select product_name
from products
where product_id not in(
        select product_id
        from order_details
    )

-- q5

select
    country,
    count(customer_id)
from customers
GROUP BY country
HAVING count(customer_id) > 5

select * from customers 

insert into
    customers(customer_id, company_name)
VALUES ('ALFKI', 'lkj')

-- q6

select contact_name
from customers
where customer_id not in(
        select customer_id
        from orders
        where
            1998 = extract(
                year
                from
                    order_date
            )
    )

-- q7

select contact_name
from customers
where
    country = 'mexico'
    and customer_id not in(
        select customer_id
        from orders
        where
            1998 <= extract(
                year
                from
                    order_date
            )
    )

-- q8

select contact_name
from customers
where customer_id in(
        select customer_id
        from orders
        GROUP BY customer_id
        HAVING
            count(customer_id) = 3
    )

-- q9

select
    p.product_name,
    o.order_date
from products as p
    inner JOIN order_details as od on p.product_id = od.product_id
    inner join orders as o on o.order_id = od.order_id
ORDER BY o.order_date DESC
limit 1

-- q10

select contact_title
from suppliers
where
    country = 'US'
    and supplier_id in (
        select supplier_id
        from products
        GROUP BY supplier_id
        HAVING count(supplier_id) > 1
    )