/* Q8. Top 10 sellers by revenue, with their review and late %   */


SELECT seller_id,
       ROUND(SUM(price)::numeric, 2)        AS revenue,
       ROUND(AVG(review_score)::numeric, 2) AS avg_review,
       ROUND((100 * AVG(is_late))::numeric, 1) AS late_pct
FROM fact_sales
GROUP BY seller_id
ORDER BY revenue DESC
LIMIT 10;