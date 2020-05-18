--CREATING AND USING DATABASE
CREATE DATABASE EcommerceShoppping;
USE EcommerceShoppping;

--Creating Tables
CREATE TABLE Category
(
	CategoryID int primary key identity(1,1),
	CategoryName varchar(20),
	Category_Description varchar(50)	
);
drop table Customer
CREATE TABLE Customer
(
	Customer_ID int identity(1,1) primary key,
	Customer_Name varchar(20),
	Email varchar(25),
	Password varchar(15),
	Contact numeric(10,0),
	Gender varchar(1),
	Address varchar(70),	
	City varchar(50),
	State varchar(50),
	Pincode numeric (10,0)
);

CREATE TABLE Product
(
	Product_ID int identity(1,1) primary key,
	CategoryId int foreign key references Category(CategoryID),
	Product_Name varchar(30),
	Price Numeric(6),
	Quantity int,
	Image varchar(30),
	Specifications varchar(35),
	Descripion varchar(50),
	Rating varchar(1),
	
);
drop table Orders
CREATE TABLE Orders
(
    Order_ID int identity(1,1) primary key,
	ProductId int foreign key references Product(Product_ID),
	CustId int foreign key references Customer(Customer_ID),
	Amount numeric(6),
	Shipping_Address varchar(35),
	Order_Address varchar(35),
	Order_Email varchar(25),
	Order_Date date,
	Delivery_Date date,
	Remarks varchar(25),
	Payment_Mode varchar(25),
);
drop table Shopping_Cart
CREATE TABLE Shopping_Cart
(
Cart_ID int identity(1,1) primary key,
ProdId int foreign key references Product(Product_ID),
Date_Added date,

Quantity int,
);
drop table OrderDetail
CREATE TABLE OrderDetail
( 
OrderDetail_ID int identity(1,1) primary key,
PId int foreign key references Product(Product_ID),
OrderId int foreign key references Orders(Order_ID),
OrderTotal numeric (6),
TotalItems int,
);

-- stored Procedure
--1.Customer

Create Procedure AddCustomer(@name varchar(20),@email varchar(25),@password varchar(15),@contact numeric(10),@gender varchar(1),@address varchar(70),@city varchar(50),@state varchar(50),@pincode int)
as
  begin
      insert into Customer
	  values(@name,@email,@password,@contact,@gender,@address,@city,@state,@pincode)
  end
go


Create Procedure UpdateCustomer(@id int,@name varchar(20),@email varchar(25),@password varchar(15),@contact numeric(10),@gender varchar(1),@address varchar(70),@city varchar(50),@state varchar(50),@pincode int)
as
  begin
      Update Customer
	  set Customer_Name = @name,Email = @email,Password = @password,Contact = @contact,Gender = @gender,Address = @address,City = @city,State = @state,Pincode = @pincode
	  where Customer_ID = @id;
  end
go


Create Procedure DeleteCustomer(@id int)
as 
  begin
      Delete from Customer
	  where Customer_ID = @id;
  end
go

Create Procedure ShowAllCustomer
as
  begin
     Select * from Customer
  end
go



-- 2.Products

Create Procedure ShowProduct(@name varchar(50))
as
  begin
     Select * from Product
	 where Product_Name = @name
  end
go


--3. Shopping Cart
Create Procedure AddShoppingCart(@id int, @date date,@quantity int)
as 
  begin 
    insert into Shopping_Cart
	values(@id,@date,@quantity)
  end
go

Create Procedure DeleteCart(@id int)
as 
  begin
      Delete from Shopping_Cart
	  where Cart_ID = @id;
  end
go

--4. Category

Create Procedure ShowCategory(@name varchar(50))
as
  begin
     Select * from Category
	 where CategoryName = @name
  end
go

--5. Order
