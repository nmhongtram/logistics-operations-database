/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
    Run this script to re-define the DDL structure of 'bronze' tables
===============================================================================
*/

-----------------------------------------------------------------------
-- DRIVERS
-----------------------------------------------------------------------
-- driver_id, first_name, last_name, hire_date, termination_date,
-- license_number, license_state, date_of_birth, home_terminal,
-- employment_status, cdl_class, years_experience
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.drivers', 'U') IS NOT NULL
    DROP TABLE bronze.drivers;
GO

CREATE TABLE bronze.drivers (
    driver_id NVARCHAR(50),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    hire_date DATE,
    termination_date DATE,
    license_number NVARCHAR(50),
    license_state NVARCHAR(10),
    date_of_birth DATE,
    home_terminal NVARCHAR(100),
    employment_status NVARCHAR(50),
    cdl_class NVARCHAR(10),
    years_experience INT
);
GO

-----------------------------------------------------------------------
-- TRUCKS
-----------------------------------------------------------------------
-- truck_id, unit_number, make, model_year, vin,
-- acquisition_date, acquisition_mileage, fuel_type,
-- tank_capacity_gallons, status, home_terminal
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.trucks', 'U') IS NOT NULL
    DROP TABLE bronze.trucks;
GO

CREATE TABLE bronze.trucks (
    truck_id NVARCHAR(50),
    unit_number NVARCHAR(50),
    make NVARCHAR(50),
    model_year INT,
    vin NVARCHAR(50),
    acquisition_date DATE,
    acquisition_mileage INT,
    fuel_type NVARCHAR(50),
    tank_capacity_gallons INT,
    status NVARCHAR(50),
    home_terminal NVARCHAR(100)
);
GO

-----------------------------------------------------------------------
-- TRAILERS
-----------------------------------------------------------------------
-- trailer_id, trailer_number, trailer_type, length_feet,
-- model_year, vin, acquisition_date, status, current_location
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.trailers', 'U') IS NOT NULL
    DROP TABLE bronze.trailers;
GO

CREATE TABLE bronze.trailers (
    trailer_id NVARCHAR(50),
    trailer_number NVARCHAR(50),
    trailer_type NVARCHAR(50),
    length_feet INT,
    model_year INT,
    vin NVARCHAR(50),
    acquisition_date DATE,
    status NVARCHAR(50),
    current_location NVARCHAR(100)
);
GO

-----------------------------------------------------------------------
-- CUSTOMERS
-----------------------------------------------------------------------
-- customer_id, customer_name, customer_type, credit_terms_days,
-- primary_freight_type, account_status, contract_start_date,
-- annual_revenue_potential
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.customers', 'U') IS NOT NULL
    DROP TABLE bronze.customers;
GO

CREATE TABLE bronze.customers (
    customer_id NVARCHAR(50),
    customer_name NVARCHAR(100),
    customer_type NVARCHAR(50),
    credit_terms_days INT,
    primary_freight_type NVARCHAR(50),
    account_status NVARCHAR(50),
    contract_start_date DATE,
    annual_revenue_potential DECIMAL(18,2)
);
GO

-----------------------------------------------------------------------
-- FACILITIES
-----------------------------------------------------------------------
-- facility_id, facility_name, facility_type, city, state,
-- latitude, longitude, dock_doors, operating_hours
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.facilities', 'U') IS NOT NULL
    DROP TABLE bronze.facilities;
GO

CREATE TABLE bronze.facilities (
    facility_id NVARCHAR(50),
    facility_name NVARCHAR(100),
    facility_type NVARCHAR(50),
    city NVARCHAR(100),
    state NVARCHAR(10),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    dock_doors INT,
    operating_hours NVARCHAR(50)
);
GO

-----------------------------------------------------------------------
-- ROUTES
-----------------------------------------------------------------------
-- route_id, origin_city, origin_state, destination_city,
-- destination_state, typical_distance_miles, base_rate_per_mile,
-- fuel_surcharge_rate, typical_transit_days
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.routes', 'U') IS NOT NULL
    DROP TABLE bronze.routes;
