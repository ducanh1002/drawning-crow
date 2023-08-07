USE master
GO
select * from userInfo
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'DawningCrowDB')
	DROP DATABASE DawningCrowDB
GO

CREATE DATABASE DawningCrowDB
GO

use DawningCrowDB
GO

Create Table Category (
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(max),
)
GO
select * from Category
INSERT INTO Category (name) VALUES (N'COLOR');
INSERT INTO Category (name) VALUES (N'WITHOUT COLOR');
INSERT INTO Category (name) VALUES (N'OTHER');
GO

Create Table Product (
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(max),
	image nvarchar(max),
	price int NULL,
	cateID int NULL FOREIGN KEY REFERENCES Category(id),
) 
GO



GO
INSERT INTO Product(name, image, price, cateID) VALUES (N'Croissant and Strawberry Jam', N'https://i.pinimg.com/564x/56/60/61/56606180aa6d58988579f79b0996194d.jpg', 8667, 2);
INSERT INTO Product(name, image, price, cateID) VALUES (N'In the Bar', N'https://i.pinimg.com/564x/93/5a/4b/935a4bfb2bfa664556297101450fb4f7.jpg', 9700, 2);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Eat Donut', N'https://i.pinimg.com/564x/82/63/8e/82638eee784f98a6a6e8ebbee04e9f58.jpg', 5866, 2);
INSERT INTO Product(name, image, price, cateID) VALUES (N'The Night Tennis Court', N'https://i.pinimg.com/564x/b7/e5/e8/b7e5e855654541d80716ecf0a2381b1b.jpg', 7723, 1);
INSERT INTO Product(name, image, price, cateID) VALUES (N'In the Cafe', N'https://i.pinimg.com/564x/a6/45/0a/a6450a2463cad7bbc9204759c4fbbe78.jpg', 3542, 1);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Black cat on a sunflower bike', N'https://i.pinimg.com/564x/89/e2/e7/89e2e71d7995b9fba388982e68b30fc8.jpg', 3243, 1);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Kendo cat', N'https://i.pinimg.com/564x/85/8d/23/858d2348c5f2d1d3eb3aa9f54ad68460.jpg', 6053, 2);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Drunk cat', N'https://i.pinimg.com/564x/9b/8b/15/9b8b15ea499a23bf79f0b9620ca27708.jpg', 3835, 2);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Drunk Cat Tote Bag', N'https://i.pinimg.com/564x/00/a4/42/00a4420a82f03911d36dabe7aaf709ac.jpg', 4306, 3);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Just Move Sleep And Move And ZZZ', N'https://i.pinimg.com/736x/69/bd/95/69bd95a59de93787cbc1ed6aa2be6070.jpg', 8134, 3);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Capybara in hats Iphone case', N'https://i.pinimg.com/564x/ac/9b/6a/ac9b6ab37c97a7c3bcdac85c0afcc508.jpg', 7583, 3);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Dog', N'https://i.pinimg.com/564x/1b/93/74/1b937495918c39165fea8a90ad236596.jpg', 4936, 1);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Banana Cat', N'https://i.pinimg.com/564x/1f/f1/d6/1ff1d61c2be6b5b10a0b03f611ba876f.jpg', 3883, 3);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Shit Happens', N'https://i.pinimg.com/564x/b0/75/0a/b0750a5a2b3a116f55c27201421759ab.jpg', 8695, 2);
INSERT INTO Product(name, image, price, cateID) VALUES (N'The Black Panther Oden', N'https://i.pinimg.com/564x/6c/4e/d9/6c4ed9f6bf6ea833be8fd3bc4963f240.jpg', 6413, 2);
INSERT INTO Product(name, image, price, cateID) VALUES (N'Takoyaki Cat', N'https://i.pinimg.com/564x/70/27/13/70271326c94b246b561b3aacfeb029e4.jpg', 2940, 2);
Go

Create table userInfo (
    userID int IDENTITY(1,1) PRIMARY KEY,
    name nvarchar(max),
    username nvarchar(max),
    [password] nvarchar(max),
    Rollno int
)
GO
select * from userInfo
insert into userInfo(name, username, password, Rollno) values (N'Hậu Vũ', 'mra', '123', 1);

Create table Orders (
	orderID int IDENTITY(1,1) ,
	userID int,
	Date date Default GETDATE(),
	Price int,
	primary key(orderID),
	foreign key(userID) references userInfo(userID)
)
GO

Create table OrderDetails(
	orderID int,
	productID int,
	TotalPrice int,
	Quantity int,
	primary key(orderID, productID),
	foreign key(orderID) references Orders(orderID),
	foreign key(productID) references Product(id),
)
GO

Create table Cart (
	userID int,
	productID int,
	TotalPrice int,
	Quantity int,
	primary key (userID,productID),
	FOREIGN KEY (userID) REFERENCES userInfo(userID),
	FOREIGN KEY (productID) references Product(id),
)



