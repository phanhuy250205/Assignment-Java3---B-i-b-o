<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu</title>
    <link rel="stylesheet" href="./assets/css/doimatkhau.css">
</head>
<body>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
    <div class="mainDiv">
        <div class="cardStyle">
          <!-- Form đổi mật khẩu -->
          <form action=<%=url%>/matkhau method="post" name="signupForm" id="signupForm">
            
            <h2 class="formTitle">Đổi mật khẩu</h2>
            
            <!-- Hiển thị thông báo lỗi hoặc thành công -->
            <div>
                <% String error = (String) request.getAttribute("error"); %>
                <% String message = (String) request.getAttribute("message"); %>
                
                <!-- Nếu có thông báo lỗi thì hiển thị -->
                <% if (error != null) { %>
                    <div style="color: red;"><%= error %></div>
                <% } %>
                
                <!-- Nếu có thông báo thành công thì hiển thị -->
                <% if (message != null) { %>
                    <div style="color: green;"><%= message %></div>
                <% } %>
            </div>

            <!-- Các trường nhập thông tin -->
            <div class="inputDiv">
                <label class="inputLabel" for="email">Gmail Của Bạn</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="inputDiv">
                <label class="inputLabel" for="matkhaucu">Mật Khẩu Cũ Của Bạn</label>
                <input type="password" id="matkhaucu" name="matkhaucu" required>
            </div>
            
            <div class="inputDiv">
                <label class="inputLabel" for="matkhaumoi">Mật Khẩu Mới Của Bạn</label>
                <input type="password" id="matkhaumoi" name="matkhaumoi" required>
            </div>
            
            <div class="inputDiv">
                <label class="inputLabel" for="nhaplaimatkhau">Nhập Lại Mật Khẩu</label>
                <input type="password" id="nhaplaimatkhau" name="nhaplaimatkhau" required>
            </div>
            
            <div class="buttonWrapper">
                <button type="submit" class="submitButton pure-button pure-button-primary">
                    Tiếp tục  
                </button>
            </div>
            
          </form>
        </div>
      </div>
      <script>
    document.getElementById("signupForm").addEventListener("submit", function(event) {
        var matkhaumoi = document.getElementById("matkhaumoi").value;
        var nhaplaimatkhau = document.getElementById("nhaplaimatkhau").value;

        if (matkhaumoi !== nhaplaimatkhau) {
            alert("Mật khẩu mới và xác nhận mật khẩu không khớp.");
            event.preventDefault(); // Ngăn không cho gửi biểu mẫu
        }
    });
</script>
</body>
</html>
