
CREATE VIEW [Production].[vProductCatalog]
AS
SELECT ROW_NUMBER() OVER (ORDER BY [ProductID] DESC) AS ID, P.ProductID, P.ProductNumber, P.Name AS ProductName, PM.Name AS ProductModel, 
PC.Name AS ProductCategory, PS.Name AS ProductSubcategory, PD.Description, PMPDCL.CultureID, P.Color, P.Size, P.Weight, P.ListPrice
FROM     Production. Product AS P INNER JOIN
                  Production.ProductSubcategory AS PS INNER JOIN
                  Production.ProductCategory AS PC ON PS.ProductCategoryID = PC.ProductCategoryID ON P.ProductSubcategoryID = PS.ProductSubcategoryID INNER JOIN
                  Production.ProductDescription AS PD INNER JOIN
                  Production.ProductModel AS PM INNER JOIN
                  Production.ProductModelProductDescriptionCulture AS PMPDCL ON PM.ProductModelID = PMPDCL.ProductModelID ON 
                  PD.ProductDescriptionID = PMPDCL.ProductDescriptionID ON P.ProductModelID = PM.ProductModelID;
