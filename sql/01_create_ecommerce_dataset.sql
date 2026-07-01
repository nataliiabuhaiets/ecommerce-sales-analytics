-- This query creates the final dataset for e-commerce sales analysis.
-- Source: Google BigQuery public / training dataset
-- The dataset is later used for EDA, statistical analysis, and Tableau dashboards.
SELECT s.date,
       s.ga_session_id,
       sp.continent,
       sp.country,
       sp.device,
       sp.browser,
       sp.mobile_model_name,
       sp.operating_system,
       sp.language,
       sp.name AS channel_source,
       sp.channel,
       acs.account_id,
       ac.is_verified,
       ac.is_unsubscribed,
       p.category,
       p.name AS product_name,
       p.price,
       p.short_description
FROM `DA.session` AS s
LEFT JOIN `DA.session_params` AS sp
ON s.ga_session_id=sp.ga_session_id
LEFT JOIN `DA.account_session` AS acs
ON s.ga_session_id=acs.ga_session_id
LEFT JOIN `DA.account` AS ac
ON acs.account_id=ac.id
LEFT JOIN `DA.order` AS o
ON s.ga_session_id=o.ga_session_id
LEFT JOIN `DA.product` AS p
ON o.item_id=p.item_id