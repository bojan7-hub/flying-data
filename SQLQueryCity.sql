create table dbo.City 
(
ID INT NOT NULL IDENTITY (1,1),
[Name] nvarchar(100) NOT NULL,
Region nvarchar(50) not null, 
[Population] int null,
EastWest char(1) not null,
constraint PK_City PRIMARY KEY CLUSTERED (ID ASC)
)

select * from dbo.Customer 
select * from dbo.Location
select * from dbo.Employee

alter table dbo.Customer 
add CityID int 

alter table dbo.Location 
add CityID int 


alter table dbo.Employee 
add CityID int 

alter table dbo.Customer 
add constraint FK_Customer_City 
foreign key (CityID) references dbo.City(ID) 

alter table dbo.Location
add constraint FK_Location_City 
foreign key (CityID) references dbo.City(ID) 



alter table dbo.Employee 
add constraint FK_Employee_City 
foreign key (CityID) references dbo.City(ID) 

select * from dbo.Customer

insert into dbo.City ([Name], Region, EastWest)
select distinct City as [Name], ' ' as Region, ' ' as EastWest from dbo.Customer

Select * from dbo.City

update dbo.City
set Region = 'Pelagoniski ', EastWest = 'W', [Population] = 95000
where Name = 'Bitola'


update dbo.City
set Region = 'Severoistocen ', EastWest = 'E', [Population] = 105000
where Name = 'Kumanovo'


update dbo.City
set Region = 'Jugozapaden ', EastWest = 'W', [Population] = 55000
where Name = 'Ohrid'

update dbo.City
set Region = 'Pelagoniski ', EastWest = 'W', [Population] = 75000
where Name = 'Prilep'


update dbo.City
set Region = 'Pelagoniski ', EastWest = 'W', [Population] = 15000
where Name = 'Resen'


update dbo.City
set Region = 'Skopski ', EastWest = 'E', [Population] = 610000
where Name = 'Skopje'


update dbo.City
set Region = 'Poloski ', EastWest = 'W', [Population] = 70000
where Name = 'Gostivar'

Select * from dbo.City

select * from dbo.Customer
select * from dbo.City

--select c.*, ci.ID as cityid 

update c 
set CityID = ci.ID

from dbo.Customer as c inner join dbo.City as ci 
on c.City = ci.Name 

alter table dbo.customer
drop column City

select * from dbo.Location where LocationTypeId = 1


select * from dbo.Location where LocationTypeId = 4

select left('Marjan', 3)

select right('Marjan', 3)

select substring('Marjan', 1, 3)

select CHARINDEX('a', 'Marjan') , 3)

select replace('Marjan', 'rj', '')

select len('Marjan')

select * from dbo.Location

select *, replace(Name, ' branch office', '') as CityName,
left([Name], charindex(' ', [Name]) - 1) as City2
from dbo.Location
where LocationTypeId = 1

select * from dbo.Location where LocationTypeId = 4

select *, replace(Name, 'atm ', '') as CityName,
left(replace(Name, 'atm ', ''), charindex(' ', replace(Name, 'atm ', '')) - 1) as City2
from dbo.Location
where LocationTypeId = 4

select
*
--, replace([Name], ' branch office', '') as City1
, left([Name], charindex(' ', [Name]) - 1) as City
from dbo.Location where LocationTypeID in (1,2)

select
*
, left(replace([Name], 'ATM ', ''), charindex(' ', replace([Name], 'ATM ', '')) - 1) as City
from dbo.Location where LocationTypeID = 4


insert into dbo.City ([Name], Region, EastWest)
select distinct
left([Name], charindex(' ', [Name]) - 1) as [Name], '' as Region, '' as EastWes
from
dbo.Location
where
LocationTypeID in (1,2)
and left([Name], charindex(' ', [Name]) - 1) not in (select Name from dbo.City)


insert into dbo.City ([Name], Region, EastWest)
select distinct
left(replace([Name], 'ATM ', ''), charindex(' ', replace([Name], 'ATM ', '')) - 1) as [Name], '' as Region, '' as EastWes
from
dbo.Location
where
LocationTypeID = 4
and left(replace([Name], 'ATM ', ''), charindex(' ', replace([Name], 'ATM ', '')) - 1) not in (select Name from dbo.City)

