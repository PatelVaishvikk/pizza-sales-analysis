# Analysis: Top 3 Most Ordered Pizza Types by Revenue for Each Category

## Query
The following SQL query was executed to determine the top 3 most ordered pizza types based on revenue for each pizza category:
```sql
SELECT 
    name, 
    revenue
FROM
(
    SELECT 
        categoty,
        name,
        revenue,
        RANK() OVER (PARTITION BY categoty ORDER BY revenue DESC) AS rn
    FROM
    (
        SELECT 
            pt.categoty,
            pt.name,
            SUM(od.quantity * pz.price) AS revenue
        FROM pizza_types AS pt
        JOIN pizzas AS pz
            ON pt.pizza_types_id = pz.pizza_type
        JOIN order_details AS od
            ON od.pizza_id = pz.pizza_id
        GROUP BY 
            pt.categoty, 
            pt.name
    ) AS a
) AS b
WHERE rn <= 3;
Result
The query returned the top 3 pizza types by revenue for each category. Below is a sample output:

Pizza Name						Revenue
The Thai Chicken Pizza			$43,434.25
The Barbecue Chicken Pizza	$42,768.00
The California Chicken Pizza	$41,409.50
The Classic Deluxe Pizza		$38,180.50
The Hawaiian Pizza				$32,273.25
The Pepperoni Pizza			$30,161.75

Insights
Chicken Category:

The Thai Chicken Pizza leads in revenue with $43,434.25, followed closely by The Barbecue Chicken Pizza and The California Chicken Pizza.
Classic Category:

The Classic Deluxe Pizza tops the list with $38,180.50, followed by The Hawaiian Pizza and The Pepperoni Pizza.
Balanced Revenue Distribution:

The top 3 pizzas for each category contribute significantly to their respective category revenues, indicating customer preferences for these specific items.
Strong Performers:

Chicken pizzas dominate in terms of revenue generation, reflecting customer preference for this category.