<%@page import="com.oracle.wls.shaded.org.apache.bcel.generic.Select"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js"></script>
    <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
        }

        html {
            height: 100%;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)),
                        url('http://thecodeplayer.com/uploads/media/gs.png');
        }

        body {
            font-family: 'Montserrat', Arial, Verdana;
        }

        #msform {
            width: 500px;
            margin: 50px auto;
            text-align: center;
            position: relative;
        }

        #msform fieldset {
            background: white;
            border: none;
            border-radius: 3px;
            box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
            padding: 20px 30px;
            box-sizing: border-box;
            width: 85%;
            margin: auto;
            position: relative;
        }

        #msform fieldset:not(:first-of-type) {
            display: none;
        }


        #msform input, #msform textarea {
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
            font-family: 'Montserrat';
            color: #2C3E50;
            font-size: 13px;
            resize: vertical;
        }

  
        #msform .action-button {
            width: 100px;
            background: #27AE60;
            font-weight: bold;
            color: white;
            border: none;
            border-radius: 1px;
            cursor: pointer;
            padding: 10px 5px;
            margin: 10px 5px;
        }

        #msform .action-button:hover, #msform .action-button:focus {
            box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
        }

      
        .fs-title {
            font-size: 15px;
            text-transform: uppercase;
            color: #2C3E50;
            margin-bottom: 10px;
        }

        .fs-subtitle {
            font-weight: normal;
            font-size: 13px;
            color: #666;
            margin-bottom: 20px;
        }

      
        #progressbar {
            margin-bottom: 30px;
            overflow: hidden;
            counter-reset: step;
        }

        #progressbar li {
            list-style-type: none;
            color: white;
            text-transform: uppercase;
            font-size: 9px;
            width: 25%;
            float: left;
            position: relative;
        }

        #progressbar li:before {
            content: counter(step);
            counter-increment: step;
            width: 20px;
            line-height: 20px;
            display: block;
            font-size: 10px;
            color: #333;
            background: white;
            border-radius: 3px;
            margin: 0 auto 5px auto;
        }

        
        #progressbar li:after {
            content: '';
            width: 100%;
            height: 2px;
            background: white;
            position: absolute;
            left: -50%;
            top: 9px;
            z-index: -1; 
        }

        #progressbar li:first-child:after {
            content: none;
        }

        #progressbar li.active:before, #progressbar li.active:after {
            background: #27AE60;
            color: white;
        }

        
        .role {
            padding: 5px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 10px;
            box-sizing: border-box;
            font-family: 'Montserrat';
            color: #2C3E50;
            font-size: 13px;
        }

        .error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <%
        String baoLoi = request.getAttribute("baoLoi") != null ? request.getAttribute("baoLoi").toString() : "";
        String email = request.getAttribute("Email") != null ? request.getAttribute("Email").toString() : "";
        String role = request.getAttribute("Role") != null ? request.getAttribute("Role").toString() : "";
        String fullname = request.getAttribute("Fullname") != null ? request.getAttribute("Fullname").toString() : "";
        String birthday = request.getAttribute("Birthday") != null ? request.getAttribute("Birthday").toString() : "";
        String gender = request.getAttribute("Gender") != null ? request.getAttribute("Gender").toString() : "";
        String mobile = request.getAttribute("Mobile") != null ? request.getAttribute("Mobile").toString() : "";
        String hinh = request.getAttribute("hinh") != null ? request.getAttribute("hinh").toString() : "";
    %>
    
    <form action="http://localhost:8080/ASM_JAVA3_PD10267/views/dangky.jsp" id="msform" method="POST">
        <!-- Progress Bar -->
        <ul id="progressbar" style="margin-left: 90px;">
            <li class="active">Personal Information</li>
            <li>Documents & Proofs</li>
            <li>Video Validation</li>
        </ul>

        <fieldset>
            <h2 class="fs-title">Sign-in</h2>
            <h3 class="fs-subtitle">This is step 1</h3>
            <span id="password-error" class="error"><%= baoLoi %></span>
            <input type="email" name="email" placeholder="Email" required value="<%= email %>" />
            <input type="password" id="password" name="pass" placeholder="Password" required />
            <input type="password" id="confirm-password" name="cpass" placeholder="Confirm Password" required />
            <span id="password-error" class="error"></span>
            <select name="role" class="role" id="Role">
                <option value="1" <%=(role.equals("Quản Trị")) ? "selected" : "" %>>Quản Trị</option>
                <option value="0" <%=(role.equals("Admin")) ? "selected" : "" %>>Admin</option>
                <option value="2" <%=(role.equals("Khác")) ? "selected" : "" %>>Khác</option>
            </select>
            <input type="button" name="next" class="next action-button" value="Next" onclick="validatePassword()" />
        </fieldset>

        

        <fieldset>
            <h2 class="fs-title">Personal Details</h2>
            <h3 class="fs-subtitle">We will never sell it</h3>
            <input type="text" name="fullname" placeholder="Fullname" value="<%= fullname %>" />
            <input type="date" name="lname" value="<%= birthday %>" />
            <select id="gioitinh" name="gender" class="role">
                <option></option>
                <option value="Nam" <%=(gender.equals("Nam")) ? "selected" : "" %>>Nam</option>
                <option value="Nữ" <%=(gender.equals("Nữ")) ? "selected" : "" %>>Nữ</option>
                <option value="Khác" <%=(gender.equals("Khác")) ? "selected" : "" %>>Khác</option>
            </select>
            <input type="text" name="mobile" placeholder="Mobile" value="<%= mobile %>" />
            <input type="file" name="hinh" accept="image/*"  value = "<%=hinh %>" />
            <input type="submit" name="submit" class="action-button" value="Submit" />
        </fieldset>
    </form>

    <script>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm-password").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            } else {
                nextStep();
            }
        }

        function nextStep() {
            var current_fs = $("fieldset:visible");
            var next_fs = current_fs.next();

            // Activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
            // Show the next fieldset
            next_fs.show();
            // Hide the current fieldset
            current_fs.hide();
        }
    </script>
</body>
</html>
