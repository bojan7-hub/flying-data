CREATE DATABASE SQLPROJECT_BOJANB
GO 

USE SQLPROJECT_BOJANB
GO


--Creates a table 'SeniorityLevel' to store different seniority levels.
-- Each level has a unique ID (auto-increment) and a Name. ID is the primary key.

CREATE TABLE DBO.SeniorityLevel
(
	ID int IDENTITY (1,1), 
	[Name] nvarchar(100)
	CONSTRAINT PK_SeniorityL PRIMARY KEY (ID)
)
GO 


-- Creates a table 'Location' to store geographic information.
-- Each location has a unique ID, CountryName, Continent, and Region. ID is the primary key.

CREATE TABLE DBO.Location 
(
	ID INT IDENTITY (1,1),
	CountryName nvarchar(100),
	Continent nvarchar(100),
	Region nvarchar (100),
	CONSTRAINT PK_Location PRIMARY KEY (ID)
)
GO


-- Creates a table 'Department' to store all departments.
-- Each department has a unique auto-increment ID as the primary key and a Name.

CREATE TABLE DBO.Department 
(
	ID INT IDENTITY (1,1),
	[Name] nvarchar(100)
	CONSTRAINT PK_Department PRIMARY KEY (ID)
)
GO 


-- Creates a table 'Employee' to store employee information.
-- Each employee has a unique ID, first and last name, and links to Location, SeniorityLevel, and Department.

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

-- Creates a table 'Salary' to store detailed salary and leave information for employees.
-- Includes GrossAmount, NetAmount, RegularWorkAmount, BonusAmount, OvertimeAmount, VacationDays, and SickLeaveDays.
-- Each record has a unique ID as the primary key and links to an EmployeeID, Month, and Year.

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


-- Inserts common seniority levels into the SeniorityLevel table.

INSERT INTO SeniorityLevel (Name)
VALUES ('Junior'), ('Intermediate'), ('Senior'), ('Lead'), ('Project Manager'), ('Division Manager'), ('Office Manager'),
	('CEO'), ('CTO'), ('CIO')
GO

-- Copies country, continent, and region data from WideWorldImporters.Countries into the Location table.

INSERT INTO DBO.[Location] (CountryName, Continent, Region)
SELECT AP.COUNTRYNAME, AP.CONTINENT, AP.REGION FROM WideWorldImporters.[Application].Countries AS AP
GO

-- Inserts department names into the Department table.

INSERT INTO Department (Name)
VALUES  ('Personal Banking & Operations '), ('Digital Banking Department'), 
		('Retail Banking & Marketing Department'), ('Wealth Management & Third Party Products'), 
		('International Banking Division & DFB'), ('Treasury'), ('Information Technology'),
		('Corporate Communications'), ('Support Services & Branch Expansion'), ('Human Resources')
GO

-- Inserts employee data into the Employee table.
-- Splits FULLNAME into FirstName and LastName, and assigns SeniorityLevelID, DepartmentID, and LocationID
-- by dividing the people into groups using NTILE.

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
 
-- Creates a temporary table #DATA to store month names.
-- ID is an auto-incrementing identifier, and MONTH stores the month as text.

CREATE TABLE #DATA 
( 
	ID INT IDENTITY (1,1),
	[MONTH] NVARCHAR(30), 
)
GO

-- Creates a temporary table #DATA2 to store years.
-- ID is an auto-incrementing identifier, and YEAR stores the year as text.

CREATE TABLE #DATA2
( 
	ID INT IDENTITY (1,1),
	[YEAR] NVARCHAR(30)
)
GO


-- Inserts month numbers 1 to 12 into the temporary table #DATA.

INSERT INTO #DATA (MONTH)
VALUES	
		('1'),('2'),('3'),('4'),('5'),('6'),('7'),('8'),
		('9'), ('10'), ('11'), ('12')
GO

-- Inserts years 2001 to 2020 into the temporary table #DATA2.

