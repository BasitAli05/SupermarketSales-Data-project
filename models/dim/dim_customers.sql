with customers as (
    select 
        CUSTOMER_TYPE,
        GENDER 
    from {{ ref('src_raw_supermarket_sales') }}
    group by CUSTOMER_TYPE, GENDER
)
SELECT
{{ dbt_utils.surrogate_key(['CUSTOMER_TYPE','GENDER']) }} AS CUSTOMER_ID,
    *
FROM
    customers