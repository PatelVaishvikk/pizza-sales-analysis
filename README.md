# 🍕 **Pizza Sales Data Analysis**

Welcome to the **Pizza Sales Data Analysis** project! This repository contains a comprehensive exploration and analysis of pizza sales data using PostgreSQL, pgAdmin, and data visualization techniques. From uncovering customer preferences to identifying top-performing pizzas, this project dives deep into the numbers to extract meaningful insights.

---

## 🔍 **Project Overview**

In this project, we analyzed a dataset containing pizza sales, customer orders, and pricing to answer business-critical questions. The insights derived can help the pizza store:
- Optimize inventory and menu items.
- Plan effective marketing strategies.
- Understand customer preferences.
- Boost overall revenue and profitability.

---

## 🗂️ **Dataset Description**

The project utilizes **4 CSV files** loaded into a PostgreSQL database:
1. **orders** - Contains order details (`order_id`, `date`, `time`).
2. **order_details** - Links orders to pizzas, including `quantity` and `pizza_id`.
3. **pizzas** - Includes pizza IDs, types, sizes, and prices.
4. **pizza_types** - Contains the name, category, and ingredients for each pizza type.

---

## 🔧 **Tech Stack**

- **Database**: PostgreSQL
- **Query Interface**: pgAdmin 4
- **Programming Language**: SQL
- **Visualization**: Graphs in pgAdmin and export-ready charts for GitHub.

---

## 💡 **Key Questions Answered**

### **1. Total Orders Placed**
```sql
SELECT COUNT(order_id) AS total_orders FROM orders;
📊 Result: 21,350 total orders

2. Total Revenue Generated
sql
Copy code
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details AS od
JOIN pizzas AS p ON p.pizza_id = od.pizza_id;
📊 Result: $817,860.05

3. Top 3 Pizzas by Revenue
sql

SELECT pt.name, SUM(od.quantity * pz.price) AS revenue
FROM pizzas AS pz
JOIN order_details AS od ON pz.pizza_id = od.pizza_id
JOIN pizza_types AS pt ON pz.pizza_type = pt.pizza_types_id
GROUP BY pt.name
ORDER BY revenue DESC
LIMIT 3;
📊 Result:

The Thai Chicken Pizza: $43,434.25
The Barbecue Chicken Pizza: $42,768.00
The California Chicken Pizza: $41,409.50


4. Most Common Pizza Size
SQL


SELECT pz.size AS common_size, COUNT(order_id) AS orders
FROM pizzas pz
JOIN order_details od ON pz.pizza_id = od.pizza_id
GROUP BY common_size
ORDER BY orders DESC
LIMIT 1;
📊 Result: Large (18,526 orders)

5. Cumulative Revenue Over Time
sql

SELECT date, SUM(revenue) OVER(ORDER BY date) AS cum_revenue
FROM (
    SELECT o.date, SUM(od.quantity * pz.price) AS revenue
    FROM order_details AS od
    JOIN pizzas pz ON od.pizza_id = pz.pizza_id
    JOIN orders o ON o.order_id = od.order_id
    GROUP BY o.date
) AS sales;
📊 Key Milestones:

By 06/30/2015, revenue reached $413,719.75.
Total revenue by 12/31/2015: $817,860.05.

6. Percentage Contribution by Pizza Category
sql

SELECT pt.categoty, ROUND(
    (SUM(od.quantity * pz.price) / 
    (SELECT SUM(od_inner.quantity * pz_inner.price)
     FROM order_details od_inner
     JOIN pizzas pz_inner ON od_inner.pizza_id = pz_inner.pizza_id)) * 100, 2) AS percentage_contribution
FROM pizza_types pt
JOIN pizzas pz ON pz.pizza_type = pt.pizza_types_id
JOIN order_details od ON od.pizza_id = pz.pizza_id
GROUP BY pt.categoty
ORDER BY percentage_contribution DESC;
📊 Result:

Classic: 26.91%
Supreme: 25.46%
Chicken: 23.96%
Veggie: 23.68%
📈 Visualizations
Interactive graphs showcasing key metrics such as cumulative revenue trends, top-performing pizzas, and category contributions were created in pgAdmin 4. Example visuals are included in this repository.

🚀 How to Run This Project
Clone this repository:

git clone https://github.com/yourusername/pizza-sales-analysis.git
Import the CSV files into your PostgreSQL database.
Run the SQL scripts from the queries/ folder in pgAdmin.
Explore the results and visualizations.


🏆 Key Achievements
Data-Driven Insights: Comprehensive understanding of pizza sales trends and customer preferences.
Actionable Recommendations: Strategies for marketing, menu optimization, and inventory planning.
Scalable Framework: Easy-to-adapt structure for analyzing similar datasets.
