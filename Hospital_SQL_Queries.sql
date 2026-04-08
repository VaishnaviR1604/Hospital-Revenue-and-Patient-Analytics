create database project;

select * from Appointment;

select * from Billling;

select * from patient;

select * from treatment;

--Total Patients

SELECT COUNT(*) AS Total_Patients
FROM patient;

--Total Revenue

SELECT SUM(Amount) AS Total_Revenue
FROM billling;

--Revenue by Payment

SELECT Payment_Method, SUM(Amount) AS Revenue
FROM billling
GROUP BY Payment_Method
ORDER BY Revenue DESC;

--Monthly Revenue Trend

SELECT MONTH(Bill_Date) AS Month_No,
       SUM(Amount) AS Revenue
FROM billling
GROUP BY MONTH(Bill_Date)
ORDER BY Month_No;

--Gender-wise Patient Count

SELECT Gender, COUNT(*) AS Total
FROM patient
GROUP BY Gender;

--Join Query (Patient + Billing)

SELECT p.Patient_Name,
       b.Amount,
       b.Payment_Status
FROM patient p
JOIN billling b
ON p.Patient_ID = b.Patient_ID;

--Top 4 insurance 

SELECT 
    p.Insurance_Provider,
    SUM(b.Amount) AS Total_Paid
FROM billling b 
join patient p 
on p.Patient_ID = b.Patient_ID
GROUP BY Insurance_Provider
ORDER BY Total_Paid DESC;

-- Gender wise Insurance provide

SELECT 
    p.Gender,
    p.Insurance_Provider,
    SUM(b.Amount) AS Total_Paid
FROM patient p
JOIN billling b
    ON p.Patient_ID = b.Patient_ID
GROUP BY 
    p.Gender,
    p.Insurance_Provider
ORDER BY 
    p.Insurance_Provider,
    Total_Paid DESC;
