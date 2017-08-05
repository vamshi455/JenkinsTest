
CREATE VIEW VW_HrSample
AS

SELECT        Employee_1.BusinessEntityID, Employee_1.OrganizationNode, Employee_1.OrganizationLevel, Employee_1.JobTitle, Employee_1.BirthDate, Employee_1.MaritalStatus, Employee_1.Gender, 
                         Employee_1.HireDate, Employee_1.VacationHours, Employee_1.SickLeaveHours, HumanResources.EmployeePayHistory.Rate, HumanResources.EmployeePayHistory.PayFrequency, 
                         HumanResources.EmployeePayHistory.RateChangeDate, HumanResources.EmployeeDepartmentHistory.EndDate, HumanResources.EmployeeDepartmentHistory.StartDate, HumanResources.Shift.Name, 
                         HumanResources.EmployeeDepartmentHistory.DepartmentID, HumanResources.Department.Name AS Expr1, HumanResources.Department.GroupName
FROM            HumanResources.EmployeeDepartmentHistory INNER JOIN
                         HumanResources.Shift ON HumanResources.EmployeeDepartmentHistory.ShiftID = HumanResources.Shift.ShiftID INNER JOIN
                         HumanResources.Employee AS Employee_1 ON HumanResources.EmployeeDepartmentHistory.BusinessEntityID = Employee_1.BusinessEntityID INNER JOIN
                         HumanResources.EmployeePayHistory ON Employee_1.BusinessEntityID = HumanResources.EmployeePayHistory.BusinessEntityID INNER JOIN
                         HumanResources.Department ON HumanResources.EmployeeDepartmentHistory.DepartmentID = HumanResources.Department.DepartmentID