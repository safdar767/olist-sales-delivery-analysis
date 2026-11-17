/* Q6.  Late delivery percentage in statewise   */


SELECT customer_state,
       COUNT(DISTINCT order_id) AS orders,
       ROUND((100.0 * COUNT(DISTINCT CASE WHEN is_late = 1 THEN order_id END)
             / COUNT(DISTINCT order_id))::numeric, 1) AS late_pct,
       ROUND(AVG(delivery_days)::numeric, 1) AS avg_delivery_days
FROM fact_sales
GROUP BY customer_state
HAVING COUNT(DISTINCT order_id) > 200
ORDER BY late_pct DESC;
