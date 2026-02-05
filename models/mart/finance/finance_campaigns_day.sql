-- finance_campaigns_days.sql
SELECT 
   date_date
  ,ROUND(operational_margin - ads_cost,2) AS ads_margin
  ,average_basket
  ,operational_margin
  ,ads_impression
  ,ads_clicks
  ,total_products AS quantity
  ,revenue
  ,purchase_cost
  ,revenue - purchase_cost AS margin
  ,log_cost
  ,ship_cost
 FROM {{ref("finance_days")}}
 LEFT JOIN {{ref("int_campaigns_day")}} USING(date_date)