GO

CREATE TABLE bronze.routes (
    route_id NVARCHAR(50),
    origin_city NVARCHAR(100),
    origin_state NVARCHAR(10),
    destination_city NVARCHAR(100),
    destination_state NVARCHAR(10),
    typical_distance_miles INT,
    base_rate_per_mile DECIMAL(10,2),
    fuel_surcharge_rate DECIMAL(10,2),
    typical_transit_days INT
);
GO

-----------------------------------------------------------------------
-- LOADS
-----------------------------------------------------------------------
-- load_id, customer_id, route_id, load_date, load_type,
-- weight_lbs, pieces, revenue, fuel_surcharge,
-- accessorial_charges, load_status, booking_type
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.loads', 'U') IS NOT NULL
    DROP TABLE bronze.loads;
GO

CREATE TABLE bronze.loads (
    load_id NVARCHAR(50),
    customer_id NVARCHAR(50),
    route_id NVARCHAR(50),
    load_date DATE,
    load_type NVARCHAR(50),
    weight_lbs INT,
    pieces INT,
    revenue DECIMAL(18,2),
    fuel_surcharge DECIMAL(18,2),
    accessorial_charges DECIMAL(18,2),
    load_status NVARCHAR(50),
    booking_type NVARCHAR(50)
);
GO

-----------------------------------------------------------------------
-- TRIPS
-----------------------------------------------------------------------
-- trip_id, load_id, driver_id, truck_id, trailer_id,
-- dispatch_date, actual_distance_miles, actual_duration_hours,
-- fuel_gallons_used, average_mpg, idle_time_hours, trip_status
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.trips', 'U') IS NOT NULL
    DROP TABLE bronze.trips;
GO

CREATE TABLE bronze.trips (
    trip_id NVARCHAR(50),
    load_id NVARCHAR(50),
    driver_id NVARCHAR(50),
    truck_id NVARCHAR(50),
    trailer_id NVARCHAR(50),
    dispatch_date DATE,
    actual_distance_miles INT,
    actual_duration_hours DECIMAL(10,2),
    fuel_gallons_used DECIMAL(10,2),
    average_mpg DECIMAL(10,2),
    idle_time_hours DECIMAL(10,2),
    trip_status NVARCHAR(50)
);
GO

-----------------------------------------------------------------------
-- FUEL PURCHASES
-----------------------------------------------------------------------
-- fuel_purchase_id, trip_id, truck_id, driver_id, purchase_date,
-- location_city, location_state, gallons, price_per_gallon,
-- total_cost, fuel_card_number
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.fuel_purchases', 'U') IS NOT NULL
    DROP TABLE bronze.fuel_purchases;
GO

CREATE TABLE bronze.fuel_purchases (
    fuel_purchase_id NVARCHAR(50),
    trip_id NVARCHAR(50),
    truck_id NVARCHAR(50),
    driver_id NVARCHAR(50),
    purchase_date DATETIME,
    location_city NVARCHAR(100),
    location_state NVARCHAR(10),
    gallons DECIMAL(10,2),
    price_per_gallon DECIMAL(10,3),
    total_cost DECIMAL(18,2),
    fuel_card_number NVARCHAR(50)
);
GO

-----------------------------------------------------------------------
-- MAINTENANCE RECORDS
-----------------------------------------------------------------------
-- maintenance_id, truck_id, maintenance_date, maintenance_type,
-- odometer_reading, labor_hours, labor_cost, parts_cost, total_cost,
-- facility_location, downtime_hours, service_description
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.maintenance_records', 'U') IS NOT NULL
    DROP TABLE bronze.maintenance_records;
GO

CREATE TABLE bronze.maintenance_records (
    maintenance_id NVARCHAR(50),
    truck_id NVARCHAR(50),
    maintenance_date DATETIME,
    maintenance_type NVARCHAR(50),
    odometer_reading INT,
    labor_hours DECIMAL(10,2),
    labor_cost DECIMAL(18,2),
    parts_cost DECIMAL(18,2),
    total_cost DECIMAL(18,2),
    facility_location NVARCHAR(100),
    downtime_hours DECIMAL(10,2),
    service_description NVARCHAR(255)
);
GO

