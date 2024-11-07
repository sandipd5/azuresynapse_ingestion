-- External File Format

IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'MyDelimitedTextFormat')
CREATE EXTERNAL FILE FORMAT MyDelimitedTextFormat
WITH (FORMAT_TYPE = DELIMITEDTEXT,
FORMAT_OPTIONS(
    FIELD_TERMINATOR = ',',
    STRING_DELIMITER = '"',
    FIRST_ROW = 2,
    USE_TYPE_DEFAULT = FALSE)
);

-- External Data Source
IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'MyDataLakeStorage')
CREATE EXTERNAL DATA SOURCE MyDataLakeStorage
WITH (
    LOCATION = 'abfs://ncpltut@samplestoragencpl.dfs.core.windows.net'
)
-- External Table
CREATE EXTERNAL TABLE dbo.my_external_data (
    account_id INT,
    customer_id INT,
    account_type VARCHAR(255),
    balance DECIMAL
    )
    WITH (
        LOCATION = 'bronze/dbo.accounts.txt',
        DATA_SOURCE = MyDataLakeStorage,
        FILE_FORMAT = MyDelimitedTextFormat
    );

    SELECT * FROM dbo.my_external_data