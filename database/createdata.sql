create database DB_FruitStore
go
use DB_FruitStore
go

-- Bảng phân quyền
create table [Role](
	 roleId int identity not null primary key,
     roleName varchar(50) not null,
)
go
-- Bảng người dùng
create table [User](
	ID varchar(100) not null primary key,
	uName nvarchar(100),
	Number varchar(20),
	[Address] nvarchar(100),
	Email varchar(100),
	roleId int,
	CONSTRAINT fk_user_role foreign key(roleId) references [Role](roleId)
)

-- Bảng danh mục
create table Category(
	ID int identity not null primary key,
	[Name] nvarchar(100)
)

go
-- Bảng sản phẩm
create table Products(
	ID int identity not null primary key,
	[Name] nvarchar(100),
	Price float,
	Quantity int,
	ID_Category int,
	CONSTRAINT fk_products_category foreign key(ID_Category) references Category(ID)
)

-- Bảng đặt hàng
create table Orders(
	ID int identity not null primary key,
	Date_Created date,
	ID_User varchar(100),
	Total_price float,
	[Status] nvarchar(100),
	CONSTRAINT fk_orders_user foreign key(ID_User) references [User](ID)
)

-- Bảng chi tiết đặt hàng
create table Orders_Details(
	ID int identity not null primary key,
	ID_Product int,
	Quantity int,
	Price float,
	ID_Order int,
	CONSTRAINT fk_ordersdetails_products foreign key(ID_Product) references Products(ID),
	CONSTRAINT fk_ordersdetails_orders foreign key(ID_Order) references Orders(ID)
)

create table Account(
	ID int identity not null primary key,
	username varchar(50) not null,
	[password] varchar(200) not null,
	userId varchar(100) not null,
	CONSTRAINT fk_account_user foreign key(userId) references [User](ID)
)