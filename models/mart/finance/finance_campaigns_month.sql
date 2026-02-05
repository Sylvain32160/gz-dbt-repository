-- finance_campaigns_month.sql
With
  campaign_month AS
(
SELECT 
   *
  ,EXTRACT(YEAR FROM date_date) AS date_year
  ,EXTRACT(MONTH FROM date_date) AS date_month
 FROM {{ref("finance_campaigns_day")}}
)

SELECT
   date_year
  ,date_month
  ,ROUND(SUM(ads_margin),2) AS ads_margin
  #,ROUND(AVG(average_basket),2) AS average_basket
  ,ROUND(SUM(operational_margin),2) AS operational_margin
  ,ROUND(SUM(ads_impression),2) AS ads_impression
  ,ROUND(SUM(ads_clicks),2) AS ads_clicks
  ,ROUND(SUM(quantity),2) AS quantity
  ,ROUND(SUM(revenue),2) AS revenue
  ,ROUND(SUM(purchase_cost),2) AS purchase_cost
  ,ROUND(SUM(margin),2) AS margin
  ,ROUND(SUM(log_cost),2) AS log_cost
  ,ROUND(SUM(ship_cost),2) AS ship_cost
FROM campaign_month
GROUP BY date_year,date_month ORDER BY date_year DESC, date_month DESC