-- Your Snowflake user name, wrapped in double quotes so IDENTIFIER() matches it
-- exactly (unquoted names get uppercased, which breaks lowercase user names)
SET
    YOUR_USER = '"' || CURRENT_USER() || '"';

-- ─────────────────────────────────────────────────────────────────────────────
-- 0) (Run as ACCOUNTADMIN) Create a dedicated role and warehouse
-- ─────────────────────────────────────────────────────────────────────────────
USE ROLE ACCOUNTADMIN;

CREATE ROLE IF NOT EXISTS CHUNKING_EVAL_ROLE;

CREATE WAREHOUSE IF NOT EXISTS CHUNKING_EVAL_WH WAREHOUSE_SIZE = XSMALL AUTO_SUSPEND = 60 AUTO_RESUME = TRUE INITIALLY_SUSPENDED = TRUE;

-- ─────────────────────────────────────────────────────────────────────────────
-- 1) Create database and schemas
-- ─────────────────────────────────────────────────────────────────────────────
CREATE DATABASE IF NOT EXISTS CHUNKING_EVALUATION;

GRANT USAGE ON DATABASE CHUNKING_EVALUATION TO ROLE CHUNKING_EVAL_ROLE;

CREATE SCHEMA IF NOT EXISTS CHUNKING_EVALUATION.DOCS;

CREATE SCHEMA IF NOT EXISTS CHUNKING_EVALUATION.PARSED_DATA;

GRANT USAGE ON SCHEMA CHUNKING_EVALUATION.DOCS TO ROLE CHUNKING_EVAL_ROLE;

GRANT USAGE ON SCHEMA CHUNKING_EVALUATION.PARSED_DATA TO ROLE CHUNKING_EVAL_ROLE;

-- Create the internal stage in DOCS
-- ─────────────────────────────────────────────────────────────────────────────
USE DATABASE CHUNKING_EVALUATION;

USE SCHEMA DOCS;

CREATE STAGE IF NOT EXISTS PDF_10KS DIRECTORY = (ENABLE = TRUE) ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');

-- ─────────────────────────────────────────────────────────────────────────────
GRANT USAGE,
OPERATE ON WAREHOUSE CHUNKING_EVAL_WH TO ROLE CHUNKING_EVAL_ROLE;

-- (Optional) grant the role to yourself so you can use it;
GRANT ROLE CHUNKING_EVAL_ROLE TO USER IDENTIFIER($YOUR_USER);

-- Ensure the role can use the stage (USAGE is covered via schema/database usage).
-- If you have multiple roles, you can also grant explicit ownership/usage as needed.
-- Example (optional):
-- GRANT USAGE ON STAGE PDF_10KS TO ROLE CHUNKING_EVAL_ROLE;
-- ─────────────────────────────────────────────────────────────────────────────
-- 3) Context set for later steps
-- ─────────────────────────────────────────────────────────────────────────────
USE ROLE CHUNKING_EVAL_ROLE;

USE WAREHOUSE CHUNKING_EVAL_WH;

USE DATABASE CHUNKING_EVALUATION;

USE SCHEMA DOCS;

-- At this point, the stage CHUNKING_EVALUATION.DOCS.PDF_10KS exists and is ready.