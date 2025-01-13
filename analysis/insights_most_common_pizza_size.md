# Analysis: Most Common Pizza Size Ordered

## Query
The following SQL query was executed to identify the most commonly ordered pizza size:
```sql
SELECT pz.size AS common_size, COUNT(order_id) AS orders
FROM pizzas pz
JOIN order_details od
ON pz.pizza_id = od.pizza_id
GROUP BY common_size
ORDER BY orders DESC
LIMIT 1;
Result
The query returned the following result:

Most Common Pizza Size: L (Large)
Total Orders: 18,526
Insights
The Large (L) size is the most popular choice among customers, accounting for 18,526 orders.
This indicates that customers tend to prefer larger pizzas, possibly for sharing or because they provide better value.