create database DB_FruitStore
go
use DB_FruitStore
go

-- Bảng phân quyền
create table [Role](
	 roleId int identity not null primary key,
     roleName nvarchar(50) not null,
)
go
-- Bảng người dùng
create table [User](
	IDuser int identity not null primary key,
	userName nvarchar(100),
	Number nvarchar(20),
	[Address] nvarchar(100),
	Email nvarchar(100),
	roleId int not null,
	CONSTRAINT fk_user_role foreign key(roleId) references [Role](roleId)
)

-- Bảng danh mục
create table Category(
	IDcate int identity not null primary key,
	[CategoryName] nvarchar(100)
)

go
-- Bảng sản phẩm
create table Products(
	ID int identity not null primary key,
	[Name] nvarchar(100),
	Price float,
	Describe nvarchar(1000),
	[Image] nvarchar(300),
	ID_Category int not null,
	CONSTRAINT fk_products_category foreign key(ID_Category) references Category(IDcate)
)

-- Bảng đặt hàng
create table Orders(
	ID int identity not null primary key,
	Date_Created datetime default getdate()	,
	Date_Confirm datetime,
	ID_User int not null,
	Delivery_Address nvarchar(1000),
	Total_price float default 0,
	[Status] nvarchar(100),
	CONSTRAINT fk_orders_user foreign key(ID_User) references [User](IDUser)
)

-- Bảng chi tiết đặt hàng
create table Orders_Details(
	IDod int identity not null primary key,
	ID_Product int not null,
	Quantity int,
	Price float,
	ID_Order int not null,
	CONSTRAINT fk_ordersdetails_products foreign key(ID_Product) references Products(ID),
	CONSTRAINT fk_ordersdetails_orders foreign key(ID_Order) references Orders(ID)
)

-- Bảng tài khoản
create table Account(
	ID int identity not null primary key,
	AccountName nvarchar(50) not null,
	[password] nvarchar(200) not null,
	userId int not null,
	CONSTRAINT fk_account_user foreign key(userId) references [User](IDuser)
)


-- Nhập data cho bảng Role

	Insert Into [Role](roleName)
	values ('Admin')
	Insert Into [Role](roleName)
	values ('Client')

-- Nhập data cho bảng User
		Insert into [User](userName,Number,[Address],Email,roleId)
	values ('Admin','0000000001','Da Nang','admin@gmail.com',1)
		Insert into [User](userName,Number,[Address],Email,roleId)
	values ('Ngoc Huy','0997593012','Tran Anh Tong','ngochuy@gmail.com',2)
		Insert into [User](userName,Number,[Address],Email,roleId)
	values ('The Huy','0956593012','Tat Thanh','thehuy@gmail.com',2)
		Insert into [User](userName,Number,[Address],Email,roleId)
	values ('Van A','0949294001','Ha Noi','vana@gmail.com',2)
		Insert into [User](userName,Number,[Address],Email,roleId)
	values ('Quoc B','0949294002','Hue','quocb@gmail.com',2)
		Insert into [User](userName,Number,[Address],Email,roleId)
	values ('Tran C','0949294003','Quang Nam','tranc@gmail.com',2)

-- Nhập data cho bảng Account
		Insert into [Account](AccountName,[password],userId)
	values ('admin@gmail.com','123456',1)
		Insert into [Account](AccountName,[password],userId)
	values ('ngochuy@gmail.com','123456',2)
		Insert into [Account](AccountName,[password],userId)
	values ('thehuy@gmail.com','123456',3)
		Insert into [Account](AccountName,[password],userId)
	values ('vana@gmail.com','123456',4)
		Insert into [Account](AccountName,[password],userId)
	values ('quocb@gmail.com','123456',5)
		Insert into [Account](AccountName,[password],userId)
	values ('tranc@gmail.com','123456',6)

-- Nhập data cho bảng Category
	Insert into Category([CategoryName])
	values (N'Trái cây')
	Insert into Category([CategoryName])
	values (N'Rau củ')
	Insert into Category([CategoryName])
	values (N'Trái cây nhập khẩu')

