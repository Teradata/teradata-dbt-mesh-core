WITH source AS (

    SELECT * FROM {{ source('teddy_retailers_inventory','source_stock')}}

)

SELECT * FROM source
