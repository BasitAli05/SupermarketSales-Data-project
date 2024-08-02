with branch as (
    select 
        BRANCH,
        CITY 
    from {{ ref('src_raw_supermarket_sales') }}
    group by BRANCH, CITY
)
SELECT
{{ dbt_utils.surrogate_key(['BRANCH','CITY']) }} AS BRANCH_ID,
    *
FROM
    branch