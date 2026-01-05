/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'LogisticsOperations' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.
	
WARNING:
    Running this script will drop the entire 'LogisticsOperations' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'LogisticsOperations' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'LogisticsOperations')
BEGIN
    ALTER DATABASE LogisticsOperations SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE LogisticsOperations;
END;
GO

-- Create database
CREATE DATABASE LogisticsOperations;
GO

USE LogisticsOperations;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO 
