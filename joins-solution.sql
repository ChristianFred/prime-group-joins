-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "addresses"."id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id";

-- 3. Which warehouses have cheetos?
SELECT warehouse, description	
FROM "warehouse"
JOIN "warehouse_product"
	 ON "warehouse".id = "warehouse_product"."warehouse_id"
JOIN "products"
	ON "warehouse_product"."product_id" = "products".id
WHERE description='cheetos';
-- 4. Which warehouses have diet pepsi?
SELECT warehouse, description	
FROM "warehouse"
JOIN "warehouse_product"
	 ON "warehouse".id = "warehouse_product"."warehouse_id"
JOIN "products"
	ON "warehouse_product"."product_id" = "products".id
WHERE description='diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT first_name, count(orders) as "total orders"
FROM "customers"
JOIN "addresses" 
ON "addresses"."customer_id" = "addresses"."id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY first_name
ORDER BY first_name DESC;

-- 6. How many customers do we have?
SELECT
count("customers"."first_name") as "total Customers"
FROM customers;

-- 7. How many products do we carry?
SELECT
count("products"."description") as "total Products"
FROM products;

--8. What is the total available on-hand quantity of diet pepsi?
Oh well