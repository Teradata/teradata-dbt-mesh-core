WITH stock_entries AS (


    SELECT * FROM {{ ref('stg_stock')}}

),
product_aggregated AS (
    SELECT
        s.product_id,
        EXTRACT(YEAR FROM s.entry_date) AS calendar_year,
        CAST(AVG(s.unit_purchase_price) AS INTEGER) AS avg_purchase_price
    FROM stock_entries AS s 
    GROUP BY s.product_id, EXTRACT(YEAR FROM s.entry_date)
)
SELECT * FROM product_aggregated