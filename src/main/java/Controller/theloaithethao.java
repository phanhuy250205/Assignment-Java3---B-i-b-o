package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.News;
import Dao.Newsdao;

import java.io.IOException;
import java.util.List;



public class theloaithethao extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Newsdao newsdao;

    // Khởi tạo đối tượng Newsdao
    public theloaithethao() {
        this.newsdao = new Newsdao();
    }

    // Phương thức xử lý GET request
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = "C01";  // ID của danh mục

        // Lấy danh sách bài viết từ DAO dựa theo danh mục
        List<News> cultureNews = newsdao.selectByCategory(categoryId);

        // Kiểm tra xem danh sách có trống hay không và ghi log
        if (cultureNews != null && !cultureNews.isEmpty()) {
            System.out.println("Số lượng bài viết trong danh mục 'Văn Hóa': " + cultureNews.size());
        } else {
            System.out.println("Không có bài viết nào trong danh mục 'Văn Hóa'");
        }

        // Đặt danh sách bài viết vào request attribute
        request.setAttribute("cultureNews", cultureNews);

        // Chuyển tiếp request tới JSP để hiển thị dữ liệu
        request.getRequestDispatcher("/views/TheLoai/loai-the-thao.jsp").forward(request, response);
    }

    // Phương thức xử lý POST request
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Gọi lại doGet để xử lý POST request như GET request
        doGet(request, response);
    }
}

