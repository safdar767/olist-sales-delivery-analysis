/*  Q4. Calculate the Monthly revenue with month-over-month growth    */


WITH m AS (
  SELECT purchase_month, SUM(price) AS revenue
  FROM fact_sales
  GROUP BY purchase_month
)
SELECT purchase_month,
       ROUND(revenue::numeric, 2) AS revenue,
       ROUND(((revenue - LAG(revenue) OVER (ORDER BY purchase_month))
             / LAG(revenue) OVER (ORDER BY purchase_month) * 100)::numeric, 1) AS mom_growth_pct
FROM m
ORDER BY purchase_month;