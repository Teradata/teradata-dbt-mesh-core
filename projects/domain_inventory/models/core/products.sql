WITH product_catalog AS (
    
    SELECT * FROM {{ ref('stg_catalog') }}

),
products_core AS (
    
    SELECT
        c.product_id,
        c.product_name,
        c.product_category,
        c.price_cents
    FROM product_catalog AS c 

)
SELECT * FROM products_core