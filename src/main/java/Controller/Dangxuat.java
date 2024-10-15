package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.News;

import java.io.IOException;
import java.util.ArrayList;

import Dao.Newsdao;

@WebServlet(urlPatterns = {"/out"})
public class Dangxuat extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Dangxuat() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ArrayList<News> newsList = new ArrayList<>();
		// Khởi tạo đối tượng DAO nếu chưa có
    	Newsdao newsDAO = new Newsdao();
		// Đăng xuất người dùng và hủy session (chỉ xóa dữ liệu người dùng)
		HttpSession session = request.getSession();
		session.invalidate(); // Xóa toàn bộ session liên quan đến người dùng
		// Truy vấn lại dữ liệu không liên quan đến người dùng (ví dụ danh sách tin tức)
		ArrayList<News> newsListt = newsDAO.selectAll();
		
		// Lưu dữ liệu vào request để chuyển tiếp đến trang chính
		request.setAttribute("newsList", newsListt);
		
		// Chuyển hướng người dùng về trang chính sau khi đăng xuất
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/index.jsp");
		dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}


