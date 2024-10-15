<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu</title>
    <link rel="stylesheet" href="./assets/css/doimatkhau.css">
</head>
<style>
.mainDiv {
    display: flex;
    min-height: 100%;
    align-items: center;
    justify-content: center;
    background-color: #f9f9f9;
    font-family: 'Open Sans', sans-serif;
  }
 .cardStyle {
    width: 500px;
    border-color: white;
    background: #fff;
    padding: 36px 0;
    border-radius: 4px;
    margin: 30px 0;
    box-shadow: 0px 0 2px 0 rgba(0,0,0,0.25);
  }
#signupLogo {
  max-height: 100px;
  margin: auto;
  display: flex;
  flex-direction: column;
}
.formTitle{
  font-weight: 600;
  margin-top: 20px;
  color: #2F2D3B;
  text-align: center;
}
.inputLabel {
  font-size: 12px;
  color: #555;
  margin-bottom: 6px;
  margin-top: 24px;
}
  .inputDiv {
    width: 70%;
    display: flex;
    flex-direction: column;
    margin: auto;
  }
input {
  height: 40px;
  font-size: 16px;
  border-radius: 4px;
  border: none;
  border: solid 1px #ccc;
  padding: 0 11px;
}
input:disabled {
  cursor: not-allowed;
  border: solid 1px #eee;
}
.buttonWrapper {
  margin-top: 40px;
}
  .submitButton {
    width: 70%;
    height: 40px;
    margin: auto;
    display: block;
    color: #fff;
    background-color: #065492;
    border-color: #065492;
    text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
    box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
  }
.submitButton:disabled,
button[disabled] {
  border: 1px solid #cccccc;
  background-color: #cccccc;
  color: #666666;
}

#loader {
  position: absolute;
  z-index: 1;
  margin: -2px 0 0 10px;
  border: 4px solid #f3f3f3;
  border-radius: 50%;
  border-top: 4px solid #666666;
  width: 14px;
  height: 14px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}
</style>
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
