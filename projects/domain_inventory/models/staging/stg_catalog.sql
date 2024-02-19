WITH source AS (

    SELECT * FROM {{ source('teddy_retailers_inventory','source_catalog')}}

)

SELECT * FROM source

