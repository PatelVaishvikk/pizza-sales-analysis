# Analysis: Percentage Contribution of Pizza Categories to Total Revenue

## Query

```sql
SELECT 
    pt.categoty,
    ROUND(
        (SUM(od.quantity * pz.price) / 
        (SELECT SUM(od_inner.quantity * pz_inner.price)
         FROM order_details od_inner
         JOIN pizzas pz_inner ON od_inner.pizza_id = pz_inner.pizza_id)) * 100, 2
    ) AS percentage_contribution
FROM 
    pizza_types pt
JOIN 
    pizzas pz ON pz.pizza_type = pt.pizza_types_id
JOIN 
    order_details od ON od.pizza_id = pz.pizza_id
GROUP BY 
    pt.categoty
ORDER BY 
    percentage_contribution DESC;
Result
The query returned the following percentage contributions for each pizza category:

Category	Percentage Contribution
Classic				26.91%
Supreme			25.46%
Chicken			23.96%
Veggie				23.68%

Insights

Classic pizzas contribute the highest revenue at 26.91%, followed closely by the Supreme category at 25.46%.
Chicken pizzas and Veggie pizzas also make significant contributions, accounting for 23.96% and 23.68% of total revenue, respectively.
The balanced distribution of revenue across categories indicates a diverse customer preference for different pizza types.