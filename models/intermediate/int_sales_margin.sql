

SELECT 
   orders_id
  ,date_date
  ,b.products_id
  ,revenue
  ,ROUND(purchase_price * quantity,2) AS purchase_cost
  ,ROUND(revenue - purchase_price * quantity,2) AS margin
 FROM {{ ref("stg_raw__raw_gz_sales")}} as a 
 JOIN {{ ref("stg_raw__product")}} as b 
 ON a.pdt_id = b.products_id