-- Nhập data cho bảng Products
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Cà chua',20000,N'Cà chua là một loại rau quả phổ biến trên toàn thế giới, được biết đến với hình dáng tròn, màu sắc đỏ tươi và hương vị đặc trưng. Cà chua thường có vị ngọt, chua nhẹ và có thể hơi chua tùy thuộc vào loại và độ chín của nó.','https://image.tienphong.vn/w890/Uploaded/2024/rkznae/2019_07_08/cachua1_qkcy_tjyz_OFCL.jpg',2)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])		
	values (N'Chuối',10000,N'Chuối là một loại quả được trồng rộng rãi trên khắp thế giới, nổi tiếng với vị ngọt, hương thơm và chứa nhiều dưỡng chất. Chuối thường có hình dáng dài, hình ảnh chung của nó là vỏ màu vàng hoặc xanh và thịt mềm mịn bên trong.','https://exson.com.vn/wp-content/uploads/2019/03/chuoi-gia-nam-my-chin-e1507686366387.jpg',1)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])		
	values (N'Cà rốt',25000,N'Cà rốt là một loại rau củ phổ biến, được biết đến với hình dáng dài, màu cam hoặc đỏ và vị ngọt tự nhiên. Cà rốt thường được sử dụng trong nhiều món ăn khác nhau và là một nguồn dồi dào của các dưỡng chất quan trọng.','https://sasaki.com.vn/wp-content/uploads/2023/10/cong-dung-cua-ca-rot-01.png',2)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])		
	values (N'Nho',42000,N'Nho là một loại quả được trồng phổ biến trên khắp thế giới và được biết đến với vị ngọt, hương thơm đặc trưng và lớp vỏ mỏng. Nho thường có nhiều màu sắc khác nhau, từ màu xanh đến màu đỏ, tùy thuộc vào loại giống và độ chín của quả.','https://media.istockphoto.com/photos/bunch-of-different-types-of-fresh-grapes-picture-id183217648?k=6&m=183217648&s=612x612&w=0&h=pZzGyqK6xSK5GqEapPSNxRk3DZnR3BfrbbyAPrKrjBs=',1)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Dâu tây',45000,N'Dâu tây là một loại quả có hình dáng đặc trưng với màu đỏ, một bề mịn và một bề nhẵn. Nó được biết đến với vị ngọt tự nhiên, hương thơm đặc trưng và chứa nhiều dưỡng chất quý gía. Dâu tây thường được ăn tươi, làm nguyên liệu cho nhiều loại món tráng miệng, nước ép, sinh tố, và salad. ','https://www.shutterstock.com/image-photo/strawberry-isolated-strawberries-isolate-whole-600nw-1750959335.jpg',1)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Kiwi xanh NewZealand',40000,N'Trái kiwi xanh New Zealand, hay còn được gọi là kiwi Hayward, là một loại quả có nguồn gốc từ New Zealand và hiện đã trở thành một phần không thể thiếu của thực đơn ăn uống trên toàn thế giới.','https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/12/17/k2-16394051111011674474545-1639700799005-16397007990991111931865-1639708615185-16397086153101210792460.png',3)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Táo Mỹ',30000,N'Táo Mỹ là một nhãn hiệu thương mại của các loại táo được trồng và sản xuất chủ yếu tại Hoa Kỳ. Táo Mỹ được biết đến với vị ngọt, mật ong và hương thơm đặc trưng, cùng với cảm giác giòn và sự đậm đà của thịt táo.','https://hn.check.net.vn/data/product/mainimages/original/product4881.jpg',3)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Việt quất Mỹ',42000,N'Việt quất Mỹ, còn được gọi là blueberry, là một loại quả màu xanh hoặc màu tím đậm, với hương vị ngọt và chua nhẹ đặc trưng. Nó là một trong những loại trái cây phổ biến và được ưa chuộng trên toàn thế giới, chủ yếu là do hương vị tuyệt vời và các lợi ích sức khỏe.','https://thanhnien.mediacdn.vn/Uploaded/minhnguyet/2022_04_24/qua-viet-quoc-781.jpg',3)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Dứa',12000,N'Quả dứa, còn được gọi là thơm, là một loại trái cây nhiệt đới phổ biến trên toàn thế giới với hương vị ngọt, mát và một chút chua. Dứa có hình dáng đặc trưng là một quả hình tròn hoặc hình ovan có vỏ ngoài gai góc, màu xanh hoặc vàng tùy thuộc vào loại và độ chín.','https://image.tienphong.vn/w890/Uploaded/2024/rkznae/2020_05_18/tac_dung_cua_dua_2_YPBZ.jpg',1)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Dưa lưới Nhật',30000,N'Dưa lưới, là một loại trái cây nhiệt đới với hình dáng đặc trưng là hình cầu hoặc hình ovan, có một lớp vỏ mỏng màu xanh với các sợi lưới trắng bao quanh. Đặc điểm nổi bật nhất của dưa lưới là thịt màu hồng hoặc đỏ tươi và có hương vị ngọt, mát.','https://sangiaodich.tiengiang.gov.vn/image/800/800/AE73P5NshBcYbLFJBwLE3le8fB5E1qrlYxvqF4DN.jpg',3)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Khoai Tây',10000,N'Khoai tây hay còn được gọi là khoai lang trắng. Nó có vị ngọt, mềm mịn và có thể được chế biến thành nhiều loại món ăn khác nhau. Khoai tây có thể được chế biến thành nhiều loại món ăn, từ nướng, xào, nấu súp, hay làm bánh. Nó cũng được sử dụng để sản xuất các loại sản phẩm như bột khoai tây, sợi khoai tây.','https://media.istockphoto.com/id/157430678/vi/anh/ba-c%E1%BB%A7-khoai-t%C3%A2y.jpg?s=612x612&w=0&k=20&c=4ETBuHT2Fuv6iFamy11uJruc23Dia5t7YFL2YIC1DMM=',2)
	Insert into Products([Name],[Price],[Describe],[Image],[ID_Category])	
	values (N'Xoài', 23000,N'Xoài là một loại trái cây nhiệt đới phổ biến và được ưa chuộng trên toàn thế giới, biết đến với hương vị ngọt, thơm và mát. Xoài có hình dáng tròn hoặc hình oval, với vỏ ngoài màu xanh, và có thể có vị chua tùy thuộc vào loại xoài. Xoài chứa nhiều dưỡng chất quan trọng, bao gồm vitamin C, A và E, chất xơ và kali. Nó cũng chứa các chất chống ôxy hóa, giúp bảo vệ cơ thể khỏi tổn thương từ các gốc tự do. ','https://i.ex-cdn.com/nongnghiep.vn/files/f1/2019/5/19/xoi-2151935697.jpg',1)