with src_supermarket_sales as (
    select * from {{ source('sales', 'supermarket_sales') }}
)
SELECT
    BRANCH,
    CITY,
    CUSTOMER_TYPE,
    DATE, 
    GENDER,
    INVOICE_ID,
    PRODUCT_LINE,
    QUANTITY,
    TAX_5PERCENT,
    TOTAL,
    UNIT_PRICE
FROM
    src_supermarket_sales