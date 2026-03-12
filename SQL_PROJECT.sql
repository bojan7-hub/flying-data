CREATE DATABASE SQLPROJECT_BOJANB
GO 

USE SQLPROJECT_BOJANB
GO

CREATE TABLE DBO.SeniorityLevel
(
	ID int IDENTITY (1,1), 
	[Name] nvarchar(100)
	CONSTRAINT PK_SeniorityL PRIMARY KEY (ID)
)
GO 

CREATE TABLE DBO.Location 
(
	ID INT IDENTITY (1,1),
	CountryName nvarchar(100),
	Continent nvarchar(100),
	Region nvarchar (100),
	CONSTRAINT PK_Location PRIMARY KEY (ID)
)
GO 

CREATE TABLE DBO.Department 
(
	ID INT IDENTITY (1,1),
	[Name] nvarchar(100)
	CONSTRAINT PK_Department PRIMARY KEY (ID)
)
GO 

CREATE TABLE dbo.Employee 
(
	ID INT IDENTITY (1,1), 
	FirstName nvarchar(100),
	LastName nvarchar(100),
	LocationID int,
	SeniorityLevelID int,
	DepartmentID int
	CONSTRAINT PK_Employee PRIMARY KEY (ID)
)

GO


CREATE TABLE dbo.Salary
(
	ID BIGINT IDENTITY (1,1),
	EmployeeID INT,
	[Month] smallint,
	[Year] smallint,
	GrossAmount decimal(18,2),
	NetAmount decimal(18,2),
	RegularWorkAmount decimal(18,2),
	BonusAmount decimal(18,2),
	OvertimeAmount decimal(18,2),
	VacationDays smallint,
	SickLeaveDays smallint
	CONSTRAINT PK_Salary PRIMARY KEY (ID)
)
GO



INSERT INTO SeniorityLevel (Name)
VALUES ('Junior'), ('Intermediate'), ('Senior'), ('Lead'), ('Project Manager'), ('Division Manager'), ('Office Manager'),
	('CEO'), ('CTO'), ('CIO')
GO


INSERT INTO DBO.[Location] (CountryName, Continent, Region)
SELECT AP.COUNTRYNAME, AP.CONTINENT, AP.REGION FROM WideWorldImporters.[Application].Countries AS AP
GO


INSERT INTO Department (Name)
VALUES  ('Personal Banking & Operations '), ('Digital Banking Department'), 
		('Retail Banking & Marketing Department'), ('Wealth Management & Third Party Products'), 
		('International Banking Division & DFB'), ('Treasury'), ('Information Technology'),
		('Corporate Communications'), ('Support Services & Branch Expansion'), ('Human Resources')
GO


INSERT INTO 
	Employee (FirstName, LastName, SeniorityLevelID, DepartmentID, LocationID) 
SELECT	
	LEFT(FULLNAME, CHARINDEX(' ', FULLNAME)) AS FirstName,
	RIGHT(FULLNAME, LEN(FULLNAME) - CHARINDEX(' ', FullName)) AS LastName,
	NTILE(10) OVER (ORDER BY PERSONID),
	NTILE(10) OVER (ORDER BY PERSONID),
	NTILE(190) OVER (ORDER BY PERSONID)
FROM 
	WideWorldImporters.Application.People 
WHERE 
	PERSONID > 1
GO
 

CREATE TABLE #DATA 
( 
	ID INT IDENTITY (1,1),
	[MONTH] NVARCHAR(30), 
)
GO

CREATE TABLE #DATA2
( 
	ID INT IDENTITY (1,1),
	[YEAR] NVARCHAR(30)
)
GO



INSERT INTO #DATA (MONTH)
VALUES	
		('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),
		('9'), ('10'), ('11'), ('12')
GO


INSERT INTO #DATA2 (YEAR)
VALUES	
		('2001'),('2002'),('2003'),('2004'),('2005'),('2006'),('2007'),('2008'),
		('2009'), ('2010'), ('2011'), ('2012'), ('2013'), ('2014'), ('2015'), ('2016'), ('2017'),
		('2018'), ('2019'), ('2020')
GO



INSERT INTO 
	Salary (EmployeeID, Month, Year)
SELECT 
	E.ID, D.MONTH, D2.YEAR
FROM 
	Employee AS E 
	CROSS JOIN #DATA AS D
	CROSS JOIN #DATA2 AS D2
GO	

UPDATE
	Salary 
SET
	GROSSAMOUNT = (40000) + ABS(CHECKSUM(NEWID())) % 20000
WHERE 
	EmployeeID > 0
GO


UPDATE 
	Salary
SET
	NetAmount = COALESCE(GROSSAMOUNT * .90, 0)
WHERE 
	EmployeeID > 0
GO	

UPDATE 
	Salary
SET
	RegularWorkAmount = COALESCE(NETAMOUNT * .80, 0)
WHERE 
	EmployeeID > 0
GO

UPDATE 
	Salary
SET
	BonusAmount = COALESCE(NETAMOUNT * .80, 0)
WHERE 
	MONTH IN (1,3,5,7,9,11)
GO


UPDATE 
	Salary
SET
	BONUSAMOUNT = COALESCE(NETAMOUNT - REGULARWORKAMOUNT, 0)
WHERE
	MONTH IN (1,3,5,7,9,11)
GO



UPDATE 
	Salary
SET
	OvertimeAmount = COALESCE(NETAMOUNT - REGULARWORKAMOUNT, 0)
WHERE
	MONTH IN (2,4,6,8,10,12)
GO


UPDATE 
	Salary
SET
	VacationDays = 10
WHERE
	MONTH IN (7, 12)
GO


UPDATE 
	Salary
SET
	VacationDays = VacationDays + (EmployeeID % 2)
WHERE
	(EmployeeID + Month + Year) %5 = 1
GO

UPDATE 
	Salary
SET
	SickLeaveDays = EmployeeID % 8, VacationDays = VacationDays + (EmployeeID % 3)
WHERE
	(EmployeeID + Month + Year) %5 = 2
GO






SELECT 
	*
FROM 
	Salary
WHERE 
	NetAmount <> (RegularWorkAmount + BonusAmount + OvertimeAmount)
GO


SELECT 
	DISTINCT VacationDays
FROM 
	Salary
WHERE
	VacationDays IS NOT NULL



coalesce()
sum(ds.amount) * .90


count(*) * 100.0 / sum(count(*)) over()
count(*) * 100.0 / (select count(*) from MyTable)

SELECT 
	ds.amount, sum(ds.amount) * .90
FROM
	BrainsterDB.DBO.AccountDetails AS DS
GROUP BY
	Amount



DECLARE @RN INT
SELECT 
	MEMBERS = (15000) + ABS(CHECKSUM(NEWID())) % 5000





























































)





































