/* 
===============================================================================================
Create Database and Schemas (PostgreSQL 17)
===============================================================================================

Script Purpose:
This script drops the "DataWarehouse" database if it exists, recreates it, and sets up 
the "bronze", "silver", and "gold" schemas.

Warning:
Running this script will forcefully disconnect all users and permanently delete 
the "DataWarehouse" database if it exists.
*/

-- Step 1: Drop existing database (WITH (FORCE) terminates active connections)
DROP DATABASE IF EXISTS "DataWarehouse" WITH (FORCE);

-- Step 2: Recreate the database
CREATE DATABASE "DataWarehouse";

-- Step 3: Switch connection context to the new database (psql terminal command)
\c "DataWarehouse"

-- Step 4: Create schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
