# Analysis: Category-Wise Distribution of Pizzas

## Query
The following SQL query was executed to analyze the category-wise distribution of pizzas:
```sql
SELECT category, COUNT(name) AS count
FROM pizza_types
GROUP BY category;
Result
The query returned the following category-wise distribution of pizzas:

Category	Count
Supreme	9
Classic		8
Veggie		9
Chicken	6

Insights
The Supreme and Veggie categories have the highest number of pizza types, with 9 pizzas each.
The Classic category is close behind with 8 pizzas.
The Chicken category has the least variety, with only 6 pizzas.