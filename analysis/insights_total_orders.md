# Analysis: Total Number of Orders

## Query
The following SQL query was executed to retrieve the total number of orders placed in the database:
```sql
SELECT COUNT(order_id) AS total_orders 
FROM orders;

The query returned the following result:

Total Orders: 21,350
Insights
A total of 21,350 orders have been recorded in the database.