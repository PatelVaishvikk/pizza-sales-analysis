-- Calculate the percentage contribution of each pizza type to total revenue

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