-----------------------------------------------------------------------
-- DELIVERY EVENTS
-----------------------------------------------------------------------
-- event_id, load_id, trip_id, event_type, facility_id,
-- scheduled_datetime, actual_datetime, detention_minutes,
-- on_time_flag, location_city, location_state
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.delivery_events', 'U') IS NOT NULL
    DROP TABLE bronze.delivery_events;
GO

CREATE TABLE bronze.delivery_events (
    event_id NVARCHAR(50),
    load_id NVARCHAR(50),
    trip_id NVARCHAR(50),
    event_type NVARCHAR(50),
    facility_id NVARCHAR(50),
    scheduled_datetime DATETIME2(6),
    actual_datetime DATETIME2(6),
    detention_minutes INT,
    on_time_flag NVARCHAR(10),
    location_city NVARCHAR(100),
    location_state NVARCHAR(10)
);
GO

-----------------------------------------------------------------------
-- SAFETY INCIDENTS
-----------------------------------------------------------------------
-- incident_id, trip_id, truck_id, driver_id, incident_date,
-- incident_type, location_city, location_state, at_fault_flag,
-- injury_flag, vehicle_damage_cost, cargo_damage_cost,
-- claim_amount, preventable_flag, description
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.safety_incidents', 'U') IS NOT NULL
    DROP TABLE bronze.safety_incidents;
GO

CREATE TABLE bronze.safety_incidents (
    incident_id NVARCHAR(50),
    trip_id NVARCHAR(50),
    truck_id NVARCHAR(50),
    driver_id NVARCHAR(50),
    incident_date DATETIME,
    incident_type NVARCHAR(50),
    location_city NVARCHAR(100),
    location_state NVARCHAR(10),
    at_fault_flag NVARCHAR(10),
    injury_flag NVARCHAR(10),
    vehicle_damage_cost DECIMAL(18,2),
    cargo_damage_cost DECIMAL(18,2),
    claim_amount DECIMAL(18,2),
    preventable_flag NVARCHAR(10),
    description NVARCHAR(255)
);
GO

-----------------------------------------------------------------------
-- DRIVER MONTHLY METRICS
-----------------------------------------------------------------------
-- driver_id, month, trips_completed, total_miles, total_revenue,
-- average_mpg, total_fuel_gallons, on_time_delivery_rate,
-- average_idle_hours
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.driver_monthly_metrics', 'U') IS NOT NULL
    DROP TABLE bronze.driver_monthly_metrics;
GO

CREATE TABLE bronze.driver_monthly_metrics (
    driver_id NVARCHAR(50),
    month DATE,
    trips_completed INT,
    total_miles INT,
    total_revenue DECIMAL(18,2),
    average_mpg DECIMAL(10,2),
    total_fuel_gallons DECIMAL(18,2),
    on_time_delivery_rate DECIMAL(5,3),
    average_idle_hours DECIMAL(10,2)
);
GO

-----------------------------------------------------------------------
-- TRUCK UTILIZATION METRICS
-----------------------------------------------------------------------
-- truck_id, month, trips_completed, total_miles, total_revenue,
-- average_mpg, maintenance_events, maintenance_cost,
-- downtime_hours, utilization_rate
-----------------------------------------------------------------------
IF OBJECT_ID('bronze.truck_utilization_metrics', 'U') IS NOT NULL
    DROP TABLE bronze.truck_utilization_metrics;
GO

CREATE TABLE bronze.truck_utilization_metrics (
    truck_id NVARCHAR(50),
    month DATE,
    trips_completed INT,
    total_miles INT,
    total_revenue DECIMAL(18,2),
    average_mpg DECIMAL(10,2),
    maintenance_events INT,
    maintenance_cost DECIMAL(18,2),
    downtime_hours DECIMAL(10,2),
    utilization_rate DECIMAL(5,3)
);
GO


