CREATE VIEW [Production].[vProductCatalogImages]
AS 
SELECT Production.ProductProductPhoto.ProductID, Production.ProductPhoto.ProductPhotoID, Production.ProductPhoto.ThumbNailPhoto, 
                  Production.ProductPhoto.ThumbnailPhotoFileName, Production.ProductPhoto.LargePhoto, Production.ProductPhoto.LargePhotoFileName
FROM     Production.ProductPhoto INNER JOIN
                  Production.ProductProductPhoto ON Production.ProductPhoto.ProductPhotoID = Production.ProductProductPhoto.ProductPhotoID;
