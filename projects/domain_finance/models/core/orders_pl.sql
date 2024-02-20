WITH order_sales AS (

    SELECT * FROM {{ ref("domain_sales","order_summary") }}

),
order_cost AS (

    SELECT * FROM {{ ref("orders_cost") }}

),
order_pl AS (
    SELECT
        os.order_id,
        os.customer_id,
        os.order_status,
        os.order_date,
        os.total_value as revenue,
        oc.order_cost,
        revenue - order_cost as order_pl
    FROM order_sales AS os 
    JOIN order_cost oc ON os.order_id = oc.order_id
)
SELECT * FROM order_pl