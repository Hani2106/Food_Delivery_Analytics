CREATE DATABASE food_delivery;
USE food_delivery;

CREATE TABLE deliveries (
    Order_ID INT,
    Distance_km FLOAT,
    Weather VARCHAR(100),
    Traffic_Level VARCHAR(50),
    Time_of_Day VARCHAR(50),
    Vehicle_Type VARCHAR(50),
    Preparation_Time_min INT,
    Courier_Experience_yrs VARCHAR(50),
    Delivery_Time_min INT
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '"C:\Users\Hani Patel\Downloads\Data_analyst_Food_delivery\python\Food_Delivery_Final_python.csv"'
INTO TABLE deliveries
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID, Distance_km, Weather, Traffic_Level, Time_of_Day, Vehicle_Type, Preparation_Time_min, Courier_Experience_yrs, Delivery_Time_min);


CREATE USER IF NOT EXISTS 'datauser'@'localhost' IDENTIFIED BY 'StrongPass123!';
GRANT ALL PRIVILEGES ON food_delivery.* TO 'datauser'@'localhost';
FLUSH PRIVILEGES;

SELECT COUNT(*) FROM deliveries;

SELECT * FROM deliveries LIMIT 5;

SELECT
    MIN(Delivery_Time_min) AS min_delivery_time,
    MAX(Delivery_Time_min) AS max_delivery_time,
    AVG(Delivery_Time_min) AS avg_delivery_time
FROM deliveries;

SELECT
    Traffic_Level,
    COUNT(*) AS total_orders,
    AVG(Delivery_Time_min) AS avg_delivery_time
FROM deliveries
GROUP BY Traffic_Level
ORDER BY avg_delivery_time DESC;

SELECT
    Weather,
    COUNT(*) AS total_orders,
    AVG(Delivery_Time_min) AS avg_delivery_time
FROM deliveries
GROUP BY Weather
ORDER BY avg_delivery_time DESC;

SELECT
    Time_of_Day,
    COUNT(*) AS total_orders,
    AVG(Delivery_Time_min) AS avg_delivery_time
FROM deliveries
GROUP BY Time_of_Day
ORDER BY avg_delivery_time DESC;

SELECT
    Vehicle_Type,
    COUNT(*) AS total_orders,
    AVG(Delivery_Time_min) AS avg_delivery_time
FROM deliveries
GROUP BY Vehicle_Type
ORDER BY avg_delivery_time;

SELECT
    Courier_Experience_yrs,
    COUNT(*) AS total_orders,
    AVG(Delivery_Time_min) AS avg_delivery_time
FROM deliveries
GROUP BY Courier_Experience_yrs
ORDER BY avg_delivery_time;

SELECT
    SUM(CASE WHEN Delivery_Time_min > 45 THEN 1 ELSE 0 END) AS delayed_orders,
    COUNT(*) AS total_orders,
    ROUND(
        SUM(CASE WHEN Delivery_Time_min > 45 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS delayed_percentage
FROM deliveries;

SELECT
    Time_of_Day,
    Traffic_Level,
    COUNT(*) AS total_orders,
    AVG(Delivery_Time_min) AS avg_delivery_time
FROM deliveries
GROUP BY Time_of_Day, Traffic_Level
ORDER BY avg_delivery_time DESC;


CREATE OR REPLACE VIEW delivery_analysis_view AS
SELECT
    Time_of_Day,
    Traffic_Level,
    Weather,
    Vehicle_Type,
    Courier_Experience_yrs,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delivery_Time_min), 2) AS avg_delivery_time,
    SUM(CASE WHEN Delivery_Time_min > 45 THEN 1 ELSE 0 END) AS delayed_orders,
    ROUND(
        SUM(CASE WHEN Delivery_Time_min > 45 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS delayed_percentage
FROM deliveries
GROUP BY 
    Time_of_Day,
    Traffic_Level,
    Weather,
    Vehicle_Type,
    Courier_Experience_yrs;

SELECT * FROM delivery_analysis_view LIMIT 10;





