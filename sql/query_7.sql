/* Q7. Lets calculate which customrers are repeat and which are single time  */


SELECT
  CASE WHEN order_count > 1 THEN 'Repeat' ELSE 'One-time' END AS customer_type,
  COUNT(*) AS customers
FROM (
  SELECT customer_unique_id, COUNT(DISTINCT order_id) AS order_count
  FROM fact_sales
  GROUP BY customer_unique_id
) t
GROUP BY 1;