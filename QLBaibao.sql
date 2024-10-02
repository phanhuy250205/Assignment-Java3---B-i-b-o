
CREATE TABLE CATEGORIES(
    Id NVARCHAR(50) PRIMARY KEY,  -- Khóa chính, mã loại tin
    Name NVARCHAR(50)              -- Tên loại tin
);

-- Tạo bảng Users để lưu thông tin người dùng (quản trị viên và phóng viên)
CREATE TABLE Users(
    Id NVARCHAR(40) PRIMARY KEY , 
    Email NVARCHAR(50) UNIQUE,  
    password NVARCHAR(50),
     Role BIT ,       
    Fullname NVARCHAR(50),        
    Birthday DATE,                 
    Gender BIT,                    
    Mobile NVARCHAR(50),         
  
);

-- Tạo bảng News để lưu thông tin bài viết
CREATE TABLE News(
    Id NVARCHAR(50) PRIMARY KEY,   -- Khóa chính, mã bài viết
    title NVARCHAR(MAX),            -- Tiêu đề bài viết
    content NVARCHAR(MAX),          -- Nội dung bài viết
    Image NVARCHAR(MAX),            -- Đường dẫn hình ảnh bài viết
    PostedDate DATE,                -- Ngày đăng bài
    Author NVARCHAR(40),            -- Tác giả (mã phóng viên)
    ViewCount INT,                  -- Số lượt xem bài viết
    CategoryId NVARCHAR(50),        -- Mã loại tin (liên kết với bảng CATEGORIES)
    Home BIT,                       -- Trang Nhất (1 nếu xuất hiện trên trang chủ, 0 nếu không)
    FOREIGN KEY (Author) REFERENCES Users(Id),  -- Khóa ngoại liên kết với bảng Users
    FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id) -- Khóa ngoại liên kết với bảng CATEGORIES
);

-- Tạo bảng NEWSLETTERS để lưu thông tin đăng ký nhận bản tin
CREATE TABLE NEWSLETTERS(
    Email NVARCHAR(50) PRIMARY KEY, -- Địa chỉ email người đăng ký (khóa chính)
    Enabled BIT                     -- Trạng thái hiệu lực (1 nếu còn hiệu lực, 0 nếu không)
);


INSERT INTO CATEGORIES (Id, Name) VALUES
('C01', 'Sports'),
('C02', 'Technology'),
('C03', 'Health'),
('C04', 'Politics'),
('C05', 'Entertainment');

INSERT INTO Users (Id, Email, Password, Role, Fullname, Birthday, Gender, Mobile) VALUES
('U01', 'admin@example.com', 'admin123', 1, 'Admin User', '1980-01-01', 1, '0123456789'),
('U02', 'reporter1@example.com', 'reporter123', 0, 'Reporter One', '1990-05-15', 1, '0987654321'),
('U03', 'reporter2@example.com', 'reporter123', 0, 'Reporter Two', '1985-10-25', 0, '0765432198');

INSERT INTO News (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES
('N01', 'Exciting Sports Event', 'Details about the exciting sports event happening this weekend.', 'image1.jpg', '2024-10-01', 'U02', 150, 'C01', 1),
('N02', 'Tech Innovations', 'Latest innovations in technology that are changing the world.', 'image2.jpg', '2024-10-02', 'U03', 250, 'C02', 0),
('N03', 'Health Tips', 'Important health tips for a better lifestyle.', 'image3.jpg', '2024-10-03', 'U02', 300, 'C03', 0),
('N04', 'Political News', 'Latest updates on political events.', 'image4.jpg', '2024-10-04', 'U03', 400, 'C04', 1),
('N05', 'Entertainment News', 'What’s new in the world of entertainment.', 'image5.jpg', '2024-10-05', 'U02', 500, 'C05', 0);


INSERT INTO NEWSLETTERS (Email, Enabled) VALUES
('subscriber1@example.com', 1),
('subscriber2@example.com', 1),
('subscriber3@example.com', 0),
('subscriber4@example.com', 1);


DELETE FROM CATEGORIES

SELECT * from CATEGORIES
SELECT * FROM Users
INSERT INTO CATEGORIES(Id , Name) VALUES('C10', 'Tin Tức')

UPDATE  CATEGORIES 
set Name = 'TT'
WHERE Id  = 'C1'

UPDATE Users
SET  Email = ? , password = ? , Role = ? , Fullname = ?  , Birthday = ? , Gender = ? , Mobile = ?
WHERE Id = ?

INSERT INTO Users (Id, password, Fullname, Birthday, Gender, Mobile, Email, Role)


ALTER TABLE Users
ADD hinh VARCHAR(Max);

SELECT * from Users

SELECT * FROM Users WHERE Email='admin@example.com'