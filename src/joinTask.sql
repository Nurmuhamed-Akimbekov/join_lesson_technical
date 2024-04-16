--1 Бардык клиенттердин шаарлары уникалдуу чыксын
select city
from customers
group by city;
--( max city order by)
select max(city), count(*)
from customers
group by city
order by count(*) desc;
--2 Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
select LastName, FirstName, BirthDate
from Employees
where year (BirthDate) between 1950 and 1960
order by BirthDate;
--3 Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT supplierName as Suppler_names, Country
FROM Suppliers
where country = 'France';
--4 Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
select customerName, address, country
from customers
where customerName like 'A%'
  and country not in ('Spain');
--5 PostalCode бош болгон клиенттер чыксын
SELECT *
FROM Customers
where PostalCode in ('');
--6 Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT top 2  *
FROM Customers
WHERE city = 'London';
--7 Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
SELECT firstname, lastname, birthdate
FROM Employees
WHERE lastname like '____';
--8 Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
SELECT country, count(*)
from Suppliers
group by country;
--9 Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT country, count(*)
from Suppliers
group by country
having count(*) = 1
order by country;
--10 Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
select sum(p.price) as all_sum_of_products
from products p
         inner join categories c on c.CategoryID = p.CategoryID;
--11 6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
select productName as the_cheapest_product, price
from Products
where price = (select min(price) from Products where CategoryID in (6, 8));
--12 Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
select p.ProductName, p.price, s.SupplierName
FROM Products p
         inner join Suppliers s on p.Supplierid = s.Supplierid
order by s.SupplierName;
--13 Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
select s.SupplierName, count(p.ProductId)
from Suppliers s
         inner join products p on s.supplierId = p.supplierId
group by s.SupplierName
order by count(p.ProductId) desc;
--14 Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
select c.CustomerName, e.FirstName as Employee_name, sh.ShipperName
from Customers c,
     Orders o,
     Employees e,
     Shippers sh
where c.CustomerID = o.CustomerID
  and o.EmployeeID = e.EmployeeID
  and sh.ShipperID = o.ShipperID;
--15 Кайсы ишкер канча клиент обслуживайтеткен чыксын
select e.FirstName, count(c.CustomerName) as NumberOfClients
from Customers as c,
     Orders as o,
     Employees as e
where c.CustomerID = o.CustomerID
  and o.EmployeeID = e.EmployeeID
group by e.FirstName
order by count(c.CustomerName) desc;