USE AdventureWorks2008R2

SELECT ppe.BusinessEntityID IDempleado, ppe.FirstName Nombre,ppe.LastName
Apellido,HRE.MaritalStatus EstadoCivil, HRE.BirthDate FechaNacimiento,hre.CurrentFlag
Estado
FROM HumanResources.Employee AS hre
INNER JOIN Person.Person AS ppe ON hre.BusinessEntityID = ppe.BusinessEntityID
WHERE ppe.BusinessEntityID IN (1,2,3)
FOR JSON PATH, INCLUDE_NULL_VALUES

USE AdventureWorks2008R2
SELECT
 HRD.DepartmentID ID_Departamento,
 HRD.Name Nombre_Departamento,
 HRD.GroupName Grupo,
PPE.BusinessEntityID AS ID_Empleado,
 PPE.FirstName NombreEmpleado,
 PPE.LastName ApellidoEmpleado,
 HRE.JobTitle CargoEmpleado,
 HRE.HireDate FechaIngreso
 FROM
 HumanResources.Employee HRE
INNER JOIN HumanResources.EmployeeDepartmentHistory EDH
ON HRE.BusinessEntityID=EDH.BusinessEntityID
INNER JOIN HumanResources.Department HRD
ON EDH.DepartmentID=HRD.DepartmentID
INNER JOIN Person.Person PPE
ON HRE.BusinessEntityID = PPE.BusinessEntityID
ORDER BY ID_Departamento
FOR JSON PATH,INCLUDE_NULL_VALUES

SELECT
HRD.DepartmentID ID_Departamento,
HRD.Name Nombre_Departamento,
HRD.GroupName Grupo,
(
SELECT PPE.BusinessEntityID AS ID_Empleado,
PPE.FirstName NombreEmpleado,
PPE.LastName ApellidoEmpleado,
HRE.JobTitle CargoEmpleado,
HRE.HireDate FechaIngreso
FROM HumanResources.Employee HRE
INNER JOIN HumanResources.EmployeeDepartmentHistory HRH
ON HRE.BusinessEntityID = HRH.BusinessEntityID
INNER JOIN Person.Person PPE
ON HRE.BusinessEntityID=PPE.BusinessEntityID
WHERE HRH.DepartmentID = HRD.DepartmentID
FOR JSON PATH,INCLUDE_NULL_VALUES
) AS Empleados
FROM
HumanResources.Department HRD
FOR JSON PATH,INCLUDE_NULL_VALUES;


USE AdventureWorks2008R2
SELECT
pve.AccountNumber
,pve.Name
,poh.PurchaseOrderID
,poh.ShipMethodID
FROM
Purchasing.PurchaseOrderHeader AS poh
INNER JOIN Purchasing.Vendor AS pve
ON pve.BusinessEntityID = poh.VendorID
WHERE
pve.ActiveFlag = 0 AND poh.OrderDate <= '2012-31-12'
FOR JSON PATH, INCLUDE_NULL_VALUES


USE MASTER
DECLARE @JSON_F_SQL NVARCHAR(MAX);
-- Leer el contenido del archivo JSON y asignarlo a la variable
SET @JSON_F_SQL = (SELECT BulkColumn
 FROM OPENROWSET(BULK 'D:\\BDD2\\5612\\BaseDeDatosPython\\JsonOutput\\Querys\\Proveedor.json',
SINGLE_CLOB) AS jsonFile);
-- Procesar el JSON almacenado en la variable
SELECT
 NumeroCuenta,
 NombreProveedor,
 NumeroOrden,
 MetodoPago
INTO #tempCuentasProveedor
FROM OPENJSON(@JSON_F_SQL) WITH (
NumeroCuenta NVARCHAR(50) 'strict $.AccountNumber',
 NombreProveedor NVARCHAR(50) '$.Name',
 NumeroOrden NVARCHAR(50) '$.PurchaseOrderID',
 MetodoPago NVARCHAR(50) '$.ShipMethodID'
);

SELECT * FROM #tempCuentasProveedor