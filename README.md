# Dynamic Content Creation using Azure Synapse 

## Project Structure

This project includes the following files:
- **SQL Scripts**: Contains scripts to set up external tables, file formats, and data sources.
- **Data Lake Storage Connection Configuration**: Instructions to set up linked services and datasets.
- **Screenshots**: Visual documentation of key steps and configurations in Synapse.
- **JSON Configuration Files**: Parameterized JSON files for dynamic content creation.

## Workflow

The pipeline is structured in the following steps:

1. **Create External Table**:
   - Define an external file format (`MyDelimitedTextFormat`) for reading delimited text files.
   - Configure an external data source (`MyDataLakeStorage`) to connect Synapse to Azure Data Lake.
   - Create an external table (`dbo.my_external_data`) that points to files in Data Lake Storage.

2. **Data Ingestion Options**:
   - **Option 1: Azure Synapse Pipeline** - Configure a pipeline that automates data movement from Azure SQL Database to Data Lake Storage. The pipeline uses `utcNow()` to set dynamic file names (e.g., `customer_2024-10-03.csv`).
   - **Option 2: Tumnbling Window Trigger** - Alternatively, upload data files with a tumbling window trigger  directly to the Data Lake container.


3. **Query the External Table**:
   - Run queries against the external table in Synapse’s serverless SQL pool to read data directly from files in Data Lake Storage:
     ```sql
     SELECT * FROM dbo.my_external_data;
     ```
