package Controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import Dao.usedao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

@WebServlet("/CapNhatthongtinn")
public class CapNhatthongtin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CapNhatthongtin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");
        String birthday = request.getParameter("birthday"); // Có thể null hoặc rỗng
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");

        System.out.println("Email: " + email);
        System.out.println("Họ và tên: " + fullname);
        System.out.println("Ngày sinh: " + birthday);
        System.out.println("Giới tính: " + gender);
        System.out.println("Số điện thoại: " + mobile);

        request.setAttribute("email", email);
        request.setAttribute("fullname", fullname);
        request.setAttribute("birthday", birthday);
        request.setAttribute("gender", gender);
        request.setAttribute("mobile", mobile);

        String url = "";
        String baoLoi = "";
        usedao usedao = new usedao();
        request.setAttribute("baoLoi", baoLoi);

        Object obj = request.getSession().getAttribute("khachHang");
        Users users = null;
        if (obj != null) users = (Users) obj;

        if (users != null) {
            String Id = users.getId();
            Date sqlDate = null;

            // Kiểm tra chuỗi ngày sinh có hợp lệ không
            if (birthday != null && !birthday.trim().isEmpty()) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date utilDate = sdf.parse(birthday); // Chuyển đổi chuỗi về util.Date
                    sqlDate = new Date(utilDate.getTime()); // Chuyển đổi sang sql.Date
                } catch (ParseException e) {
                    e.printStackTrace();
                    baoLoi = "Ngày sinh không hợp lệ!";
                }
            } else {
                // Nếu birthday là null hoặc rỗng, có thể giữ nguyên birthday của người dùng
                sqlDate = (Date) users.getbirthday(); // Lấy ngày sinh hiện tại
            }

            // Nếu sqlDate không null (tức là có giá trị hợp lệ)
            if (sqlDate != null) {
                Users us = new Users(Id, email, users.getpassword(), users.isRole(), fullname, sqlDate, users.isgender(), mobile, Id);
                usedao.updateInfo(us);
                Users us2 = usedao.selectById(users);
                request.getSession().setAttribute("khachHang", us2);
                url = "/views/index.jsp";
            } else {
                request.setAttribute("baoLoi", baoLoi);
                url = "/views/Capnhapthonghtin.jsp";
            }
        } else {
            url = "/views/Capnhapthonghtin.jsp"; // Nếu không tìm thấy người dùng
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
