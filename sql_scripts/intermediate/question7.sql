-- Determine the distribution of orders by hour of the day.

SELECT extract(HOUR from time) as hour, count(order_id) as orderr FROM orders 
group by hour
order by orderr desc