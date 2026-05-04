SELECT count(*) FROM fraud_data;

--Summary of Fraud Transactions

SELECT 
    COUNT(*) as total_fraud_cases,
    SUM("Amount") as total_fraud_amount,
    AVG("Amount") as avg_fraud_value
FROM fraud_data
WHERE "Class" = 1;

--Peak Fraud Hours (Time Pattern)

SELECT 
    "Hour", 
    COUNT(*) as fraud_count
FROM fraud_data
WHERE "Class" = 1
GROUP BY "Hour"
ORDER BY fraud_count DESC
LIMIT 5;

--High-Value Fraud Alerts

SELECT "Time", "Amount", "Hour"
FROM fraud_data
WHERE "Class" = 1 AND "Amount" > 100
ORDER BY "Amount" DESC;

--The "Velocity" Check

SELECT "Time", COUNT(*) as tx_count, SUM("Amount") as total_val
FROM fraud_data
WHERE "Class" = 1
GROUP BY "Time"
HAVING COUNT(*) > 1
ORDER BY tx_count DESC;

--High-Value Fraud vs Time

SELECT 
    "Hour", 
    MAX("Amount") as max_fraud_amount,
    COUNT(*) as total_cases
FROM fraud_data
WHERE "Class" = 1
GROUP BY "Hour"
ORDER BY max_fraud_amount DESC;

--Cumulative Fraud Loss (Day-over-Day impact)

SELECT 
    "Hour", 
    SUM("Amount") OVER (ORDER BY "Hour") as cumulative_fraud_loss
FROM (
    SELECT "Hour", SUM("Amount") as "Amount"
    FROM fraud_data 
    WHERE "Class" = 1 
    GROUP BY "Hour"
) subquery;

--Fraud "Intensity" by Amount Range

SELECT 
    CASE 
        WHEN "Amount" <= 10 THEN '0-10 (Micro Fraud)'
        WHEN "Amount" > 10 AND "Amount" <= 100 THEN '11-100 (Mid-Range)'
        ELSE '100+ (High Value)'
    END as amount_category,
    COUNT(*) as total_cases
FROM fraud_data
WHERE "Class" = 1
GROUP BY amount_category
ORDER BY total_cases DESC;