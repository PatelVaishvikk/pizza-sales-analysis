# Analysis: Total Revenue Generated from Pizza Sales

## Query
The following SQL query was executed to calculate the total revenue generated from pizza sales:
```sql
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details AS od
JOIN pizzas p
ON p.pizza_id = od.pizza_id;

The query returned the following result:

Total Revenue: $817,860.05
Insights
The total revenue generated from pizza sales is $817,860.05.