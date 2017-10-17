--��1��	��ѯ��'1997-10-1' ��'1997-10-7'�ڼ䶩���Ķ�����š��ͻ���ϵ�����ơ����С���ַ����ϵ�绰���������кͶ���������������
/*select OrderID,ContactName,ShipCity,Address,Phone from Orders,Customers where Orders.CustomerID=Customers.CustomerID and OrderDate between '1997-10-1' and '1997-10-7'order by ShipCity,OrderDate ASC;
*/

-- ��2����ѯ��'1997-10-1' ��'1997-10-7'�ڼ䶩���Ķ�����š��ͻ���ϵ�����ơ����С���ַ����ϵ�绰���˷ѡ������������ܽ����ۿۺ��ܽ��������кͶ��������������򡣣���ʾ���ɲ��õ��������Ӳ�ѯ����������������ɡ���
/*
select b.OrderID,b.ContactName,b.ShipCity,b.Address,b.Phone,SUM(b.�ܽ��) as �ܽ��,SUM(b.�ۿۺ��ܽ��) as �ۿۺ��ܽ�� from 
(select Orders.OrderID,OrderDate, ContactName, ShipCity,Address,Phone,Freight,Quantity,UnitPrice*Quantity as �ܽ��,UnitPrice*Quantity*(1-Discount) as �ۿۺ��ܽ�� from Orders,Customers,[Order Details] where Orders.CustomerID=Customers.CustomerID and [Order Details].OrderID=Orders.OrderID and OrderDate between '1997-10-1' and '1997-10-7' ) as b group by b.OrderDate,OrderID,b.ContactName,b.ShipCity,b.Address,b.Phone order by b.ShipCity,b.OrderDate ASC;
*/

-- ��3����ѯ��'1997-10-1' ��'1997-10-7'�ڼ�ÿ��Ա��������ҵ�����������Ա����š�������������Ա�������������
/* select Employees.EmployeeID,b.������ from Employees left outer join (select Employees.EmployeeID, COUNT(*) as ������ from  Employees,  Orders  where Orders.EmployeeID=Employees.EmployeeID and Orders.OrderDate between '1997-10-1' and '1997-10-7' GROUP BY Employees.EmployeeID) as b on b.EmployeeID=Employees.EmployeeID order by Employees.EmployeeID;
*/

-- ��4����ѯ'1997-10-7'����������Ʒ�Ŀ�������������Ʒ��š����ơ���档
/* select Products.ProductID,ProductName,UnitsInStock from Products,[Order Details],Orders where Products.ProductID=[Order Details].ProductID and [Order Details].OrderID=Orders.OrderID and Orders.OrderDate ='1997-10-7';
*/

-- (5) ��ѯ�ͻ���š�BSBEV���ڡ�1997-5-16��������ÿһ�ʶ�����ϸ�����������š��������ڡ��������ڡ���Ʒ���ơ����ۡ��������ۿۺ����
/* select Orders.OrderID,OrderDate,Products.ProductName,Products.UnitPrice,[Order Details].Quantity,[Order Details].Quantity* [Order Details].UnitPrice*(1-Discount) as �ۿۺ��� from [Order Details],Orders,Products where [Order Details].ProductID=Products.ProductID and [Order Details].OrderID=Orders.OrderID and Orders.CustomerID='BSBEV' and Orders.OrderDate='1997-5-16';
*/

--��6��	���ѯ�۸񲻵�����ͬ���Ʒƽ���۸�Ĳ�Ʒ��š����ơ��۸����ࡣ������3��ʵ�ַ���
/* select ProductID,ProductName,UnitPrice,b.CategoryID from Products,(select CategoryID, AVG(Products.UnitPrice) as ͬ��ƽ��ֵ from Products group by Products.CategoryID)as b where Products.CategoryID=b.CategoryID and Products.UnitPrice> b.ͬ��ƽ��ֵ order by Products.ProductID;
*/

/*select ProductID,ProductName,UnitPrice,b.CategoryID from Products,(select CategoryID, SUM(Products.UnitPrice)/COUNT(Products.ProductID) as ͬ��ƽ��ֵ from Products group by Products.CategoryID)as b where Products.CategoryID=b.CategoryID and Products.UnitPrice> b.ͬ��ƽ��ֵ order by Products.ProductID;
*/

/*select * from Products where exists (select * from  (select CategoryID, AVG(Products.UnitPrice) as ͬ��ƽ��ֵ from Products group by Products.CategoryID) as b where b.CategoryID=Products.CategoryID and Products.UnitPrice>b.ͬ��ƽ��ֵ ) ;
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

--��7��	���ѯ�ۼ������ܽ����40000Ԫ�����ϵĿͻ���š���ϵ�ˡ��绰��������������3��ʵ�ַ�����
/* select * from (select b.CustomerID, b.CompanyName,b.Phone,b.Country, SUM(b.�ܽ��) as �ۼ��ܽ�� from (select Orders.CustomerID,Customers.CompanyName,Customers.Phone,Customers.Country ,Quantity*[Order Details].UnitPrice as �ܽ�� from Orders,[Order Details],Customers where Orders.OrderID=[Order Details].OrderID and Orders.CustomerID=Customers.CustomerID) as b group by b.CustomerID,b.CompanyName,b.Phone,b.Country) as c where c.�ۼ��ܽ��>40000;
*/

/*select * from Customers where exists  ( select * from (select b.CustomerID, b.CompanyName,b.Phone,b.Country, SUM(b.�ܽ��) as �ۼ��ܽ�� from (select Orders.CustomerID,Customers.CompanyName,Customers.Phone,Customers.Country ,Quantity*[Order Details].UnitPrice as �ܽ�� from Orders,[Order Details],Customers where Orders.OrderID=[Order Details].OrderID and Orders.CustomerID=Customers.CustomerID) as b group by b.CustomerID,b.CompanyName,b.Phone,b.Country ) as c where c.CustomerID=Customers.CustomerID and c.�ۼ��ܽ��>40000);
*/

/* select * from (select b.CustomerID,b.CompanyName,b.Phone,b.Country,SUM(b.�����ܽ��)as �ۼ��ܽ�� from (select Orders.OrderID,Customers.CustomerID,Customers.CompanyName,Customers.Phone,Customers.Country ,SUM(Quantity*[Order Details].UnitPrice) as �����ܽ�� from Orders,[Order Details],Customers where Orders.OrderID=[Order Details].OrderID and Orders.CustomerID=Customers.CustomerID group by Orders.OrderID,CompanyName,Customers.CustomerID,Phone,Country)as b group by b.CustomerID,b.CompanyName,b.Phone,b.Country) as d where d.�ۼ��ܽ��>40000;
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


