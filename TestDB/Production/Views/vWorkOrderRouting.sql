CREATE VIEW [Production].[vWorkOrderRouting]
AS
SELECT ROW_NUMBER() OVER(ORDER BY Production.WorkOrderRouting.ProductID DESC) AS ID, Production.WorkOrderRouting.WorkOrderID AS [WorkOrderID], Production.WorkOrderRouting.ProductID AS [ProductID], Production.Product.ProductNumber, Production.Product.Name AS [ProductName],  
                  Production.WorkOrderRouting.OperationSequence AS [OperationSequence], Production.Location.LocationID, Production.Location.Name,
                  Production.WorkOrderRouting.ScheduledStartDate, Production.WorkOrderRouting.ActualStartDate, Production.WorkOrderRouting.ScheduledEndDate, 
                  Production.WorkOrderRouting.ActualEndDate, Production.WorkOrderRouting.ActualResourceHrs, Production.WorkOrderRouting.PlannedCost, 
                  Production.WorkOrderRouting.ActualCost, Production.WorkOrder.OrderQty, Production.WorkOrder.ScrappedQty, Production.WorkOrder.DueDate, 
                  Production.WorkOrder.ScrapReasonID, Production.ScrapReason.Name AS [ScrapReason]
FROM     Production.WorkOrderRouting INNER JOIN
                  Production.Location ON Production.WorkOrderRouting.LocationID = Production.Location.LocationID INNER JOIN
                  Production.Product ON Production.WorkOrderRouting.ProductID = Production.Product.ProductID INNER JOIN
                  Production.WorkOrder ON Production.WorkOrderRouting.WorkOrderID = Production.WorkOrder.WorkOrderID LEFT OUTER JOIN
                  Production.ScrapReason ON Production.WorkOrder.ScrapReasonID = Production.ScrapReason.ScrapReasonID;
