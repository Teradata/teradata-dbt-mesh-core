WITH order_product_data AS (

    SELECT * FROM {{ ref("domain_sales","stg_order_products") }}

),
order_data AS (

    SELECT * FROM {{ ref("domain_sales","order_summary") }}

),
order_data_timed AS (
    SELECT
        op.transaction_id,
        op.order_id,
        op.product_id,
        op.product_quantity,
        o.order_date
    FROM order_product_data AS op 
    JOIN order_data o ON o.order_id = op.order_id
)
SELECT * FROM order_data_timed