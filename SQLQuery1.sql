create database shop

CREATE TABLE InfoShop (
    InfoID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
	Img  NVARCHAR(255),
    Description NVARCHAR(MAX)
);
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(100) NOT NULL, 
    Email NVARCHAR(100) NOT NULL,
    FullName NVARCHAR(100),
    Address NVARCHAR(255),
    Phone NVARCHAR(20)
);


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX)
);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
    Brand NVARCHAR(100),
    ImageURL NVARCHAR(255),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Categories (Name, Description)
VALUES (N'Áo Khoác', N'Áo khoác cho nam'),
       (N'Đầm Nữ', N'Đầm dành cho nữ'),
       (N'Áo Thun', N'Áo thun Unisex');


INSERT INTO Users (Username, Password, Email, FullName, Address, Phone)
VALUES (N'john_doe', N'hashed_password_here', N'john.doe@example.com', N'John Doe', N'123 Main St, City, Country', N'1234567890'),
       (N'jane_smith', N'hashed_password_here', N'jane.smith@example.com', N'Jane Smith', N'456 Elm St, City, Country', N'0987654321');

INSERT INTO Orders (UserID, OrderDate, TotalAmount, Status)
VALUES (1, '2024-06-19', 350000, N'shipped'),
       (2, '2024-06-18', 450000, N'processing');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice, Subtotal)
VALUES (1, 1, 2, 200000, 400000),
       (1, 2, 1, 150000, 150000),
       (2, 3, 1, 300000, 300000);


INSERT INTO Products (Name, Description, Price, CategoryID, Brand, ImageURL)
VALUES 
    (N'Áo Khoác Mùa Đông 1', N'Áo khoác dày dặn chống lạnh cho mùa đông giá lạnh', 500000, 1, N'Brand A', N'khoac1.jpg'),
    (N'Áo Khoác Dày 2', N'Áo khoác mùa đông với lớp lót giữ nhiệt', 520000, 1, N'Brand A', N'khoac2.jpg'),
    (N'Áo Khoác Lót Lông 3', N'Áo khoác mùa đông với lớp lót lông cừu', 510000, 1, N'Brand A', N'khoac3.jpg'),
    (N'Áo Khoác Chống Nước 4', N'Áo khoác mùa đông chống nước và gió', 530000, 1, N'Brand A', N'khoac4.jpg'),
    (N'Áo Khoác Thể Thao 5', N'Áo khoác mùa đông dành cho hoạt động ngoài trời', 540000, 1, N'Brand A', N'khoac5.jpg'),
    (N'Áo Khoác Năng Động 6', N'Áo khoác mùa đông phong cách năng động', 550000, 1, N'Brand A', N'khoac6.jpg'),
    (N'Áo Khoác Thanh Lịch 7', N'Áo khoác mùa đông phong cách thanh lịch', 560000, 1, N'Brand A', N'khoac7.jpg'),
    (N'Áo Khoác Ấm Áp 8', N'Áo khoác mùa đông giữ ấm tốt', 570000, 1, N'Brand A', N'khoac8.jpg'),
    
    (N'Đầm Dạ Tiệc 1', N'Đầm dài thích hợp cho dạ tiệc sang trọng', 350000, 2, N'Brand B', N'dam1.png'),
    (N'Đầm Dạ Hội 2', N'Đầm dài với thiết kế sang trọng', 360000, 2, N'Brand B', N'dam2.png'),
    (N'Đầm Dạ Lễ 3', N'Đầm dạ hội với thiết kế tinh tế', 370000, 2, N'Brand B', N'dam3.png'),
    (N'Đầm Dạ Xuân 4', N'Đầm dạ hội mùa xuân', 380000, 2, N'Brand B', N'dam4.png'),
    (N'Đầm Dạ Thu 5', N'Đầm dạ hội mùa thu', 390000, 2, N'Brand B', N'dam5.png'),
    (N'Đầm Dạ Đông 6', N'Đầm dạ hội mùa đông', 400000, 2, N'Brand B', N'dam6.png'),
    (N'Đầm Dạ Hè 7', N'Đầm dạ hội mùa hè', 410000, 2, N'Brand B', N'dam7.png'),
    (N'Đầm Dạ Đơn Giản 8', N'Đầm dạ hội thiết kế đơn giản', 420000, 2, N'Brand B', N'dam8.png'),
    
    (N'Áo Thun Trơn 1', N'Áo thun trơn thích hợp đi chơi', 150000, 3, N'Brand C', N'thun1.jpg'),
    (N'Áo Thun Màu 2', N'Áo thun trơn màu sắc đa dạng', 160000, 3, N'Brand C', N'thun2.jpg'),
    (N'Áo Thun Ngắn Tay 3', N'Áo thun ngắn tay cho mùa hè', 170000, 3, N'Brand C', N'thun3.jpg'),
    (N'Áo Thun Dài Tay 4', N'Áo thun dài tay cho mùa đông', 180000, 3, N'Brand C', N'thun4.jpg'),
    (N'Áo Thun Thể Thao 5', N'Áo thun thể thao cho hoạt động ngoài trời', 190000, 3, N'Brand C', N'thun5.jpg'),
    (N'Áo Thun Cổ Tròn 6', N'Áo thun cổ tròn phong cách đơn giản', 200000, 3, N'Brand C', N'thun6.jpg'),
    (N'Áo Thun Cổ Tim 7', N'Áo thun cổ tim phong cách trẻ trung', 210000, 3, N'Brand C', N'thun7.jpg'),
    (N'Áo Thun Phong Cách 8', N'Áo thun phong cách hiện đại', 220000, 3, N'Brand C', N'thun8.jpg');
