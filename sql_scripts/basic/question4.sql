-- Identify the most common pizza size ordered.

select pz.size as common_size, COUNT(order_id) as orders
from pizzas pz
join order_details od
on 
pz.pizza_id = od.pizza_id
GROUP BY common_size 
ORDER BY orders DESC limit 1
