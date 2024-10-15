package Controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import model.News;
import Dao.Newsdao;

@WebServlet("/details")
public class Chitiet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy id từ URL
        String id = request.getParameter("id");

        // Kiểm tra nếu id hợp lệ
        if (id != null && !id.isEmpty()) {
            Newsdao newsDao = new Newsdao();
            News news = newsDao.selectById(id);  // Truy vấn bài viết từ cơ sở dữ liệu

            if (news != null) {
                // Gán bài viết vào request và chuyển đến trang chi tiết
                request.setAttribute("news", news);
                request.getRequestDispatcher("/views/details.jsp").forward(request, response);
            } else {
                // Nếu không tìm thấy bài viết, chuyển thông báo lỗi
                request.setAttribute("errorMessage", "Bài viết không tồn tại với ID: " + id);
                request.getRequestDispatcher("/views/details.jsp").forward(request, response);
            }
        } else {
            // Nếu id không hợp lệ
            request.setAttribute("errorMessage", "ID bài viết không hợp lệ.");
            request.getRequestDispatcher("/views/details.jsp").forward(request, response);
        }
    }
}
