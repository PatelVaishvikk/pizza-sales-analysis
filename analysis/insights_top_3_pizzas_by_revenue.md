
# Analysis: Top 3 Most Ordered Pizza Types by Revenue

## Query
The following SQL query was executed to determine the top 3 most ordered pizza types based on revenue:
```sql
SELECT pt.name AS pizza_name, 
       SUM(pz.price * od.quantity) AS revenue
FROM pizzas AS pz
JOIN order_details AS od
ON pz.pizza_id = od.pizza_id
JOIN pizza_types AS pt
ON pz.pizza_type = pt.pizza_types_id
GROUP BY pizza_name
ORDER BY revenue DESC
LIMIT 3;
Result
The query returned the following top 3 pizzas based on revenue:

Pizza Name	Revenue
The Thai Chicken Pizza			$43,434.25
The Barbecue Chicken Pizza	$42,768.00
The California Chicken Pizza	$41,409.50

Insights

The Thai Chicken Pizza generated the highest revenue at $43,434.25.
The Barbecue Chicken Pizza followed closely with $42,768.00.
The California Chicken Pizza ranks third with $41,409.50.
The dominance of chicken-based pizzas in the top 3 indicates a strong customer preference for chicken toppings.