WITH source AS (

    SELECT * FROM {{ source('teddy_retailers_sales','source_order_products')}}

)

SELECT * FROM source
