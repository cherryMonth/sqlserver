--（1）	查询在'1997-10-1' 到'1997-10-7'期间订货的订单编号、客户联系人名称、城市、地址、联系电话，并按城市和订货日期升序排序。
/*select OrderID,ContactName,ShipCity,Address,Phone from Orders,Customers where Orders.CustomerID=Customers.CustomerID and OrderDate between '1997-10-1' and '1997-10-7'order by ShipCity,OrderDate ASC;
*/

-- （2）查询在'1997-10-1' 到'1997-10-7'期间订货的订单编号、客户联系人名称、城市、地址、联系电话、运费、订货数量、总金额和折扣后总金额，并按城市和订货日期升序排序。（提示：可采用导出表连接查询方案，其他方案亦可。）
/*
select b.OrderID,b.ContactName,b.ShipCity,b.Address,b.Phone,SUM(b.总金额) as 总金额,SUM(b.折扣后总金额) as 折扣后总金额 from 
(select Orders.OrderID,OrderDate, ContactName, ShipCity,Address,Phone,Freight,Quantity,UnitPrice*Quantity as 总金额,UnitPrice*Quantity*(1-Discount) as 折扣后总金额 from Orders,Customers,[Order Details] where Orders.CustomerID=Customers.CustomerID and [Order Details].OrderID=Orders.OrderID and OrderDate between '1997-10-1' and '1997-10-7' ) as b group by b.OrderDate,OrderID,b.ContactName,b.ShipCity,b.Address,b.Phone order by b.ShipCity,b.OrderDate ASC;
*/

-- （3）查询在'1997-10-1' 到'1997-10-7'期间每个员工的销售业绩情况，包括员工编号、订单量，并按员工编号升序排序。
/* select Employees.EmployeeID,b.订单量 from Employees left outer join (select Employees.EmployeeID, COUNT(*) as 订单量 from  Employees,  Orders  where Orders.EmployeeID=Employees.EmployeeID and Orders.OrderDate between '1997-10-1' and '1997-10-7' GROUP BY Employees.EmployeeID) as b on b.EmployeeID=Employees.EmployeeID order by Employees.EmployeeID;
*/

-- （4）查询'1997-10-7'当天所售商品的库存情况，包括商品编号、名称、库存。
/* select Products.ProductID,ProductName,UnitsInStock from Products,[Order Details],Orders where Products.ProductID=[Order Details].ProductID and [Order Details].OrderID=Orders.OrderID and Orders.OrderDate ='1997-10-7';
*/

-- (5) 查询客户编号“BSBEV”在“1997-5-16”订购的每一笔订单明细（包括订单号、订货日期、交货日期、产品名称、单价、数量、折扣后金额）。
/* select Orders.OrderID,OrderDate,Products.ProductName,Products.UnitPrice,[Order Details].Quantity,[Order Details].Quantity* [Order Details].UnitPrice*(1-Discount) as 折扣后金额 from [Order Details],Orders,Products where [Order Details].ProductID=Products.ProductID and [Order Details].OrderID=Orders.OrderID and Orders.CustomerID='BSBEV' and Orders.OrderDate='1997-5-16';
*/

--（6）	请查询价格不低于其同类产品平均价格的产品编号、名称、价格、种类。（多于3种实现方案
/* select ProductID,ProductName,UnitPrice,b.CategoryID from Products,(select CategoryID, AVG(Products.UnitPrice) as 同类平均值 from Products group by Products.CategoryID)as b where Products.CategoryID=b.CategoryID and Products.UnitPrice> b.同类平均值 order by Products.ProductID;
*/

/*select ProductID,ProductName,UnitPrice,b.CategoryID from Products,(select CategoryID, SUM(Products.UnitPrice)/COUNT(Products.ProductID) as 同类平均值 from Products group by Products.CategoryID)as b where Products.CategoryID=b.CategoryID and Products.UnitPrice> b.同类平均值 order by Products.ProductID;
*/

/*select * from Products where exists (select * from  (select CategoryID, AVG(Products.UnitPrice) as 同类平均值 from Products group by Products.CategoryID) as b where b.CategoryID=Products.CategoryID and Products.UnitPrice>b.同类平均值 ) ;
*/

/*
create view price_table as
select AVG(UnitPrice) as avg_price,CategoryID
from Products
group by CategoryID

select Products.ProductID,Products.ProductName,Products.UnitPrice,Products.CategoryID
from Products,price_table
where Products.CategoryID=price_table.CategoryID and Products.UnitPrice>price_table.avg_price
order by Products.ProductID
*/

--（7）	请查询累计消费总金额在40000元及以上的客户编号、联系人、电话、国籍。（多于3种实现方案）
/* select * from (select b.CustomerID, b.CompanyName,b.Phone,b.Country, SUM(b.总金额) as 累计总金额 from (select Orders.CustomerID,Customers.CompanyName,Customers.Phone,Customers.Country ,Quantity*[Order Details].UnitPrice as 总金额 from Orders,[Order Details],Customers where Orders.OrderID=[Order Details].OrderID and Orders.CustomerID=Customers.CustomerID) as b group by b.CustomerID,b.CompanyName,b.Phone,b.Country) as c where c.累计总金额>40000;
*/

/*select * from Customers where exists  ( select * from (select b.CustomerID, b.CompanyName,b.Phone,b.Country, SUM(b.总金额) as 累计总金额 from (select Orders.CustomerID,Customers.CompanyName,Customers.Phone,Customers.Country ,Quantity*[Order Details].UnitPrice as 总金额 from Orders,[Order Details],Customers where Orders.OrderID=[Order Details].OrderID and Orders.CustomerID=Customers.CustomerID) as b group by b.CustomerID,b.CompanyName,b.Phone,b.Country ) as c where c.CustomerID=Customers.CustomerID and c.累计总金额>40000);
*/

/* select * from (select b.CustomerID,b.CompanyName,b.Phone,b.Country,SUM(b.订单总金额)as 累计总金额 from (select Orders.OrderID,Customers.CustomerID,Customers.CompanyName,Customers.Phone,Customers.Country ,SUM(Quantity*[Order Details].UnitPrice) as 订单总金额 from Orders,[Order Details],Customers where Orders.OrderID=[Order Details].OrderID and Orders.CustomerID=Customers.CustomerID group by Orders.OrderID,CompanyName,Customers.CustomerID,Phone,Country)as b group by b.CustomerID,b.CompanyName,b.Phone,b.Country) as d where d.累计总金额>40000;
*/

/*
create view price_table as
select sum(UnitPrice*Quantity*(1-Discount)+Orders.Freight) as price ,[Order Details].OrderID
from [Order Details],Orders
where Orders.OrderID=[Order Details].OrderID
group by [Order Details].OrderID

select Customers.CustomerID,Customers.ContactName,Customers.Phone,Customers.Country
from 
(
select Customers.CustomerID
from Customers,Orders,price_table
where Customers.CustomerID=Orders.CustomerID and Orders.OrderID=price_table.OrderID
group by Customers.CustomerID
having sum(price_table.price)>40000
) as table1,Customers
where table1.CustomerID=Customers.CustomerID
*/


