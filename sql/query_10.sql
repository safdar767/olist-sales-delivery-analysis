/* Q10. Categories with the lowest average review (at least 500 orders)   */


SELECT category,
       COUNT(DISTINCT order_id)             AS orders,
       ROUND(AVG(review_score)::numeric, 2) AS avg_review
FROM fact_sales
GROUP BY category
HAVING COUNT(DISTINCT order_id) >= 500
ORDER BY avg_review ASC
LIMIT 10;