select * from dbo.City

select * from Location

update
l
set
l.CityID = ci.ID
from
dbo.[Location] as l
inner join dbo.City as ci on left(l.[Name], charindex(' ', l.[Name]) - 1) = ci.[Name]
where
l.LocationTypeID in (1,2)

update
l
set
l.CityID = ci.ID
from
dbo.[Location] as l
inner join dbo.City as ci on left(replace(l.[Name], 'ATM ', ''), charindex(' ', replace(l.[Name], 'ATM ', '')) - 1) = ci.[Name]
where
l.LocationTypeID = 4

update
dbo.Location
set
CityID = 6
where
CityID is NULL


select * from dbo.Location

select * from dbo.Employee

update
dbo.Employee
set
CityID = 1
where
ID between 1 and 7

update
dbo.Employee
set
CityID = 2
where
ID between 8 and 14

update
dbo.Employee
set
CityID = 3
where
ID between 15 and 21

update
dbo.Employee
set
CityID = 4
where
ID between 22 and 28

update
dbo.Employee
set
CityID = 5
where
ID between 29 and 35

update
dbo.Employee
set
CityID = 6
where
ID between 36 and 42

update
dbo.Employee
set
CityID = 7
where
ID between 43 and 49

update
dbo.Employee
set
CityID = 8
where
ID between 50 and 56

update
dbo.Employee
set
CityID = 9
where
ID between 57 and 63

update
dbo.Employee
set
CityID = 10
where
ID between 64 and 70

update
dbo.Employee
set
CityID = 11
where
ID between 71 and 77

update
dbo.Employee
set
CityID = 12
where
ID between 78 and 84

update
dbo.Employee
set
CityID = 13
where
ID between 85 and 92

update
dbo.Employee
set
CityID = 14
where
ID between 93 and 100

select * from dbo.Employee
select * from dbo.City
----------------------------------



select
*
, replace([Name], ' branch office', '') as City1
, left([Name], charindex(' ', [Name]) - 1) as City2
from dbo.Location where LocationTypeID = 1

select
*
, left(replace([Name], 'ATM ', ''), charindex(' ', replace([Name], 'ATM ', '')) - 1) as City
from dbo.Location where LocationTypeID = 4

select * from City



select
*
--, replace([Name], ' branch office', '') as City1
, left([Name], charindex(' ', [Name]) - 1) as City
from dbo.Location where LocationTypeID in (1,2)

select
*
, left(replace([Name], 'ATM ', ''), charindex(' ', replace([Name], 'ATM ', '')) - 1) as City
from dbo.Location where LocationTypeID = 4


insert into dbo.City ([Name], Region, EastWest)
select distinct
left([Name], charindex(' ', [Name]) - 1) as [Name], '' as Region, '' as EastWes
from
dbo.Location
where
LocationTypeID in (1,2)
and left([Name], charindex(' ', [Name]) - 1) not in (select Name from dbo.City)


insert into dbo.City ([Name], Region, EastWest)
select distinct
left(replace([Name], 'ATM ', ''), charindex(' ', replace([Name], 'ATM ', '')) - 1) as [Name], '' as Region, '' as EastWes
from
dbo.Location
where
LocationTypeID = 4
and left(replace([Name], 'ATM ', ''), charindex(' ', replace([Name], 'ATM ', '')) - 1) not in (select Name from dbo.City)

select * from dbo.City

select * from Location

update
l
set
l.CityID = ci.ID
from
dbo.[Location] as l
inner join dbo.City as ci on left(l.[Name], charindex(' ', l.[Name]) - 1) = ci.[Name]
where
l.LocationTypeID in (1,2)

update
l
set
l.CityID = ci.ID
from
dbo.[Location] as l
inner join dbo.City as ci on left(replace(l.[Name], 'ATM ', ''), charindex(' ', replace(l.[Name], 'ATM ', '')) - 1) = ci.[Name]
where
l.LocationTypeID = 4

update
dbo.Location
set
CityID = 6
where
CityID is NULL


