-- int_orders_operational.sql

SELECT 
   orders_id
  ,date_date
  ,revenue
  ,shipping_fee
  ,purchase_cost
  ,margin
  ,ship_cost
  ,log_cost
  ,log_cost + ship_cost AS operational_cost 
  ,ROUND((margin + shipping_fee - log_cost - ship_cost),2) AS operational_margin
  ,total_products
FROM {{ ref("int_orders_margin")}} AS a
JOIN {{ ref("stg_raw__ship")}} AS b USING(orders_id)