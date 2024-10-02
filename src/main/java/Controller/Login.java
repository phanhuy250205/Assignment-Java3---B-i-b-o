package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;
import Dao.usedao;

import java.io.IOException;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("tenDangNhap");
        String password = request.getParameter("matKhau");

        // Tạo đối tượng người dùng để xác thực
        Users user = new Users();
        user.setEmail(email);
        user.setPassword(password);

        usedao userDao = new usedao();
        // Kiểm tra người dùng và xác thực
        Users authenticatedUser = userDao.selectByEmailAndPassword(user);

        String url;
        if (authenticatedUser != null) {
            // Người dùng đã xác thực
            HttpSession session = request.getSession();
            session.setAttribute("khachHang", authenticatedUser); // Lưu đối tượng người dùng vào session
            System.out.println("Đăng nhập thành công cho: " + authenticatedUser.getEmail()); // In ra email đã đăng nhập
            url = "/views/index.jsp"; // Chuyển hướng đến trang index
        } else {
            // Xác thực không thành công
            request.setAttribute("baoLoi", "Tên đăng nhập hoặc mật khẩu không đúng!");
            url = "/views/dangnhap.jsp"; // Chuyển hướng về trang đăng nhập
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
