use	salesDB;

/*Create  sales Table*/
CREATE TABLE Sales (
    Order_ID VARCHAR(20),
    Amount INT,
    Profit INT,
    Quantity INT,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    PaymentMode VARCHAR(20),
    Order_Date DATE,
    CustomerName VARCHAR(100),
    State VARCHAR(50),
    City VARCHAR(50)
);

/*Insert values  into the table*/
INSERT INTO Sales
VALUES
('B-26776', 9726, 1275, 5, 'Electronics', 'Phones',
 'UPI', '2022-01-01', 'John Smith', 'California', 'Los Angeles');

/*View Data*/
select * from Sales;

/*Total Sales*/
SELECT SUM(Amount) AS TotalSales
FROM Sales;

/*Total Profit*/
SELECT SUM(Profit) AS TotalProfit
FROM Sales;

/*Total Orders*/
SELECT COUNT(DISTINCT Order_ID) AS TotalOrders
FROM Sales;

/*Total Quantity*/
SELECT SUM(Quantity) AS TotalQuantity
FROM Sales;

/*Sales by category*/
SELECT
Category,
SUM(Amount) AS Sales
FROM Sales
GROUP BY Category
ORDER BY Sales DESC;

/*Profit by category*/
SELECT
Category,
SUM(Profit) AS Profit
FROM Sales
GROUP BY Category
ORDER BY Profit DESC;

/*Sales by subcategory*/
SELECT
Sub_Category,
SUM(Amount) AS Sales
FROM Sales
GROUP BY Sub_Category
ORDER BY Sales DESC;

/*Profit by subcategory*/
SELECT
Sub_Category,
SUM(Profit) AS Profit
FROM Sales
GROUP BY Sub_Category
ORDER BY Profit DESC;

/*Top 10 customer by sales*/
SELECT TOP 10
CustomerName,
SUM(Amount) AS Sales
FROM Sales
GROUP BY CustomerName
ORDER BY Sales DESC;

/*state wise sales*/
SELECT
State,
SUM(Amount) AS Sales
FROM Sales
GROUP BY State
ORDER BY Sales DESC;

/*State wise profit*/
SELECT
State,
SUM(Profit) AS Profit
FROM Sales
GROUP BY State
ORDER BY Profit DESC;

/*city wise sales*/
SELECT
City,
SUM(Amount) AS Sales
FROM Sales
GROUP BY City
ORDER BY Sales DESC;

/*Payment mode analysis*/
SELECT
PaymentMode,
COUNT(*) AS Orders
FROM Sales
GROUP BY PaymentMode
ORDER BY Orders DESC;

/*Monthly sales trend*/
SELECT
FORMAT(Order_Date, 'yyyy-MM') AS YearMonth,
SUM(Amount) AS Sales
FROM Sales
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY YearMonth;

/*Profit Margin*/
SELECT
ROUND(
    SUM(Profit) * 100.0 / SUM(Amount),
    2
) AS ProfitMargin
FROM Sales;
