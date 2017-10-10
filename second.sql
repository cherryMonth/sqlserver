-- （1）	在产品表(Products)中找出库存大于30的产品的所有信息：
-- select * from Products where UnitsInStock > 30;

-- （2）	查询顾客表(Customers)中所有不重复的所在城市
-- select City from Customers group by City having count(*)=1;

--（3）	在订单表(Orders)中找出运费在10到50（含10和50）之间的订单编号、顾客编号和职员编号
-- select OrderID,CustomerID, EmployeeID from Orders where Freight >=10 and Freight <=50;

--（4）	在顾客表(Customers)中找出所在城市为London的联系人名和公司名
-- select ContactName,CompanyName from Customers where City='London';

--（5）	在顾客表(Customers)中找出所在城市为London、Madrid、Torino和Paris的顾客编号及电话
-- select CustomerID,Phone from Customers where City='London' or City='Madrid' or City='Torino' or City='Paris';

--（6）	在订单表(Orders)中找出国籍不是Brazil、Spain和Mexico的订单编号和订货日期
-- select OrderID,OrderDate from Orders where ShipCountry!='Brazil' and ShipCountry!='Spain' and ShipCountry!='Mexico';

--（7）	在产品表(Products)中找出单位数量中有box的产品名和产品编号
-- select ProductID,ProductName from Products where QuantityPerUnit like '%box%';

--（8）	在顾客表(Customers)中找出公司名的首字母为F的顾客编号和联系人名
-- select CustomerID,ContactName from Customers where CompanyName like 'F%';

--（9）	在顾客表(Customers)中找出公司名的首字母为F，第5位为k的顾客编号和联系人名
-- select CustomerID,ContactName from Customers where CompanyName like 'F___k%';

--（10）统计在'1997-10-1' 到'1997-10-7'期间，订单中每个员工的订单数，并按订单数降序排序。
-- select EmployeeID,OrderDate from Orders where OrderDate >= '1997-10-1' and OrderDate <= '1997-10-7';
-- select EmployeeID ,COUNT(*) from Orders where  OrderDate >= '1997-10-1' and OrderDate <= '1997-10-7' group by EmployeeID having COUNT(*) >=0 order by COUNT(*) desc ;

-- （11）请查询平均价格在及以上的产品类型
-- select AVG(UnitPrice) from Products /*计算平均价格*/
-- select AVG(UnitPrice) as 平均价格 from Products group by CategoryID; /*计算所有种类的平均价格*/
-- select b.* from (select AVG(UnitPrice) as 平均价格 from Products group by CategoryID) b where b.平均价格> (select AVG(UnitPrice) from Products); /*在所有平均价格之中进行筛选*/
