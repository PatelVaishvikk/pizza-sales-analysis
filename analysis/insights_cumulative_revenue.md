The following SQL query was executed to calculate the cumulative revenue generated over time:
```sql
SELECT 
    date, 
    SUM(revenue) OVER(ORDER BY date) AS cum_revenue
FROM (
    SELECT 
        o.date, 
        SUM(od.quantity * pz.price) AS revenue
    FROM 
        order_details AS od
    JOIN pizzas AS pz
        ON od.pizza_id = pz.pizza_id
    JOIN orders AS o
        ON o.order_id = od.order_id
    GROUP BY o.date
) AS sales;
Result
The query returned the cumulative revenue for each date. Some key milestones are:

Date		Cumulative Revenue
01/01/2015		$2,713.85
01/31/2015		$69,793.30
03/31/2015		$205,350.00
06/30/2015		$413,719.75
12/31/2015		$817,860.05

Insights
Steady Growth:

The cumulative revenue grew steadily over the course of the year, indicating consistent sales activity.
By mid-year (June 30, 2015), the cumulative revenue had reached $413,719.75, representing about 50.5% of the total annual revenue.
End-of-Year Performance:

A significant spike in revenue is observed toward the end of the year, with total revenue reaching $817,860.05 by December 31, 2015.
Key Dates:

Early January and the end of the year saw higher daily revenue contributions, likely driven by holiday promotions and increased consumer spending during these periods.