WITH customer_data AS (

    SELECT * FROM {{ ref("stg_customers") }}

),
order_summary_data AS (

    SELECT * FROM {{ ref("order_summary")}}

),
customer_aggregated AS (

    SELECT
        c.customer_id,
        c.customer_name,
        c.customer_surname,
        c.customer_email,
        SUM(os.total_value) AS customer_tvl
    FROM customer_data c
    JOIN order_summary_data os ON c.customer_id = os.customer_id
    GROUP BY c.customer_id, c.customer_name, c.customer_surname, c.customer_email

)
SELECT * FROM customer_aggregated