/* =========================================================
   WEEK 3 SQL PROJECT 2
   AnalystLab Africa Data Analytics Internship
   Sales Data Analysis Using SQL Server (SSMS)
   Database: AnalystLabSalesDB
   Table: Sales_Transactions
   ========================================================= */


/* =========================================================
   1. DATABASE SETUP
   ========================================================= */

CREATE DATABASE AnalystLabSalesDB;
GO

USE AnalystLabSalesDB;
GO


/* =========================================================
   2. DATA STRUCTURE CHECK
   ========================================================= */

EXEC sp_columns Sales_Transactions;
GO


/* =========================================================
   3. DATA EXPLORATION
   ========================================================= */

-- View full dataset
SELECT * 
FROM Sales_Transactions;
GO

-- Preview first 10 rows
SELECT TOP 10 * 
FROM Sales_Transactions;
GO

-- Selected important columns
SELECT TOP 10 
    ORDERNUMBER,
    CUSTOMERNAME,
    PRODUCTLINE,
    QUANTITYORDERED,
    PRICEEACH,
    SALES,
    ORDERDATE
FROM Sales_Transactions;
GO


/* =========================================================
   4. DATA FILTERING & SORTING
   ========================================================= */

-- High value transactions
SELECT 
    ORDERNUMBER,
    CUSTOMERNAME,
    PRODUCTLINE,
    SALES,
    ORDERDATE
FROM Sales_Transactions
WHERE SALES > 500
ORDER BY SALES DESC;
GO


/* =========================================================
   5. PRODUCT PERFORMANCE ANALYSIS
   ========================================================= */

SELECT 
    PRODUCTLINE,
    COUNT(*) AS TotalOrders,
    SUM(SALES) AS TotalRevenue,
    AVG(SALES) AS AverageSale,
    SUM(QUANTITYORDERED) AS TotalQuantity
FROM Sales_Transactions
GROUP BY PRODUCTLINE
ORDER BY TotalRevenue DESC;
GO


/* =========================================================
   6. CUSTOMER ANALYSIS
   ========================================================= */

-- Top customers by revenue
SELECT TOP 10
    CUSTOMERNAME,
    SUM(SALES) AS TotalSpent
FROM Sales_Transactions
GROUP BY CUSTOMERNAME
ORDER BY TotalSpent DESC;
GO

-- Customer frequency analysis
SELECT 
    CUSTOMERNAME,
    COUNT(ORDERNUMBER) AS NumberOfOrders,
    SUM(SALES) AS TotalRevenue
FROM Sales_Transactions
GROUP BY CUSTOMERNAME
ORDER BY NumberOfOrders DESC;
GO


/* =========================================================
   7. PRODUCT INSIGHTS
   ========================================================= */

-- Best performing product lines
SELECT 
    PRODUCTLINE,
    SUM(SALES) AS TotalRevenue,
    COUNT(*) AS NumberOfOrders
FROM Sales_Transactions
GROUP BY PRODUCTLINE
ORDER BY TotalRevenue DESC;
GO

-- Top products by revenue
SELECT TOP 10
    PRODUCTCODE,
    SUM(SALES) AS TotalRevenue,
    SUM(QUANTITYORDERED) AS TotalUnitsSold
FROM Sales_Transactions
GROUP BY PRODUCTCODE
ORDER BY TotalRevenue DESC;
GO


/* =========================================================
   8. DATA UNDERSTANDING (DIMENSIONS)
   ========================================================= */

-- Unique customers
SELECT DISTINCT CUSTOMERNAME
FROM Sales_Transactions;
GO

-- Unique products
SELECT DISTINCT PRODUCTLINE, PRODUCTCODE
FROM Sales_Transactions;
GO


/* =========================================================
   9. TIME SERIES ANALYSIS
   ========================================================= */

-- Monthly revenue trend
SELECT 
    CAST(YEAR(CAST(ORDERDATE AS DATETIME)) AS VARCHAR(4)) + '-' +
    RIGHT('0' + CAST(MONTH(CAST(ORDERDATE AS DATETIME)) AS VARCHAR(2)), 2) 
    AS SalesMonth,
    
    SUM(SALES) AS TotalRevenue,
    COUNT(*) AS NumberOfOrders
FROM Sales_Transactions
GROUP BY 
    YEAR(CAST(ORDERDATE AS DATETIME)),
    MONTH(CAST(ORDERDATE AS DATETIME))
ORDER BY 
    YEAR(CAST(ORDERDATE AS DATETIME)),
    MONTH(CAST(ORDERDATE AS DATETIME));
GO

-- Daily revenue trend with running total
SELECT 
    CAST(ORDERDATE AS DATE) AS OrderDate,
    SUM(SALES) AS DailySales,
    SUM(SUM(SALES)) OVER (ORDER BY CAST(ORDERDATE AS DATE)) AS RunningTotalRevenue
FROM Sales_Transactions
GROUP BY CAST(ORDERDATE AS DATE);
GO


/* =========================================================
   10. ADVANCED SQL (WINDOW FUNCTIONS)
   ========================================================= */

-- Customer ranking
SELECT 
    CUSTOMERNAME,
    SUM(SALES) AS TotalSpent,
    RANK() OVER (ORDER BY SUM(SALES) DESC) AS CustomerRank
FROM Sales_Transactions
GROUP BY CUSTOMERNAME;
GO

-- Row number ranking
SELECT 
    CUSTOMERNAME,
    SUM(SALES) AS TotalSpent,
    ROW_NUMBER() OVER (ORDER BY SUM(SALES) DESC) AS RowNum
FROM Sales_Transactions
GROUP BY CUSTOMERNAME;
GO

-- Running total revenue

SELECT 
    ORDERNUMBER,
    ORDERDATE, 
    SALES, 
    SUM(SALES) OVER (ORDER BY ORDERDATE, ORDERNUMBER) AS RunningTotalRevenue
FROM Sales_Transactions;
GO

/* =========================================================
   END OF PROJECT
   ========================================================= */