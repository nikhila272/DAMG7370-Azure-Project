CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Your@StrongP@ssword123';


CREATE DATABASE SCOPED CREDENTIAL cred_group6
WITH IDENTITY = 'Managed Identity';


CREATE EXTERNAL DATA SOURCE source_silver
WITH (
    LOCATION = 'https://neudamgdatalake.blob.core.windows.net/silver',
    CREDENTIAL = cred_group6
);


CREATE EXTERNAL DATA SOURCE source_gold
WITH (
    LOCATION = 'https://neudamgdatalake.blob.core.windows.net/gold',
    CREDENTIAL = cred_group6
);

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
FORMAT_TYPE = PARQUET
)

CREATE EXTERNAL TABLE gold.extsales
WITH
(
LOCATION = 'extsales',
DATA_SOURCE = source_gold,
FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales
SELECT * FROM gold.extsales

