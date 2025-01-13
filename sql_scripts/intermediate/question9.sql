-- Determine the top 3 most ordered pizza types based on revenue.


select pt.name as pizza_name, sum(pz.price * od.quantity) as revenue	
from pizzas as pz
join order_details as od
on pz.pizza_id = od.pizza_id
join pizza_types as pt
on pz.pizza_type = pt.pizza_types_id
group by pizza_name
order by revenue desc limit 3

