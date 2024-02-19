WITH source AS (

    SELECT * FROM {{ source('teddy_retailers_sales','source_orders')}}

)

SELECT * FROM source
