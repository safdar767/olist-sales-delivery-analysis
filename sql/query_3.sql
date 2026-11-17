/* Q3. Let check that Do late deliveries lead to lower review scores    */


SELECT delay_bucket,
       COUNT(DISTINCT order_id)             AS orders,
       ROUND(AVG(review_score)::numeric, 2) AS avg_review
FROM fact_sales
GROUP BY delay_bucket
ORDER BY avg_review DESC;