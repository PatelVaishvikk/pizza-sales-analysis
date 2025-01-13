-- Calculate the total revenue generated from pizza sales.

select SUM(od.quantity * p.price) as total_revenue
from 
order_details as od
join
pizzas p
on
p.pizza_id = od.pizza_id