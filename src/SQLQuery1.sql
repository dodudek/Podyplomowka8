
--1
select count(*) from Sales.SalesOrderHeader

--2
 select sum(TotalDue) as sum
 from Sales.SalesOrderHeader
 where year(OrderDate) = 2001

--3
 select sum(TotalDue) as sum
 from Sales.SalesOrderHeader
 where year(OrderDate) = 2001 and CustomerID = 442

 --select * from Sales.SalesOrderHeader

 --4
 select year(OrderDate) as RokZamowienia, sum (TotalDue) as SumaOplat
 from Sales.SalesOrderHeader
 group by year(OrderDate)
 order by RokZamowienia 

 --5

 select CustomerID as KlientID, sum(TotalDue) as SumaOplat
 from Sales.SalesOrderHeader
 where year(OrderDate) = 2002
 group by CustomerID
 order by KlientID 

 --6

 select CustomerID as KlientID, sum(TotalDue) as SumaOplat
 from Sales.SalesOrderHeader
 where OrderDate >= '20030501' and OrderDate <= '20030506'
 group by CustomerID
 order by KlientID

 --7

  select CustomerID as KlientID, sum(TotalDue) as SumaOplat
 from Sales.SalesOrderHeader
 where OrderDate >= '20030501' and OrderDate <= '20030506' 
 group by CustomerID
 having sum(TotalDue) > 40000
 order by SumaOplat

 select * from Sales.SalesOrderDetail
 select * from Sales.SalesOrderHeader
 select * from Sales.Customer

 select * 
 from Sales.SalesOrderHeader as soh
 join Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID
 order by soh.SalesOrderID, sod.SalesOrderDetailID


 select soh.SalesOrderID as NumerZamowienia, sod.SalesOrderDetailID as NumerSzczegolowZamowienia 
 from Sales.SalesOrderHeader as soh
 join Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID
 order by soh.SalesOrderID, sod.SalesOrderDetailID


 select soh.SalesOrderID as NumerZamowienia, sod.SalesOrderDetailID as NumerSzczegolowZamowienia, sc.CustomerID as NumerKlienta
 from Sales.SalesOrderHeader as soh
 join Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID
 join Sales.Customer as sc on soh.CustomerID = sc.CustomerID
 order by soh.SalesOrderID, sod.SalesOrderDetailID, NumerKlienta

 --numer klienta + numer zamówienia
 select * from Sales.Customer
  select * from Sales.SalesOrderHeader

  select sc.CustomerID as NumerKlienta, soh.SalesOrderID as NumerZamowienia
  from Sales.Customer as sc
  join Sales.SalesOrderHeader as soh on sc.CustomerID = soh.CustomerID

    select sc.CustomerID as NumerKlienta, soh.SalesOrderID as NumerZamowienia
  from Sales.Customer as sc
  left join Sales.SalesOrderHeader as soh on sc.CustomerID = soh.CustomerID
  where soh.SalesOrderID is null



  select * from Sales.Customer
  select * from Sales.SalesOrderHeader

  --distinct - usuniêcie powtórzeñ  z tabeli
  select distinct CustomerID from Sales.SalesOrderHeader


  -- wyœwietlenie klientów, któzy zrobili co najmniej jedno zamówienie
  select CustomerID as NumerKlienta, AccountNumber as NumerKontaKlienta 
  from Sales.Customer
 -- where CustomerID in (1,5,7) -wyœwietla informacjê tylko o klientach o tych id
 where CustomerID in (
 select distinct CustomerID from Sales.SalesOrderHeader
 )


  select * from Production.Product
  select * from Production.ProductSubcategory

 --8 
 select * from Production.Product as pp
join Production.ProductSubcategory as pps on pp.ProductSubcategoryID = pps.ProductSubcategoryID

 --9
 select pp.ProductID, pp.Name, pp.Color, pps.Name from Production.Product as pp
join Production.ProductSubcategory as pps on pp.ProductSubcategoryID = pps.ProductSubcategoryID

 --10
  select pps.Name as SubCtegoryName, pp.ProductID, pp.Name, pp.Color from Production.Product as pp
 join Production.ProductSubcategory as pps on pp.ProductSubcategoryID = pps.ProductSubcategoryID
 order by SubCtegoryName, Name

 --11
   select ppc.Name, pps.Name as SubCtegoryName, pp.ProductID, pp.Name, pp.Color from Production.Product as pp
 join Production.ProductSubcategory as pps on pp.ProductSubcategoryID = pps.ProductSubcategoryID
 join Production.ProductCategory as ppc on pps.ProductCategoryID = ppc.ProductCategoryID
 order by SubCtegoryName, pp.Name


 SELECT * FROM Person.Contact

 use AdventureWorks
 SELECT top 10 * FROM Person.Contact where LastName = 'Anderson'

 SELECT distinct Title from HumanResources.Employee

 select * from Sales.SalesOrderDetail
  select * from Sales.SalesOrderHeader

  select soh.CustomerID, sod.OrderQty
  from Sales.SalesOrderDetail as sod
  join Sales.SalesOrderHeader as soh on sod.SalesOrderID = soh.SalesOrderID

  select CustomerID, count (*) as LiczbaZamowien from Sales.SalesOrderHeader
  group by CustomerID
  order by LiczbaZamowien desc