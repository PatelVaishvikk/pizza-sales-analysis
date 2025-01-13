-- -- Analyze the cumulative revenue generated over time.

select date, sum(revenue) over(order by date) as cum_revenue from 
(
select o.date, 
	sum(od.quantity * pz.price) as revenue
from order_details as od 
join pizzas pz
on od.pizza_id = pz.pizza_id
join orders as o
on o.order_id = od.order_id
group by o.date 
)
as sales
