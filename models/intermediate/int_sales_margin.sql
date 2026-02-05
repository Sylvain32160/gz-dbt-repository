-- int_sales_margin.sql

SELECT 
   orders_id
  ,date_date
  ,b.products_id
  ,revenue
  ,quantity
  ,ROUND(purchase_price * quantity,2) AS purchase_cost
  ,ROUND(revenue - purchase_price * quantity,2) AS margin
  ,{{margin_percent("revenue","purchase_price * quantity",2)}} AS margin_percent
 FROM {{ ref("stg_raw__raw_gz_sales")}} as a 
 JOIN {{ ref("stg_raw__product")}} as b 
 ON a.pdt_id = b.products_id