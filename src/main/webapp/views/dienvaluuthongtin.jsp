<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập Nhật Thông Tin Người Dùng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .wrapper {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            width: 100%;
        }
        .container {
            width: 60%;
            padding-right: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #555;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .form-group button {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .form-group button:hover {
            background-color: #218838;
        }
        /* Khung hiển thị ảnh */
        .image-preview {
            width: 35%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 10px;
            background-color: #fafafa;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }
        .image-preview img {
            max-width: 100%;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .image-preview label {
            margin-bottom: 10px;
            font-size: 14px;
            color: #333;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <div class="container">
        <h2>Cập Nhật Thông Tin Người Dùng</h2>
        <form id="userForm" action="your-server-endpoint" method="POST" enctype="multipart/form-data">
            <!-- ID người dùng -->
            <div class="form-group">
                <label for="id">Mã người dùng (ID):</label>
                <input type="text" id="id" name="id" required>
            </div>

            <!-- Họ và tên đầy đủ -->
            <div class="form-group">
                <label for="fullname">Họ và tên:</label>
                <input type="text" id="fullname" name="fullname" required>
            </div>

            <!-- Ngày sinh -->
            <div class="form-group">
                <label for="birthday">Ngày sinh:</label>
                <input type="date" id="birthday" name="birthday" required>
            </div>

            <!-- Giới tính -->
            <div class="form-group">
                <label for="gender">Giới tính:</label>
                <select id="gender" name="gender" required>
                    <option value="1">Nam</option>
                    <option value="0">Nữ</option>
                </select>
            </div>

            <!-- Số điện thoại -->
            <div class="form-group">
                <label for="mobile">Số điện thoại:</label>
                <input type="text" id="mobile" name="mobile" required>
            </div>

            <!-- Nút button -->
            

            <!-- Upload ảnh -->
            <div class="form-group">
                <label for="image-upload">Tải lên ảnh:</label>
                <input type="file" id="image-upload" name="image" accept="image/*" required>
            </div>
            <div class="form-group">
                <button type="button" id="submitBtn" onclick="location.href = 'index.html'">Cập Nhật Thông Tin</button>
            </div>
        </form>
    </div>

    <!-- Khung hiển thị ảnh -->
    <div class="image-preview" id="image-preview">
        <label for="image-preview">Ảnh của bạn:</label>
        <img id="image-display" src="#" alt="Image preview" style="display: none;">
    </div>
</div>

<script>
    // Hiển thị ảnh sau khi chọn
    const imageInput = document.getElementById('image-upload');
    const imageDisplay = document.getElementById('image-display');

    imageInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                imageDisplay.src = e.target.result;
                imageDisplay.style.display = 'block';  // Hiển thị ảnh sau khi chọn
            };
            reader.readAsDataURL(file);
        }
    });

    

    
</script>

</body>
</html>
    