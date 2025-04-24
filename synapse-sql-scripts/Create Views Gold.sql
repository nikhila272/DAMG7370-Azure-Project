CREATE VIEW gold.Orders
AS
SELECT *
FROM OPENROWSET(
    BULK 'https://neudamgdatalake.blob.core.windows.net/silver/Global_Superstore_Orders/part-00000-tid-40339666944505505-3e83b159-e51d-4630-9fcf-1bd4201547e2-44-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) AS QUER1;

CREATE VIEW gold.sales
AS
SELECT
*
FROM
OPENROWSET(
BULK 'https://neudamgdatalake.blob.core.windows.net/silver/Global_Superstore_Orders/part-00000-tid-40339666944505505-3e83b159-e51d-4630-9fcf-1bd4201547e2-44-1-c000.snappy.parquet',
FORMAT = 'PARQUET'
) as QUER1