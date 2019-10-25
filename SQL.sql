-- show databases;

-- create database Umuzi;

create table Customers(
CustomerID int auto_increment primary key,
Firstname varchar(50),
LastName varchar(50),
Gender varchar(10),
Address varchar(200),
Phone int(10),
Email varchar(100),
City varchar(20),
Country varchar(50)
);

create table Employees(
EmployeeID int auto_increment primary key,
Firsname varchar(50),
Lastname varchar(50),
Email varchar(100),
JobTitle varchar(20)
);

create table Orders(
OrderID int auto_increment primary key,
ProductID int,
PaymentID int,
FulfilledByEmployeeID int,
DateRequired datetime,
DateShipped datetime,
Status varchar(20),
foreign key (ProductID) references Products(ProductID),
foreign key (PaymentID) references Payments(PaymentID),
foreign key (FulfilledByEmployeeID) references Employees(EmployeeID)
);


create table Payments(
CustomerID int auto_increment primary key,
PaymentID int,
PaymentDate datetime,
Amount decimal
);

create table Products(
ProductID int auto_increment primary key,
ProductName varchar(100),
Description varchar(300),
BuyPrice decimal
);

alter table Payments
drop primary key;

alter table Customers CHANGE Phone Phone bigint(30);

alter table employees change Firsname Firstname varchar(50);
alter table products change BuyPrice BuyPrice decimal(6,2);
alter table payments change Amount Amount decimal(6,2);

INSERT INTO 
    Customers(Firstname, LastName, Gender, Address, Phone, Email,City, Country)
VALUES
	('John','Hibert','Male','284chaucer st', 084789657, 'john@gmail.com','Johannesburg','South Africa'),
    ('Thando','Sithole', 'Female', '240 Sect 1',0794445584,'thando@gmail.com','Cape Town','South Africa'),
    ('Leon','Glen','Male','81 Everton Rd,Gillits',0820832830,'Leon@gmail.com','Durban','South Africa'),
    ('Charl','Muller','Male','290A Dorset Ecke', '+44856872553','Charl.muller@yahoo.com','Berlin','Germany'),
    ('Julia','Stein','Female','2 Wernerring',+448672445058,	'Js234@yahoo.com','Frankfurt','Germany');
    
INSERT INTO 
    Employees(Firstname, LastName, Email, JobTitle)
VALUES
	('Kani','Matthew','mat@gmail.com','Manager'),
	('Lesly','Cronje','LesC@gmail.com','Clerk'),
	('Gideon','Maduku','m@gmail.com','Accountant');
    
INSERT INTO
	products(ProductName, Description,BuyPrice)
VALUES
('Harley Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
('Classic Car','Turnable front wheels, steering function',550.75),
('Sports car','Turnable front wheels, steering function',700.60);

INSERT INTO
	payments(PaymentID, PaymentDate,Amount)
VALUES
(1,'2018-09-01',150.75),
(1,'2018-09-03',150.75),
(1,'2018-09-03',700.60);

INSERT INTO 
	orders(ProductID, PaymentID, FulfilledByEmployeeID, DateRequired, c, Status)
VALUES
	(1,1,2,2018-09-05,'','Not shipped'),
	(1,2,2,2018-09-04,03-09-2018,'Shipped'),
	(3,3,3,2018-09-06,'','Not shipped');
    


-- Part II

SELECT * FROM customers;

SELECT Firstname
FROM customers;

SELECT * FROM customers WHERE `CustomerID` = 1;

SELECT 
    Firstname, 
    Lastname 
FROM
    customers
WHERE
    `CustomerID` = 1;


DELETE FROM customers 
WHERE
    `CustomerID` = 2;

SELECT 
    DISTINCT status
FROM
    orders;
    
SELECT MAX(Amount) AS MaximumPayment FROM payments;

SELECT 
    DISTINCT Firstname
FROM
    customers
ORDER BY 
    Country;


SELECT 
    ProductName
FROM
    products
WHERE
    BuyPrice BETWEEN 100 AND 600;
    
SELECT *
FROM
    customers
WHERE
    Country= 'Germany' AND 
    City = "Berlin";

SELECT *
FROM
    customers
WHERE
    Country= 'Germany' AND 
    City = "Berlin";

SELECT *
FROM
    customers
WHERE
    Country= 'Cape Town' OR
    City = "Durban";

SELECT *
FROM
    products
WHERE
    BuyPrice > 500;

SELECT SUM(Amount) AS TotalPayments FROM payments;

SELECT COUNT(Status = 'Shipped') AS NumberOfProducts FROM orders;

SELECT AVG(BuyPrice) AS AveragePriceRands FROM Products;

SELECT AVG(BuyPrice/12) AS AveragePriceDollars FROM Products;

SELECT *
FROM payments
INNER JOIN customers
ON payments.CustomerID = customers.CustomerID;

SELECT *
FROM
    products
WHERE
    Description > "Turnable front wheels, steering function";


