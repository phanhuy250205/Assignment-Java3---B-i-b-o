
CREATE TABLE CATEGORIES(
    Id NVARCHAR(50) PRIMARY KEY,  -- Khóa chính, mã loại tin
    Name NVARCHAR(50)              -- Tên loại tin
);

-- Tạo bảng Users để lưu thông tin người dùng (quản trị viên và phóng viên)
CREATE TABLE Users(
    Id NVARCHAR(40) PRIMARY KEY,   -- Khóa chính, mã người dùng
    password NVARCHAR(50),         -- Mật khẩu của người dùng
    Fullname NVARCHAR(50),         -- Họ và tên đầy đủ
    Birthday DATE,                 -- Ngày sinh
    Gender BIT,                    -- Giới tính (1 cho nam, 0 cho nữ)
    Mobile NVARCHAR(50),           -- Số điện thoại di động
    Email NVARCHAR(50) UNIQUE,     -- Địa chỉ email (duy nhất)
    Role BIT                       -- Vai trò (1 cho quản trị viên, 0 cho phóng viên)
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
('C1', 'Tin Tức'),
('C2', 'Giải Trí'),

('C3', 'Thể Thao'),
('C4', 'Kinh Doanh');


INSERT INTO Users (Id, password, Fullname, Birthday, Gender, Mobile, Email, Role) VALUES
('U1', 'password123', 'Nguyễn Văn A', '1990-01-01', 1, '0912345678', 'vana@example.com', 0),
('U2', 'password456', 'Trần Thị B', '1985-05-05', 0, '0987654321', 'thib@example.com', 1),
('U3', 'password789', 'Lê Văn C', '1992-10-10', 1, '0923456789', 'vanc@example.com', 0);


INSERT INTO News (Id, title, content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES
('N1', 'Tin tức mới nhất', 'Nội dung tin tức mới nhất...', 'image1.jpg', '2024-09-21', 'U1', 100, 'C1', 1),
('N2', 'Sự kiện thể thao', 'Nội dung sự kiện thể thao...', 'image2.jpg', '2024-09-20', 'U1', 200, 'C3', 0),
('N3', 'Giải trí cuối tuần', 'Nội dung giải trí cuối tuần...', 'image3.jpg', '2024-09-19', 'U2', 150, 'C2', 1),
('N4', 'Cập nhật kinh doanh', 'Nội dung cập nhật kinh doanh...', 'image4.jpg', '2024-09-18', 'U3', 250, 'C4', 0);



INSERT INTO NEWSLETTERS (Email, Enabled) VALUES ('john.doe@example.com', 1);
INSERT INTO NEWSLETTERS (Email, Enabled) VALUES ('jane.smith@example.com', 1);

SELECT * from CATEGORIES