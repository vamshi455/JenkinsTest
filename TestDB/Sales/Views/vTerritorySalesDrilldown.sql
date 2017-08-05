CREATE VIEW Sales.vTerritorySalesDrilldown
AS
SELECT ROW_NUMBER() OVER(ORDER BY SP.BusinessEntityID DESC) AS ID, ST.Name as [TerritoryName], SP.BusinessEntityID AS [SalesPersonID], C.FirstName as [EmployeeFirstName], C.LastName as [EmployeeLastName], SOH.SalesOrderNumber, SOH.TotalDue as [Total]
FROM     Sales.SalesTerritory AS ST INNER JOIN
                  Sales.SalesPerson AS SP ON ST.TerritoryID = SP.TerritoryID INNER JOIN
                  HumanResources.Employee AS E ON SP.BusinessEntityID = E.BusinessEntityID INNER JOIN
                  Person.Person AS C ON E.BusinessEntityID = C.BusinessEntityID INNER JOIN
                  Sales.SalesOrderHeader AS SOH ON SP.BusinessEntityID = SOH.SalesPersonID
GROUP BY ST.Name, SP.BusinessEntityID, C.FirstName, C.LastName, SOH.SalesOrderNumber, SOH.TotalDue;
