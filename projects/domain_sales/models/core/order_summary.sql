WITH order_data AS (
    
    SELECT * FROM {{ ref("stg_orders") }}

),
order_product_data AS (

    SELECT * FROM {{ ref("stg_order_products") }}

),
product_data AS (

    SELECT * FROM {{ ref("domain_inventory","products") }}

),
order_aggregated AS (

    SELECT
        o.order_id,
        o.customer_id,
        o.order_status,
        o.order_date,
        SUM(p.price_cents * op.product_quantity) AS total_value
    FROM order_data o
    JOIN order_product_data op ON o.order_id = op.order_id
    JOIN product_data p ON op.product_id = p.product_id
    GROUP BY o.order_id, o.customer_id, o.order_date, o.order_status
)
SELECT * FROM order_aggregated