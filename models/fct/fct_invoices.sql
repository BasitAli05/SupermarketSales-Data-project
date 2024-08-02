WITH fct_invoices AS (
    SELECT
        INVOICE_ID,
        {{ dbt_utils.surrogate_key(['BRANCH','CITY']) }} AS BRANCH_ID,
        {{ dbt_utils.surrogate_key(['DATE']) }} AS DATE_ID,
        {{ dbt_utils.surrogate_key(['CUSTOMER_TYPE','GENDER']) }} AS CUSTOMER_ID,
        {{ dbt_utils.surrogate_key(['PRODUCT_LINE']) }} AS PRODUCT_ID,
        UNIT_PRICE,
        QUANTITY,
        TAX_5PERCENT,
        TOTAL
    FROM {{ ref('src_raw_supermarket_sales') }}
)
SELECT
    *
FROM fct_invoices