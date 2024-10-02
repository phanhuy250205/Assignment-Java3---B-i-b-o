package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import Dao.usedao;

@WebServlet(urlPatterns = {"/DangKy"})
public class dangky extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public dangky() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy giá trị từ form
        String email = request.getParameter("Email");
        String password = request.getParameter("password");
        String matKhauNhapLai = request.getParameter("matKhauNhapLai");
        String role = request.getParameter("Role");
        String fullname = request.getParameter("Fullname");
        String birthdayStr = request.getParameter("Birthday");
        String genderStr = request.getParameter("gioitinh");
        String Mobile = request.getParameter("Mobile");
        String hinh = request.getParameter("hinh");
        
        System.out.println("Email: " + email);
        System.out.println("Password: " + password);
        System.out.println("Confirm Password: " + matKhauNhapLai);
        System.out.println("Role: " + role);
        System.out.println("Full Name: " + fullname);
        System.out.println("Birthday: " + birthdayStr);
        System.out.println("Gender: " + genderStr);
        System.out.println("Mobile: " + Mobile);
        System.out.println("Mobile: " + hinh);
        
        // Đưa thông tin vào request để sử dụng lại
        request.setAttribute("email", email);
        request.setAttribute("role", role);
        request.setAttribute("fullname", fullname);
        request.setAttribute("birthday", birthdayStr);
        request.setAttribute("gender", genderStr);
        request.setAttribute("phone", Mobile);
        request.setAttribute("phone", hinh);

        String url = "/views/dangky.jsp"; // Default URL
        String errorMessage = "";

        usedao userDao = new usedao();

        // Kiểm tra email đã tồn tại chưa
        if (userDao.checkUsernameExists(email)) {
            errorMessage += "Email đã tồn tại, vui lòng nhập email khác.<br/>";
        }

        // Kiểm tra mật khẩu và mật khẩu nhập lại
        if (password == null || password.isEmpty() || !password.equals(matKhauNhapLai)) {
            errorMessage += "Mật khẩu nhập lại không khớp hoặc không hợp lệ.<br/>";
        }

        // Kiểm tra ngày sinh
        Date birthday = null;
        try {
            birthday = Date.valueOf(birthdayStr);
        } catch (IllegalArgumentException e) {
            errorMessage += "Ngày sinh không hợp lệ.<br/>";
        }

        // Nếu có lỗi, quay lại trang đăng ký
        if (!errorMessage.isEmpty()) {
            request.setAttribute("errorMessage", errorMessage);
        } else {
            // Nếu không có lỗi, tiến hành đăng ký
            String id = String.valueOf(System.currentTimeMillis()) + "_" + new Random().nextInt(1000); // More robust ID
            Users user = new Users(id, email, password, true, fullname, birthday, true, Mobile, hinh); // Assuming 'hinh' is not used

            // Ghi vào database
            int result = userDao.insert(user);
            System.out.println("Thêm Thành Công");
            if (result > 0) {
                // Redirect to a success page or login page
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return; // Stop further processing
            } else {
                errorMessage += "Đăng ký không thành công, vui lòng thử lại.<br/>";
                request.setAttribute("errorMessage", errorMessage);
            }
        }

        // Chuyển hướng tới trang tương ứng
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
