/* Q1. lets calculate the Overall business numbers   */

SELECT
  ROUND(SUM(price)::numeric, 2)                   AS total_revenue,
  COUNT(DISTINCT order_id)                        AS total_orders,
  ROUND((SUM(price) / COUNT(DISTINCT order_id))::numeric, 2) AS avg_order_value,
  ROUND(AVG(review_score)::numeric, 2)            AS avg_review,
  ROUND(AVG(delivery_days)::numeric, 1)           AS avg_delivery_days,
  ROUND((100.0 * COUNT(DISTINCT CASE WHEN is_late = 1 THEN order_id END)
        / COUNT(DISTINCT order_id))::numeric, 1)  AS late_delivery_pct
FROM fact_sales;