-- Identify the highest-priced pizza.

select pt.name, pz.price
from pizza_types pt
join pizzas as pz
on pt.pizza_types_id = pz.pizza_type
ORDER BY pz.price desc limit 1
