package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;
import Dao.usedao;

import java.io.IOException;

/**
 * Servlet implementation class Doimatkhau
 */
@WebServlet("/doimatkhau") // Đảm bảo rằng URL tương ứng với url-pattern trong web.xml
public class Doimatkhau extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Doimatkhau() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String matkhaucu = request.getParameter("matkhaucu");
        String matkhaumoi = request.getParameter("matkhaumoi");
        String nhaplaimatkhau = request.getParameter("nhaplaimatkhau");

        System.out.println("Email: " + email);
        System.out.println("Mật khẩu cũ: " + matkhaucu);
        System.out.println("Mật khẩu mới: " + matkhaumoi);
        System.out.println("Nhập lại mật khẩu: " + nhaplaimatkhau);

        usedao dUsedao = new usedao();
        Users users = dUsedao.findByEmail(email);

        if (users != null) {
            System.out.println("Người dùng tìm thấy: " + users.getemail());
            if (users.getpassword().equals(matkhaucu)) {
                System.out.println("Mật khẩu cũ chính xác.");
                if (matkhaumoi.equals(nhaplaimatkhau)) {
                    System.out.println("Mật khẩu mới khớp.");
                    users.setpassword(matkhaumoi);
                    boolean result = dUsedao.changePassword(users);
                    if (result) {
                        System.out.println("Đổi mật khẩu thành công.");
                        // Đổi mật khẩu thành công, chuyển hướng đến trang đăng nhập
                        request.setAttribute("message", "Mật khẩu đã được thay đổi thành công.");
                        response.sendRedirect(request.getContextPath() + "/views/dangnhap.jsp");
                        return; // Kết thúc xử lý sau khi chuyển hướng
                    } else {
                        System.out.println("Đổi mật khẩu thất bại.");
                        request.setAttribute("error", "Không thể đổi mật khẩu. Vui lòng thử lại.");
                    }
                } else {
                    System.out.println("Mật khẩu mới và nhập lại không khớp.");
                    request.setAttribute("error", "Mật khẩu mới và xác nhận mật khẩu không khớp.");
                }
            } else {
                System.out.println("Mật khẩu cũ không chính xác.");
                request.setAttribute("error", "Mật khẩu cũ không chính xác.");
            }
        } else {
            System.out.println("Không tìm thấy người dùng với email: " + email);
            request.setAttribute("error", "Email không tồn tại.");
        }

        // Nếu có lỗi hoặc không thành công, chuyển lại trang đổi mật khẩu
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/Login/doimatkhau.jsp");
        rd.forward(request, response);
    }
}