select * from dbo.Location

UPDATE
a
SET
a.CurrentBalance = (select sum(Amount) from dbo.AccountDetails as ad where ad.AccountId = a.ID)
FROM
dbo.Account as a

select * from Account

select ad.accountID, SUM(ad.Amount) as CurrentBalance
from dbo.AccountDetails as ad
group by ad.AccountId
order by ad.AccountId

SELECT
ad.AccountId,MONTH(ad.TransactionDate) as MonthOfTransaction,
 YEAR(ad.TransactionDate) as YearOfTransaction
, SUM(ad.Amount) as CurrentBalance
, COUNT(*) as CountTransactions
 ,MIN(ABS(ad.Amount)) AS MinTransaction
 ,MAX(ABS(ad.Amount)) AS MaxTransaction
, STRING_AGG(ad.PurposeDescription, ', ') as AggregatePurposeDesc
FROM dbo.AccountDetails as ad
GROUP BY ad.AccountId, MONTH(ad.TransactionDate), YEAR(ad.TransactionDate)
ORDER BY ad.AccountId

select ad.accountid, month(ad.transactiondate) as Monthoftransaction, year(ad.transactiondate) as YearofTransaction,
sum(ad.Amount) as CurrentBalance, Count(*) as CountTransaction
from AccountDetails as AD 
group by ad.AccountId, MONTH(ad.transactiondate), year(transactiondate)
order by ad.AccountId;

select ad.accountid, month(ad.transactiondate) as MonthofTransaction, Year(ad.transactiondate) as YearofTransaction, 
sum(ad.amount) as CurrentBalance, Count(*) as CountTransaction
from dbo.accountdetails as AD
group by ad.accountID, month(ad.transactiondate), year(ad.transactiondate)
order by ad.accountID;

select * from dbo.AccountDetails




SELECT*FROM DBO.Account

SELECT AD.ACCOUNTID, MONTH(AD.TRANSACTIONDATE) AS MONTHOFTRANSACTION,
YEAR(AD.TRANSACTIONDATE) AS YEAROFTRANSACTION,
SUM(AD.AMOUNT) AS CURRENTBALANCE,
MIN(ABS(AD.AMOUNT)) AS MINTRANSACTION,
MAX(ABS(AD.AMOUNT)) AS MAXTRANSACTION,
STRING_AGG(AD.PURPOSEDESCRIPTION, ', ') AS AGGPURPOSECODE
FROM DBO.AccountDetails AS AD 
GROUP BY AD.AccountId, MONTH(AD.TRANSACTIONDATE), YEAR(AD.TRANSACTIONDATE)
ORDER BY AD.AccountId


SELECT AD.ACCOUNTID, SUM(Amount) AS CURRENTBALANCE
FROM DBO.AccountDetails AS AD 
GROUP BY AD.AccountId
ORDER BY AD.AccountId

SELECT AD.ACCOUNTID, Amount AS CURRENTBALANCE
FROM DBO.AccountDetails AS AD 
GROUP BY AD.AccountId, Amount
ORDER BY AD.AccountId

SELECT AD.ACCOUNTID, SUM(AMOUNT) AS BALANCE, COUNT(*) AS BALANCE2 FROM AccountDetails AS AD 
WHERE AD.Amount < 0
GROUP BY AccountId
HAVING COUNT(*) > 7
ORDER BY BALANCE

SELECT MIN(ABS(AD.AMOUNT)) AS BALANCE FROM AccountDetails AS AD
GROUP BY Amount
ORDER BY AD.Amount ASC


SELECT * FROM AccountDetails
SELECT * FROM Location
SELECT * FROM City

SELECT MIN(ABS(AD.AMOUNT)) AS AMOUNT, L.Name
FROM AccountDetails AS AD
INNER JOIN DBO.Location AS L
ON L.Id = AD.LocationId
GROUP BY AD.LocationId, L.Name
ORDER BY AMOUNT


SELECT L.CITYID AS CITYID, C.NAME AS NAME FROM Location AS L
INNER JOIN City AS C ON C.ID = L.Id
ORDER BY CITYID

