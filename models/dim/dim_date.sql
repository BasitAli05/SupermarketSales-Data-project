with dim_date as (
    select 
        DATE 
    from {{ ref('src_raw_supermarket_sales') }}
    group by DATE
)
SELECT
    {{ dbt_utils.surrogate_key(['DATE']) }} AS DATE_ID,
    EXTRACT(YEAR FROM DATE) AS year,
    EXTRACT(MONTH FROM DATE) AS month,
    EXTRACT(DAY FROM DATE) AS day,
FROM
    dim_date