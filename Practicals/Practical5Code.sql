SELECT * FROM `airy-gate-478118-h4.Sales.Data`;

---Q1. Filter all transactions that occurred in the year 2023. Expected output: All columns
SELECT *
FROM `airy-gate-478118-h4.Sales.Data`
WHERE EXTRACT(YEAR FROM DATE(Date)) = 2023;

---Q2. Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.
SELECT *
FROM `airy-gate-478118-h4.Sales.Data`
WHERE `Total Amount` > (
  SELECT AVG(`Total Amount`)
  FROM `airy-gate-478118-h4.Sales.Data`
  );

---Q3. Calculate the total revenue (sum of Total Amount).
SELECT SUM(`Total Amount`) AS Total_Revenue
FROM `airy-gate-478118-h4.Sales.Data`;

---Q4. Display all distinct Product Categories in the dataset.
SELECT DISTINCT `Product Category` AS Product_Category
FROM `airy-gate-478118-h4.Sales.Data`

---Q5. For each Product Category, calculate the total quantity sold.
SELECT
  `Product Category` AS Product_Category,
  SUM(`Quantity`)    AS Total_Quantity
FROM `airy-gate-478118-h4.Sales.Data`
GROUP BY `Product Category`
ORDER BY `Product Category`;

---Q6. Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ (30–59), and ‘Senior’ (60+).
SELECT
  `Customer ID` AS Customer_ID,
  `Age`,
  CASE
    WHEN Age < 30 THEN 'Youth'
    WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
    WHEN Age >= 60 THEN 'Senior'
    ELSE 'Unknown'
  END AS Age_Group
  FROM `airy-gate-478118-h4.Sales.Data`;

  ---Q7. For each Gender, count how many high-value transactions occurred (where Total Amount > 500).
SELECT
  Gender,
  COUNTIF(`Total Amount` > 500) AS High_Value_Transactions
FROM `airy-gate-478118-h4.Sales.Data`
GROUP BY Gender
ORDER BY Gender;

---Q8. For each Product Category, show only those categories where the total revenue exceeds 5,000.
SELECT
  `Product Category` AS Product_Category,
  SUM(`Total Amount`) AS Total_Revenue
FROM `airy-gate-478118-h4.Sales.Data`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

---Q9. Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – 'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200
SELECT
  `Transaction ID` AS Transaction_ID,
  `Price per Unit` AS Price_per_Unit,
  CASE
    WHEN `Price per Unit` < 50 THEN 'Cheap'
    WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
    WHEN `Price per Unit` > 200 THEN 'Expensive'
    ELSE 'Unspecified'
  END AS Unit_Cost_Category
FROM `airy-gate-478118-h4.Sales.Data`;

---Q10. Display all transactions from customers aged 40 or older and add a column Spending_Level showing ‘High’ if Total Amount > 1000, otherwise ‘Low’.
SELECT
  `Customer ID` AS Customer_ID,
  Age,
  `Total Amount` AS Total_Amount,
  CASE
    WHEN `Total Amount` > 1000 THEN 'High'
    ELSE 'Low'
  END AS Spending_Level
FROM `airy-gate-478118-h4.Sales.Data`
WHERE Age >= 40;
