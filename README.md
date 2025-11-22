⭐Food Delivery Analytics – End-to-End Data Analytics Project⭐

This project analyzes food delivery performance and identifies the operational factors that influence delivery time — including weather, traffic level, time of day, distance, vehicle type, and courier experience.
The main objective is to help food-tech and quick-commerce platforms improve delivery accuracy, ETA prediction, resource planning, and customer satisfaction.

🔧 Tools & Tech Used
-> Data Cleaning: Excel
-> Exploratory Data Analysis (EDA):	Python — Pandas, NumPy, Matplotlib
-> Database & Querying	MySQL — analytical queries + SQL View created for optimized reporting
-> Business Intelligence	Power BI — Data modeling, DAX KPIs & interactive dashboard

🧠 Key Business Insights
-> Evening + high traffic = slowest deliveries	Peak-hour resource planning required
-> Rainy weather increases delivery time by 15-20 mins	ETA buffer needed during bad weather
-> Cars are slower than scooters & bikes during peak time	Better vehicle allocation strategy
-> Couriers with 4+ years experience deliver fastest	Experience matters in performance
->Average  delivery time	56.73 minutes
-> % Delayed Orders= 66.40

These insights help companies like Zomato, Swiggy, UberEats, Instamart, Zepto optimize operations & fleet assignment.

📊 Power BI Dashboard Highlights
✔ KPI Cards using DAX
✔ Delivery Drivers — weather, traffic & time of day
✔ Logistics Analysis — vehicle type & courier experience
✔ Delivery-time range slider slicer & weather slicer
✔ Insight-driven storytelling layout

🧮 DAX Measures
Total Orders = COUNT(deliveries[Order_ID])

Average Delivery Time(min) = AVERAGE(deliveries[Delivery_Time_min])

% Delayed Orders = 
VAR delayed = CALCULATE(COUNT(deliveries[Order_ID]), deliveries[Delivery_Time_min] > 45)
RETURN DIVIDE(delayed, COUNT(deliveries[Order_ID])) * 100

🗄 SQL View (Optimized for BI Reporting)
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
    ROUND(SUM(CASE WHEN Delivery_Time_min > 45 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS delayed_percentage
FROM deliveries
GROUP BY
    Time_of_Day, Traffic_Level, Weather, Vehicle_Type, Courier_Experience_yrs;

▶️ How to Use This Project

1️⃣ Clone the repository

git clone https://github.com/<your_username>/Food_Delivery_Analytics.git


2️⃣ Install Python dependencies

pip install pandas numpy matplotlib


3️⃣ Run eda.ipynb to explore EDA

4️⃣ Import SQL file (create_view.sql) into MySQL

5️⃣ Open .pbix file in Power BI Desktop to view dashboard

🚀 Possible Future Enhancements

🔹 Predict delivery time using Machine Learning
🔹 Add GPS mapping visualization
🔹 Build real-time dashboard using APIs
🔹 Automate ETL pipeline

👤 Author
Hani Patel
📌 LinkedIn: http://linkedin.com/in/hani-patel-6a9370265
📌 Email: hanipatel0621@gmail.com

⭐ If you like this project, feel free to star the repository — it motivates me to keep learning and building!
