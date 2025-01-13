-- Join relevant tables to find the category-wise distribution of pizzas.


select categoty , count(name) from pizza_types
group by categoty