# Analysis: Top 5 Most Ordered Pizza Types

## Query
The following SQL query was executed to identify the top 5 most ordered pizza types along with their quantities:
```sql
SELECT pt.name, SUM(od.quantity) AS orders_from_this_type
FROM pizzas AS pz
JOIN order_details AS od 
ON pz.pizza_id = od.pizza_id
JOIN pizza_types AS pt
ON pz.pizza_type = pt.pizza_types_id
GROUP BY pt.name
ORDER BY orders_from_this_type DESC
LIMIT 5;
Result
The query returned the following top 5 pizza types and their quantities:

Pizza Name	Orders From This Type
The Classic Deluxe Pizza - 2,453
The Barbecue Chicken Pizza - 2,432
The Hawaiian Pizza - 2,422
The Pepperoni Pizza - 2,418
The Thai Chicken Pizza - 2,371

Insights

The Classic Deluxe Pizza is the most popular pizza, with a total of 2,453 orders.
Other popular pizzas include:
The Barbecue Chicken Pizza: 2,432 orders.
The Hawaiian Pizza: 2,422 orders.
The Pepperoni Pizza: 2,418 orders.
The Thai Chicken Pizza: 2,371 orders.
These pizzas contribute significantly to the overall sales and customer preferences.