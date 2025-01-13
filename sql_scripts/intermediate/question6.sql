-- Join the necessary tables to find the total quantity of each pizza category ordered

select pizza_types.categoty as pizza_category , sum(order_details.quantity) as total_quantity 
from pizza_types
join pizzas
on pizzas.pizza_type = pizza_types.pizza_types_id
JOIN order_details 
on pizzas.pizza_id = order_details.pizza_id
group by pizza_category
order by total_quantity desc