/*
trucks
truck_id,unit_number,make,model_year,vin,acquisition_date,acquisition_mileage,fuel_type,tank_capacity_gallons,status,home_terminal
TRK00001,3463,Peterbilt,2016,1VV205190335317039,2017-04-27,18814,Diesel,200,Active,Omaha

trailers
trailer_id,trailer_number,trailer_type,length_feet,model_year,vin,acquisition_date,status,current_location
TRL00001,4290,Refrigerated,53,2016,1AV889081755621178,2018-05-11,Active,Kansas City

customers
customer_id,customer_name,customer_type,credit_terms_days,primary_freight_type,account_status,contract_start_date,annual_revenue_potential
CUST00001,Metro Wholesale,Dedicated,60,General,Inactive,2020-02-20,985117

facilities
facility_id,facility_name,facility_type,city,state,latitude,longitude,dock_doors,operating_hours
FAC00001,Houston Distribution Center,Cross-Dock,Houston,TX,29.7604,-95.3698,125,24/7

routes
route_id,origin_city,origin_state,destination_city,destination_state,typical_distance_miles,base_rate_per_mile,fuel_surcharge_rate,typical_transit_days
RTE00001,Atlanta,GA,Chicago,IL,677,1.7,0.19,1

loads
load_id,customer_id,route_id,load_date,load_type,weight_lbs,pieces,revenue,fuel_surcharge,accessorial_charges,load_status,booking_type
LOAD00000001,CUST00183,RTE00019,2022-01-01,Dry Van,19178,13,3045.23,406.72,100,Completed,Spot

trips
trip_id,load_id,driver_id,truck_id,trailer_id,dispatch_date,actual_distance_miles,actual_duration_hours,fuel_gallons_used,average_mpg,idle_time_hours,trip_status
TRIP00000001,LOAD00000001,DRV00117,TRK00035,TRL00167,2022-01-01,1314,26.2,183.8,7.15,3.5,Completed

fuel_purchases
fuel_purchase_id,trip_id,truck_id,driver_id,purchase_date,location_city,location_state,gallons,price_per_gallon,total_cost,fuel_card_number
FUEL00000001,TRIP00051284,TRK00045,DRV00102,2023-10-22 05:00:00,Columbus,MN,131.6,3.399,447.31,FC567161

maintenance_records
maintenance_id,truck_id,maintenance_date,maintenance_type,odometer_reading,labor_hours,labor_cost,parts_cost,total_cost,facility_location,downtime_hours,service_description
MAINT00000001,TRK00085,2022-01-01,Inspection,400255,7.8,781.42,10.41,791.83,Kansas City,22.2,Emergency Inspection

delivery_events
event_id,load_id,trip_id,event_type,facility_id,scheduled_datetime,actual_datetime,detention_minutes,on_time_flag,location_city,location_state
EVT00000001,LOAD00000001,TRIP00000001,Pickup,FAC00034,2022-01-01 18:00:00.000000,2022-01-01 20:58:55.918185,0,False,Houston,TX

safety_incidents
incident_id,trip_id,truck_id,driver_id,incident_date,incident_type,location_city,location_state,at_fault_flag,injury_flag,vehicle_damage_cost,cargo_damage_cost,claim_amount,preventable_flag,description
INC00000001,TRIP00036079,TRK00006,DRV00006,2023-04-09 14:00:00,Moving Violation,Columbus,PA,True,False,12629.26,0.0,12629.26,True,Severe incident involving equipment

driver_monthly_metrics
driver_id,month,trips_completed,total_miles,total_revenue,average_mpg,total_fuel_gallons,on_time_delivery_rate,average_idle_hours
DRV00001,2022-01-01,26,36620,79141.59,6.61,5574.7,0.385,8.2

truck_utilization_metrics
truck_id,month,trips_completed,total_miles,total_revenue,average_mpg,maintenance_events,maintenance_cost,downtime_hours,utilization_rate
TRK00001,2022-01-01,22,39269,84792.02,6.78,2,4380.98,63.1,0.71


*/
