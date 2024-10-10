package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import Dao.NewsletterDAO;
import model.NEWSLETTERS;

@WebServlet("/NewsletterController")
public class Newsletter extends HttpServlet {  
    private static final long serialVersionUID = 1L;
    private NewsletterDAO newsletterDAO;

    @Override
    public void init() throws ServletException {
        newsletterDAO = new NewsletterDAO(); // Khởi tạo đối tượng DAO
    }

    /**
     * Xử lý các yêu cầu GET để lấy danh sách email và trạng thái
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<NEWSLETTERS> newsletters = newsletterDAO.getAllEmails();
        request.setAttribute("newsletters", newsletters);
        request.getRequestDispatcher("/views/Crub/newsletter_management.jsp").forward(request, response);
    }

    /**
     * Xử lý các yêu cầu POST cho các thao tác thêm, sửa, xóa
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("save".equals(action)) {
            saveNewsletter(request, response);
        } else if ("delete".equals(action)) {
            deleteNewsletter(request, response);
        }
    }

    /**
     * Xử lý thêm email hoặc cập nhật trạng thái Enabled
     */
    private void saveNewsletter(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        boolean enabled = request.getParameter("enabled") != null; // Kiểm tra nếu checkbox "enabled" được chọn

        NEWSLETTERS newsletter = new NEWSLETTERS(email, enabled);

        // Kiểm tra xem email đã tồn tại chưa, nếu có thì cập nhật trạng thái, nếu không thì thêm mới
        if (newsletterDAO.exists(email)) {
            // Cập nhật trạng thái của email nếu đã tồn tại
            newsletterDAO.updateEmailStatus(newsletter);
        } else {
            // Thêm email mới
            newsletterDAO.addEmail(newsletter);
        }

        response.setStatus(HttpServletResponse.SC_OK);
    }

    /**
     * Xử lý xóa email
     */
    private void deleteNewsletter(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        newsletterDAO.deleteEmail(email);
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
