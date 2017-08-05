CREATE VIEW [Sales].[vCompanySales]
AS
SELECT ROW_NUMBER() OVER(ORDER BY PC.Name DESC) AS ID, PC.Name AS ProductCategory, PS.Name AS ProductSubCategory, DATEPART(yy, SOH.OrderDate) AS OrderYear, 'Q' + DATENAME(qq, SOH.OrderDate) AS OrderQtr, 
                  SUM(SOD.UnitPrice * SOD.OrderQty) AS Sales
FROM     Production.ProductSubcategory AS PS INNER JOIN
                  Sales.SalesOrderHeader AS SOH INNER JOIN
                  Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID INNER JOIN
                  Production.Product AS P ON SOD.ProductID = P.ProductID ON PS.ProductSubcategoryID = P.ProductSubcategoryID INNER JOIN
                  Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID
WHERE  (SOH.OrderDate BETWEEN '1/1/2002' AND '12/31/2009')
GROUP BY DATEPART(yy, SOH.OrderDate), PC.Name, PS.Name, 'Q' + DATENAME(qq, SOH.OrderDate), PS.ProductSubcategoryID;
