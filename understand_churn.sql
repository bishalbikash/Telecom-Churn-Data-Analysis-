DROP DATABASE IF EXISTS customer_churn_analysis;
CREATE DATABASE customer_churn_analysis;
CREATE TABLE IF NOT EXISTS telco_churn (
    customerID TEXT,
    gender TEXT,
    SeniorCitizen INTEGER,
    Partner TEXT,
    Dependents TEXT,
    tenure INTEGER,
    PhoneService TEXT,
    MultipleLines TEXT,
    InternetService TEXT,
    OnlineSecurity TEXT,
    OnlineBackup TEXT,
    DeviceProtection TEXT,
    TechSupport TEXT,
    StreamingTV TEXT,
    StreamingMovies TEXT,
    Contract TEXT,
    PaperlessBilling TEXT,
    PaymentMethod TEXT,
    MonthlyCharges REAL,
    TotalCharges REAL,
    Churn TEXT
);

SELECT COUNT(*) FROM telco_churn;

SELECT * FROM telco_churn LIMIT 5;

SELECT Churn, COUNT(*) FROM telco_churn
GROUP BY Churn;

SELECT COUNT(*) FROM telco_churn
WHERE TotalCharges IS NULL OR TotalCharges = '';

SELECT Churn, AVG(MonthlyCharges) FROM telco_churn
GROUP BY Churn;

SELECT 
    SUM(CASE WHEN TotalCharges IS NULL OR TotalCharges = '' THEN 1 ELSE 0 END) AS totalcharges_missing,
    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS monthlycharges_missing,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS tenure_missing
FROM telco_churn;

SELECT 
    SUM(customerID IS NULL OR customerID = '') AS customerID_null,
    SUM(gender IS NULL OR gender = '') AS gender_null,
    SUM(SeniorCitizen IS NULL) AS sc_null,
    SUM(Partner IS NULL OR Partner = '') AS partner_null,
    SUM(Dependents IS NULL OR Dependents = '') AS dependents_null
FROM telco_churn;

SELECT 
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure,
    AVG(tenure) AS avg_tenure
FROM telco_churn;

SELECT 
    MIN(MonthlyCharges) AS min_monthly,
    MAX(MonthlyCharges) AS max_monthly,
    AVG(MonthlyCharges) AS avg_monthly
FROM telco_churn;

SELECT gender, COUNT(*) FROM telco_churn
GROUP BY gender;

SELECT Contract, COUNT(*) FROM telco_churn
GROUP BY Contract;

SELECT Churn, AVG(tenure) AS avg_tenure FROM telco_churn
GROUP BY Churn;

SELECT Churn, AVG(MonthlyCharges) AS avg_monthly FROM telco_churn
GROUP BY Churn;

SELECT Contract, Churn, COUNT(*) AS count FROM telco_churn
GROUP BY Contract, Churn ORDER BY Contract, Churn;














