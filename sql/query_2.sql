/* Q2. lets check the Top 10 categories by revenue   */


SELECT category,
       ROUND(SUM(price)::numeric, 2) AS revenue,
       COUNT(DISTINCT order_id)      AS orders
FROM fact_sales
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;