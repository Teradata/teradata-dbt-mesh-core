WITH stock_entries AS (


    SELECT * FROM {{ ref('stg_stock')}}

),
stock_aggregated AS (
    SELECT
        s.product_id,
        EXTRACT(MONTH FROM s.entry_date) AS calendar_month,
        EXTRACT(YEAR FROM s.entry_date) AS calendar_year,
        SUM(s.product_quantity) AS quantity,
        CAST(AVG(s.purchase_price_cents) AS INTEGER) AS avg_purchase_price
    FROM stock_entries AS s 
    GROUP BY s.product_id, EXTRACT(MONTH FROM s.entry_date), EXTRACT(YEAR FROM s.entry_date)
)
SELECT * FROM stock_aggregated