select l.Name as LocationName,min(abs(ad.Amount)) as MinTrasaction
from dbo.AccountDetails as ad
inner join dbo.Location as l ON ad.LocationId=l.id
group by l.Name
order by minTrasaction



select c.Name as City,min(abs(ad.Amount)) as MinTrasaction
from dbo.AccountDetails as ad
inner join dbo.Location as l on ad.LocationId=l.id
inner join dbo.City as c ON l.CityID=c.ID
group by c.Name
order by minTrasaction


SELECT * FROM AccountDetails

SELECT AD.ACCOUNTID, MONTH(AD.TRANSACTIONDATE) AS MONTHOFTRANSACTION,
YEAR(AD.TRANSACTIONDATE) AS YEAROFTRANSACTION,
SUM(AD.AMOUNT) AS CURRENTBALANCE,
MIN(ABS(AD.AMOUNT)) AS MINTRANSACTION,
MAX(ABS(AD.AMOUNT)) AS MAXTRANSACTION,
STRING_AGG(AD.PURPOSEDESCRIPTION, ', ') AS AGGPURPOSECODE
FROM DBO.AccountDetails AS AD 
GROUP BY AD.AccountId, MONTH(AD.TRANSACTIONDATE), YEAR(AD.TRANSACTIONDATE)
ORDER BY AD.AccountId


SELECT AD.AccountId, SUM(AD.AMOUNT) AS TOTALBALANCE, MIN(ABS(AD.AMOUNT)) AS MINIMALBALANCE, MAX(ABS(AD.AMOUNT)) AS MAXBALANCE, MONTH(AD.TRANSACTIONDATE)AS [MONTH], YEAR(AD.TransactionDate) AS [YEAR] FROM DBO.AccountDetails AS AD
GROUP BY AD.AccountId, MONTH(AD.TransactionDate), YEAR(AD.TRANSACTIONDATE), AD.Amount
ORDER BY AD.AccountId


SELECT AD.AccountId, SUM(AD.AMOUNT) AS TOTALBALANCE, MIN(ABS(AD.AMOUNT)) AS MINIMALBALANCE, MAX(ABS(AD.AMOUNT)) AS MAXBALANCE, MONTH(AD.TRANSACTIONDATE)AS [MONTH], YEAR(AD.TransactionDate) AS [YEAR] FROM DBO.AccountDetails AS AD
GROUP BY AD.AccountId, MONTH(AD.TransactionDate), YEAR(AD.TRANSACTIONDATE)
ORDER BY AD.AccountId

SELECT * FROM AccountDetails
--------------------------------------
------------------------------------


select ad.AccountId, sum(ad.Amount) as AmountSum
from dbo.AccountDetails as ad
where ad.amount < 0
group by AccountId
order by AccountId


select
*,
SUM(ad.Amount) OVER (PARTITION BY AccountId) AS SumPerAccount
, COUNT(*) OVER (PARTITION BY AccountId) AS CountPerAccount
, min(ad.Amount) OVER (PARTITION BY AccountId) AS MinTransactionPerAccount
, SUM(ad.Amount) OVER (PARTITION BY locationId) AS SumPerLocation
, SUM(ad.Amount) OVER (PARTITION BY accountId,locationId) AS SumPerAccountLocation
, SUM(ad.Amount) OVER () AS GrandTotoal
from dbo.AccountDetails as ad
where ad.amount < 0
order by AccountId

/*Order all transactions from Clearing houses from highest to lowest transaction by using RowNumber function
Show the following data on output:
LocationName
AccountId
Amount
Rn (the ordering column)*/

Select l.Name, ad.AccountId, ad.Amount,
ROW_NUMBER() OVER (Order by ad.Amount desc) RnRank
from [dbo].[AccountDetails] ad
join [dbo].[Location] l ON ad.LocationId = l.Id
join [dbo].[LocationType] lt ON lt.Id=l.LocationTypeId
where lt.Name = 'Clearing House'

select l.name, ad.accountid, ad.amount,
ROW_NUMBER() over (order by ad.amount desc) RNRank
from AccountDetails as AD
join Location as L on ad.LocationId = L.LocationTypeId
join LocationType as LT on LT.Id = l.LocationTypeId
where lt.Name = 'Clearing house';


