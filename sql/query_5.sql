/*   Q5.  Lets calculate state wise revenue  */


SELECT customer_state,
       ROUND(SUM(price)::numeric, 2) AS revenue,
       ROUND((100 * SUM(price) / SUM(SUM(price)) OVER ())::numeric, 1) AS revenue_share_pct
FROM fact_sales
GROUP BY customer_state
ORDER BY revenue DESC;

