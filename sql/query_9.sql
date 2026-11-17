/*	 Q9. lets check the customer payment type   */


SELECT payment_type,
       COUNT(DISTINCT order_id)            AS orders,
       ROUND(SUM(payment_value)::numeric, 2) AS total_value
FROM payments
GROUP BY payment_type
ORDER BY total_value DESC;