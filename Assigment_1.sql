
--2.1. Write a query that lists every product with its brand name, using production.products and production.brands.
--


select P.product_id , P.product_name , B.brand_name from production.products AS P inner join
production.brands AS B
	ON P.brand_id = B.brand_id;






	--2.2. Using a LEFT JOIN, write a query that finds every store with zero staff currently assigned to it.
--


select S.store_name , ST.active  from sales.staffs AS ST 
left join sales.stores AS S
	ON ST.store_id = S.store_id
	Where ST.active = 0;




--2.3. Explain, in your own words, why the following query returns every product regardless of stock level, and rewrite it so that it only returns products with fewer than 5 units in stock at store 1--


SELECT p.product_name, s.quantity
FROM production.products AS p
inner JOIN production.stocks AS s
   ON p.product_id = s.product_id AND s.quantity < 5 AND s.store_id = 1;




-- 2.4. Write a self join on sales.staffs that lists every manager along with a count placeholder column showing 1 for each employee they manage (you will replace this with a real COUNT in Chapter 3); for now, just produce one row per employee-manager pair.
--

select M.manager_id , E.staff_id from sales.staffs AS E
left join sales.staffs AS M
	ON E.manager_id = M.staff_id



-- Write a three-table join across sales.orders, sales.order_items, and production.products that lists every item in order #1, including product name and quantity.--


SELECT
    P.product_name,
    OI.quantity
FROM sales.orders AS O
INNER JOIN sales.order_items AS OI
    ON O.order_id = OI.order_id
INNER JOIN production.products AS P
    ON OI.product_id = P.product_id
WHERE O.order_id = 1;




--  A colleague joins orders to order_items and reports "we received 4,658 orders last year." Explain what actually went wrong with that number and how you would find the true order count instead.
--

SELECT COUNT(DISTINCT O.order_id) AS Total_Orders
FROM sales.orders AS O
INNER JOIN sales.order_items AS OI
    ON O.order_id = OI.order_id
WHERE O.order_date >= '2025-01-01'
  AND O.order_date < '2026-01-01';




-- CROSS JOIN is often considered dangerous because it can accidentally produce millions of rows from two innocent-looking tables. Under what real circumstances would you deliberately want a CROSS JOIN, and how would you guard against using one by accident, for example, by forgetting an ON clause that was meant to be there?
--

SELECT
    P.product_name,
    S.store_name
FROM production.products AS P
CROSS JOIN sales.stores AS S;



