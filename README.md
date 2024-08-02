# Welcome to Supermarket Sales Data Project!

### Snowflake commands
```
-- Use an admin role
USE ROLE ACCOUNTADMIN;

-- Create the transform role
CREATE ROLE IF NOT EXISTS TRANSFORM;
GRANT ROLE TRANSFORM TO ROLE ACCOUNTADMIN;

-- Create the default warehouse if necessary
CREATE WAREHOUSE IF NOT EXISTS SUPERMARKET_SALES_WH;
GRANT OPERATE ON WAREHOUSE SUPERMARKET_SALES_WH TO ROLE TRANSFORM;

-- Create the dbt user and assign to role
CREATE USER IF NOT EXISTS basit
PASSWORD='Test123'
LOGIN_NAME='basit'
MUST_CHANGE_PASSWORD=FALSE
DEFAULT_WAREHOUSE='SUPERMARKET_SALES_WH'
DEFAULT_ROLE=TRANSFORM
DEFAULT_NAMESPACE='SALES.RAW'
COMMENT='basit user used for data transformation';
GRANT ROLE TRANSFORM to USER basit;

-- Create our database and schemas
CREATE DATABASE IF NOT EXISTS SALES;
CREATE SCHEMA IF NOT EXISTS SALES.RAW;

-- Set up permissions to role transform
GRANT ALL ON WAREHOUSE SUPERMARKET_SALES_WH TO ROLE TRANSFORM;
GRANT ALL ON DATABASE SALES to ROLE TRANSFORM;
GRANT ALL ON ALL SCHEMAS IN DATABASE SALES to ROLE TRANSFORM;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE SALES to ROLE TRANSFORM;
GRANT ALL ON ALL TABLES IN SCHEMA SALES.RAW to ROLE TRANSFORM;
GRANT ALL ON FUTURE TABLES IN SCHEMA SALES.RAW to ROLE TRANSFORM;

-- Set up the defaults
USE WAREHOUSE supermarket_sales_wh;
USE DATABASE SALES;
USE SCHEMA RAW;

```

- Then Loaded supermarket sales csv file into snowflake as raw table named raw_supermarket_sales
- Build data models and transformations using DBT Core
- Loaded transformed data into Snowflake used as Data warehouse


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## Thanks
