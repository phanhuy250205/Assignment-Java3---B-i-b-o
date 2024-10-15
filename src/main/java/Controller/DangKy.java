package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Users;
import until.Email;
import Dao.usedao;
import java.sql.Date;
import java.io.File;
import java.io.IOException;
import java.util.Random;

@MultipartConfig
@WebServlet("/DangKy") // Servlet mapping to the URL
public class DangKy extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DangKy() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle the GET request to display the registration form
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/Login/dangky.jsp");
        dispatcher.forward(request, response);
    }
    
    final String SAVE_DIR = "uploads";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle the POST request for user registration

     

        // Get form parameters
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String role = request.getParameter("role");
        String fullname = request.getParameter("fullname");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");

        // Set user input back to request attributes for error handling
        request.setAttribute("email", email);
        request.setAttribute("role", role);
        request.setAttribute("fullname", fullname);
        request.setAttribute("birthday", birthday);
        request.setAttribute("gender", gender);
        request.setAttribute("mobile", mobile);

        

       

            // Nhận file upload
            Part filePart = request.getPart("image");
            String fileName = filePart.getSubmittedFileName();

            // Đường dẫn cho file
            String appPath = getServletContext().getRealPath("");
            String savePath = appPath + File.separator + SAVE_DIR;

            // Tạo thư mục nếu chưa tồn tại
            File dir1 = new File(savePath);
            if (!dir1.exists()) {
                dir1.mkdirs(); // Tạo thư mục
            }

            // Lưu file hình ảnh
            if (filePart != null && filePart.getSize() > 0) {
                filePart.write(savePath + File.separator + fileName); // Ghi file
            }

        // Default URL to return to the registration page
        String url = "/views/dangky.jsp"; 
        StringBuilder errorMessage = new StringBuilder();
        usedao userDao = new usedao();

        // Check if email already exists
        if (userDao.checkUsernameExists(email)) {
            request.setAttribute("baoLoi", "Email đã tồn tại, vui lòng nhập email khác.<br/>");
        }

        // Check password validity
        if (pass == null || pass.isEmpty() || !pass.equals(cpass)) {
            request.setAttribute("baoLoi", "Mật Khẩu Nhập Lại Không Hợp Lệ");
        }

        // Validate birthday
        java.sql.Date birthday1 = null;
        try {
            birthday1 = Date.valueOf(birthday); // Convert string to Date
        } catch (IllegalArgumentException e) {
            request.setAttribute("baoLoi", "Ngày Sinh Không Hợp lệ ");
        }

        // Check for errors in input
        if (errorMessage.length() > 0) {
            request.setAttribute("baoLoi", errorMessage.toString());
        } else {
            // No errors, proceed to create new user
            String id = String.valueOf(System.currentTimeMillis()) + "_" + new Random().nextInt(1000); // Unique ID
            boolean isAdmin = "1".equals(role); // Check if user is admin

            // Create new user object
            Users user = new Users(id, email, pass, isAdmin, fullname, birthday1, "Nữ".equals(gender), mobile, fileName);

            // Insert new user into database
            int result = userDao.insert(user);
            if (result > 0) {
                // Success, redirect to login page
                String title = "Chào mừng " + fullname + " bạn!";
                String content = "Chào Mừng bạn! Tôi là Admin của trang Web Báo số 1 Việt Nam. Chúng tôi rất vinh hạnh chào đón bạn đến với trang web của chúng tôi.";
                Email.sendEmail(email, title, content);
                response.sendRedirect(request.getContextPath() + "/views/Login/dangnhap.jsp");
                return;
            } else {
                request.setAttribute("baoLoi", "Đăng Nhập Không thành công, vui lòng thử lại sau ");
            }
        }

        // If there were errors, return to the registration page
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