INSERT INTO #DATA2 (YEAR)
VALUES	
		('2001'),('2002'),('2003'),('2004'),('2005'),('2006'),('2007'),('2008'),
		('2009'), ('2010'), ('2011'), ('2012'), ('2013'), ('2014'), ('2015'), ('2016'), ('2017'),
		('2018'), ('2019'), ('2020')
GO


-- Fills the Salary table by creating a row for every combination of Employee, Month, and Year.
-- Uses CROSS JOIN to pair each employee with all months and all years.
INSERT INTO 
	Salary (EmployeeID, Month, Year)
SELECT 
	E.ID, D.MONTH, D2.YEAR
FROM 
	Employee AS E 
	CROSS JOIN #DATA AS D
	CROSS JOIN #DATA2 AS D2
GO	

--Assigns a GROSSAMOUNT between 40,000 and 59,999 to all employees.
UPDATE
	Salary 
SET
	GROSSAMOUNT = (40000) + ABS(CHECKSUM(NEWID())) % 20000
WHERE 
	EmployeeID > 0
GO

-- Updates NetAmount to 90% of GROSSAMOUNT for all employees.
-- If GROSSAMOUNT is NULL, NetAmount is set to 0.
UPDATE 
	Salary
SET
	NetAmount = COALESCE(GROSSAMOUNT * .90, 0)
WHERE 
	EmployeeID > 0
GO	

-- Sets RegularWorkAmount to 80% of NetAmount for all employees.
-- If NetAmount is NULL, it sets RegularWorkAmount to 0.
UPDATE 
	Salary
SET
	RegularWorkAmount = COALESCE(NETAMOUNT * .80, 0)
WHERE 
	EmployeeID > 0
GO

-- Sets the BonusAmount to 80% of NetAmount for months 1, 3, 5, 7, 9, and 11.
-- If NetAmount is NULL, the bonus is set to 0.
UPDATE 
	Salary
SET
	BonusAmount = COALESCE(NETAMOUNT * .80, 0)
WHERE 
	MONTH IN (1,3,5,7,9,11)
GO

-- Calculates the bonus amount as the difference between Net Amount and Regular Work Amount. for employees in months 1, 3, 5, 7, 9, and 11 if the result is NULL the value goes to 0
	Salary
SET
	BONUSAMOUNT = COALESCE(NETAMOUNT - REGULARWORKAMOUNT, 0)
WHERE
	MONTH IN (1,3,5,7,9,11)
GO

-- Sets OvertimeAmount to the difference between NetAmount and RegularWorkAmount for months 2, 4, 6, 8, 10, and 12.
-- If the result is NULL, OvertimeAmount is set to 0.

UPDATE 
	Salary
SET
	OvertimeAmount = COALESCE(NETAMOUNT - REGULARWORKAMOUNT, 0)
WHERE
	MONTH IN (2,4,6,8,10,12)
GO

-- Sets VacationDays to 10 for all employees for the months of July (7) and December (12).

UPDATE 
	Salary
SET
	VacationDays = 10
WHERE
	MONTH IN (7, 12)
GO

-- Increases VacationDays by 1 for employees with odd EmployeeID when (EmployeeID + Month + Year) modulo 5 equals 1.
-- Otherwise, VacationDays remains unchanged.

UPDATE 
	Salary
SET
	VacationDays = VacationDays + (EmployeeID % 2)
WHERE
	(EmployeeID + Month + Year) %5 = 1
GO

-- Sets SickLeaveDays to EmployeeID modulo 8 and adds EmployeeID modulo 3 to VacationDays
-- for employees where (EmployeeID + Month + Year) modulo 5 equals 2.

UPDATE 
	Salary
SET
	SickLeaveDays = EmployeeID % 8, VacationDays = VacationDays + (EmployeeID % 3)
WHERE
	(EmployeeID + Month + Year) %5 = 2
GO

-- Selects all rows from Salary where NetAmount does not equal the sum of RegularWorkAmount, BonusAmount, and OvertimeAmount.
-- This helps identify any discrepancies or calculation errors in the salary data.

SELECT 
	*
FROM 
	Salary
WHERE 
	NetAmount <> (RegularWorkAmount + BonusAmount + OvertimeAmount)
GO






























)





































