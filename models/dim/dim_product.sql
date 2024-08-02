with product as (
    select 
        PRODUCT_LINE 
    from {{ ref('src_raw_supermarket_sales') }}
    group by PRODUCT_LINE
)
SELECT
{{ dbt_utils.surrogate_key(['PRODUCT_LINE']) }} AS PRODUCT_ID,
    *
FROM
    product