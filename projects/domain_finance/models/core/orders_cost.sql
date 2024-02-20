WITH order_product_data AS (

    SELECT * FROM {{ ref("order_products_dates") }}

),
stock_product_data AS (

    SELECT * FROM {{ ref("domain_inventory","stock_product") }}

),
order_aggregated AS (
    SELECT
        opd.order_id,
        SUM(spd.avg_purchase_price * opd.product_quantity) AS order_cost
    FROM order_product_data opd
    JOIN stock_product_data spd ON opd.product_id = spd.product_id
    AND EXTRACT(MONTH FROM opd.order_date) = spd.calendar_month
    AND EXTRACT(YEAR FROM opd.order_date) = spd.calendar_year
    GROUP BY opd.order_id
)
SELECT * FROM order_aggregated