-- List the top 5 most ordered pizza types along with their quantities.


select pt.name , sum(od.quantity) as orders_From_this_type from pizzas as pz
join order_details as od on
pz.pizza_id = od.pizza_id
join pizza_types as pt
on pz.pizza_type = pt.pizza_types_id
group by pt.name
order by orders_From_this_type desc limit 5

