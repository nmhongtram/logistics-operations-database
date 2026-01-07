/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE TABLE bronze.bronze_load_config (
    table_name NVARCHAR(100),
    file_path NVARCHAR(255)
);
GO

INSERT INTO bronze.bronze_load_config (table_name, file_path)
VALUES
('drivers', 'C:\sql\dwh_project\datasets\drivers.csv'),
('trucks', 'C:\sql\dwh_project\datasets\trucks.csv'),
('trailers', 'C:\sql\dwh_project\datasets\trailers.csv'),
('customers', 'C:\sql\dwh_project\datasets\customers.csv'),
('facilities', 'C:\sql\dwh_project\datasets\facilities.csv'),
('routes', 'C:\sql\dwh_project\datasets\routes.csv'),
('loads', 'C:\sql\dwh_project\datasets\loads.csv'),
('trips', 'C:\sql\dwh_project\datasets\trips.csv'),
('fuel_purchases', 'C:\sql\dwh_project\datasets\fuel_purchases.csv'),
('maintenance_records', 'C:\sql\dwh_project\datasets\maintenance_records.csv'),
('delivery_events', 'C:\sql\dwh_project\datasets\delivery_events.csv'),
('safety_incidents', 'C:\sql\dwh_project\datasets\safety_incidents.csv'),
('driver_monthly_metrics', 'C:\sql\dwh_project\datasets\driver_monthly_metrics.csv'),
('truck_utilization_metrics', 'C:\sql\dwh_project\datasets\truck_utilization_metrics.csv');
GO

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    DECLARE 
        @table_name NVARCHAR(100),
        @file_path NVARCHAR(255),
        @sql NVARCHAR(MAX),
        @start_time DATETIME,
        @end_time DATETIME;

    DECLARE bronze_cursor CURSOR FOR
        SELECT table_name, file_path
        FROM bronze.bronze_load_config;

    BEGIN TRY
        PRINT '==========================================';
        PRINT 'Loading Bronze Layer';
        PRINT '==========================================';

        OPEN bronze_cursor;
        FETCH NEXT FROM bronze_cursor INTO @table_name, @file_path;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @start_time = GETDATE();

            PRINT '>> Truncating Table: bronze.' + @table_name;
            SET @sql = 'TRUNCATE TABLE bronze.' + @table_name;
            EXEC sp_executesql @sql;

            PRINT '>> Loading Data into: bronze.' + @table_name;
            SET @sql = '
                BULK INSERT bronze.' + @table_name + '
                FROM ''' + @file_path + '''
                WITH (
                    FIRSTROW = 2,
                    FIELDTERMINATOR = '','',
                    ROWTERMINATOR = ''\n'',
                    TABLOCK
                );';

            EXEC sp_executesql @sql;

            SET @end_time = GETDATE();
            PRINT '>> Load Duration: ' 
                + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR)
                + ' seconds';
            PRINT '>> ---------------------------------------';

            FETCH NEXT FROM bronze_cursor INTO @table_name, @file_path;
        END;

        CLOSE bronze_cursor;
        DEALLOCATE bronze_cursor;

        PRINT '==========================================';
        PRINT 'Bronze Layer Load Completed Successfully';
        PRINT '==========================================';
    END TRY
    BEGIN CATCH
        CLOSE bronze_cursor;
        DEALLOCATE bronze_cursor;

        PRINT '==========================================';
        PRINT 'ERROR OCCURRED DURING BRONZE LOAD';
        PRINT ERROR_MESSAGE();
        PRINT '==========================================';
    END CATCH
END;
GO