;WITH MyCte as
(
SELECT
lo.Name, ad.AccountId, ad.Amount,
ROW_NUMBER() OVER (Order by ad.Amount desc) RnRank
FROM dbo.AccountDetails as ad
INNER JOIN dbo.Location as lo on lo.Id = ad.LocationId
join [dbo].[LocationType] lt ON lt.Id=lo.LocationTypeId
WHERE LT.Name = 'Clearing House'
)
, MyCte2 as
(
SELECT *
FROM MyCte
WHERE RnRank <= 5
)
select *
from MyCte2
where MyCte2.RnRank > 2

;WITH TestCte AS (
SELECT l.Name, ad.AccountId, ad.Amount,
ROW_NUMBER() OVER (PARTITION BY l.Name Order by ad.Amount desc) RowNumber
FROM dbo.AccountDetails as ad
JOIN dbo.Location l ON ad.LocationId = l.Id
JOIN dbo.LocationType as lt ON lt.Id=l.LocationTypeId
WHERE lt.Name = 'Clearing House'
)
SELECT *
FROM TestCte
WHERE RowNumber <= 5

/*Prepare query that will show smallest 2 transactions from each location in February, 2019. Query should include the owner or the account as well.
Columns on output:
LocationName
Amount
Customer name*/

;WITH MyCte AS (
SELECT l.Name, ad.AccountId, ABS(ad.Amount) as Amount, ad.TransactionDate, c.FirstName+ ' ' +c.LastName as CustomerName,
ROW_NUMBER() OVER (PARTITION BY l.Name Order by ABS(ad.Amount) asc) RowNumber
FROM dbo.AccountDetails as ad
JOIN dbo.Location as l ON ad.LocationId = l.Id
JOIN dbo.Account as a ON ad.AccountId=a.Id
JOIN dbo.Customer as c ON c.Id=a.CustomerId
WHERE MONTH(TransactionDate) = 2 and YEAR(TransactionDate) = 2019
)
SELECT *
FROM MyCte
WHERE RowNumber <= 2
ORDER BY Amount, RowNumber


SELECT
ad.AccountId
, MONTH(ad.TransactionDate) as monthOfTran
, SUM(ad.Amount) TotalTransSum

FROM dbo.AccountDetails as ad
WHERE ad.Amount < 0
GROUP BY
ad.AccountId,MONTH(ad.TransactionDate)


SELECT
ad.AccountId
, MONTH(ad.TransactionDate) as monthOfTran
, SUM(ad.Amount) TotalTransSum

FROM dbo.AccountDetails as ad
WHERE ad.Amount < 0
GROUP BY GROUPING SETS
(
(ad.AccountId,MONTH(ad.TransactionDate))
,( ad.AccountId)
,( MONTH(ad.TransactionDate))
, ()
)
ORDER BY MONTH(ad.TransactionDate)


;WITH CTE AS
(
SELECT
ad.AccountId
, MONTH(ad.TransactionDate) as monthOfTran
, SUM(ad.Amount) TotalTransSum

FROM dbo.AccountDetails as ad
WHERE ad.Amount < 0
GROUP BY CUBE
(
ad.AccountId,MONTH(ad.TransactionDate)
)
)
SELECT *
FROM CTE WHERE
cte.AccountId is not null and cte.monthOfTran is null


SELECT AD.ACCOUNTID, MONTH(AD.TRANSACTIONDATE) AS MONTHOFTRANSACTION,
YEAR(AD.TRANSACTIONDATE) AS YEAROFTRANSACTION,
SUM(AD.AMOUNT) AS CURRENTBALANCE,
MIN(ABS(AD.AMOUNT)) AS MINTRANSACTION,
MAX(ABS(AD.AMOUNT)) AS MAXTRANSACTION,
STRING_AGG(AD.PURPOSEDESCRIPTION, ', ') AS AGGPURPOSECODE
FROM DBO.AccountDetails AS AD 
GROUP BY AD.AccountId, MONTH(AD.TRANSACTIONDATE), YEAR(AD.TRANSACTIONDATE)
ORDER BY AD.AccountId





















































































