package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;
import until.Email;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import Dao.usedao;

@MultipartConfig
@WebServlet("/DangKy") // Đảm bảo servlet được ánh xạ đúng URL
public class DangKy extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DangKy() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form đăng ký
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String role = request.getParameter("role");
        String fullname = request.getParameter("fullname");
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");

        // Hiển thị thông tin để kiểm tra
        System.out.println("Email: " + email);
        System.out.println("Mật khẩu: " + pass);
        System.out.println("Vai trò: " + role);
        System.out.println("Họ và tên: " + fullname);
        System.out.println("Ngày sinh: " + birthday);
        System.out.println("Giới tính: " + gender);
        System.out.println("Số điện thoại: " + mobile);

        // Lưu các thông tin người dùng nhập vào request để sử dụng lại nếu có lỗi
        request.setAttribute("email", email);
        request.setAttribute("role", role);
        request.setAttribute("fullname", fullname);
        request.setAttribute("birthday", birthday);
        request.setAttribute("gender", gender);
        request.setAttribute("phone", mobile);

        String url = "/views/dangky.jsp"; // URL mặc định quay lại trang đăng ký
        StringBuilder errorMessage = new StringBuilder();
        usedao userDao = new usedao();

        // Kiểm tra email đã tồn tại
        if (userDao.checkUsernameExists(email)) {
//            errorMessage.append("Email đã tồn tại, vui lòng nhập email khác.<br/>");
            request.setAttribute("baoLoi", "Email đã tồn tại, vui lòng nhập email khác.<br/>");
        }

        // Kiểm tra mật khẩu
        if (pass == null || pass.isEmpty() || !pass.equals(cpass)) {
//            request.setAttribute("baoLoi", "Mật Khẩu Nhập Lại Không Hợp Lệ");
        }

        // Kiểm tra ngày sinh
        Date birthday1 = null;
        try {
            birthday1 = Date.valueOf(birthday); // Chuyển đổi chuỗi ngày sinh sang kiểu Date
        } catch (IllegalArgumentException e) {
//        	request.setAttribute("baoLoi", "Ngày Sinh Không Hợp lệ ");
        }

        // Kiểm tra các lỗi nhập liệu
        if (errorMessage.length() > 0) {
        	request.setAttribute("baoLoi", "Bạn Không Được Để Trống");
        } else {
            // Không có lỗi, tiến hành tạo người dùng mới
            String id = String.valueOf(System.currentTimeMillis()) + "_" + new Random().nextInt(1000); // Tạo ID duy nhất
            boolean isAdmin = "1".equals(role); // Vai trò admin hoặc nhân viên

            // Tạo đối tượng người dùng mới
            Users user = new Users(id, email, pass, isAdmin, fullname, birthday1, "Nữ".equals(gender), mobile, null); // Không gán hình ảnh

            // Ghi người dùng vào cơ sở dữ liệu
            int result = userDao.insert(user);
            if (result > 0) {
                // Nếu thành công, chuyển hướng tới trang đăng nhập
            	String tieuDe =  "Chào mừng"+fullname+" bạn!\n\n" +
                        "Tôi là Admin của trang web Báo số 1 Việt Nam. Chúng tôi rất vinh hạnh chào đón bạn đến với trang web của chúng tôi.\n\n" +
                        "Tại đây, bạn sẽ tìm thấy những thông tin cập nhật và tin tức mới nhất về nhiều lĩnh vực khác nhau. Chúng tôi cam kết cung cấp cho bạn những nội dung chất lượng và hữu ích nhất.\n\n" +
                        "Nếu bạn có bất kỳ câu hỏi nào hoặc cần hỗ trợ, đừng ngần ngại liên hệ với chúng tôi.\n\n" +
                        "Chúc bạn có trải nghiệm tuyệt vời tại trang web của chúng tôi!\n\n" +
                        "Trân trọng,\n" +
                        "Đội ngũ Admin"; 
            	 String noiDung = "Chào Mừng bạn! Tôi là Admin của trang Web Báo số 1 Việt Nam. Chúng tôi rất vinh hạnh chào đón bạn đến với trang web của chúng tôi.";
            	 Email.sendEmail(email, tieuDe, noiDung);
                response.sendRedirect(request.getContextPath() + "/views/dangnhap.jsp");
                return;
            } else {
//            	request.setAttribute("baoLoi", "Đăng Nhập Không thành công vui lòng thử lại sau ");
                request.setAttribute("errorMessage", errorMessage.toString());
            }
        }
        
        

        // Nếu có lỗi, hoặc đăng ký thất bại, quay lại trang đăng ký
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Xử lý POST như GET
    }
}
