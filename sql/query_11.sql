SELECT 'Total revenue' AS metric, ROUND(SUM(price)::numeric, 2)::text AS value FROM fact_sales
UNION ALL
SELECT 'Total orders', COUNT(DISTINCT order_id)::text FROM fact_sales
UNION ALL
SELECT 'SP revenue share %',
       ROUND((100 * SUM(CASE WHEN customer_state = 'SP' THEN price END) / SUM(price))::numeric, 1)::text
FROM fact_sales
UNION ALL
SELECT 'Top 3 categories share %',
       ROUND((100 * (SELECT SUM(r) FROM (SELECT SUM(price) AS r FROM fact_sales
                                         GROUP BY category ORDER BY r DESC LIMIT 3) t)
              / SUM(price))::numeric, 1)::text
FROM fact_sales
UNION ALL
SELECT 'One-time customers %',
       ROUND((100.0 * COUNT(*) FILTER (WHERE c = 1) / COUNT(*))::numeric, 1)::text
FROM (SELECT customer_unique_id, COUNT(DISTINCT order_id) AS c
      FROM fact_sales GROUP BY customer_unique_id) t;