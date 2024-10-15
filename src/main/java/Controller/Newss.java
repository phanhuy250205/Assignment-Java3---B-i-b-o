package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.News;
import Dao.Newsdao;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(urlPatterns = {"/news/edit", "/news/insert", "/news/update", "/news/delete", "/news/list"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10MB
        maxFileSize = 1024 * 1024 * 50,       // 50MB
        maxRequestSize = 1024 * 1024 * 100)   // 100MB
public class Newss extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Newsdao newsdao;
    private static final Logger logger = Logger.getLogger(Newss.class.getName());

    public Newss() {
        super();
    }

    @Override
    public void init() throws ServletException {
        newsdao = new Newsdao();
        logger.info("Servlet Initialized - Newsdao created.");

        // Đăng ký DateConverter để chuyển đổi chuỗi thành Date
        DateConverter dateConverter = new DateConverter();
        dateConverter.setPattern("yyyy-MM-dd"); // Định dạng ngày trong form
        ConvertUtils.register(dateConverter, java.util.Date.class);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        logger.info("GET request at path: " + path);

        try {
            if (path.equals("/news/edit")) {
                handleEditRequest(request, response);
            } else if (path.equals("/news/delete")) {
                handleDeleteRequest(request, response);
                return; // Dừng xử lý sau khi xóa
            }
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during GET request processing", e);
            request.setAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
        }

        if (!response.isCommitted()) {
            forwardToManagePage(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletPath();
        News form = new News();
        logger.info("POST request at path: " + path);

        try {
            if (path.equals("/news/delete")) {
                handleDeleteRequest(request, response);
                return; // Dừng xử lý sau khi xóa
            }

            // Populate dữ liệu từ form vào đối tượng News
            BeanUtils.populate(form, request.getParameterMap());
            logger.info("Form data populated: " + form.toString());

            // Xử lý tải lên tệp (image)
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = extractFileName(filePart);
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir(); // Tạo thư mục nếu chưa tồn tại

                filePart.write(uploadPath + File.separator + fileName);
                form.setImage(fileName); // Gán tên tệp vào đối tượng News
            }

            if (path.equals("/news/insert")) {
                // Tạo ID duy nhất tự động
                String generatedId = UUID.randomUUID().toString();
                form.setId(generatedId);

                logger.info("Inserting new news with ID: " + generatedId);
                newsdao.insert(form);
                request.getSession().setAttribute("successMessage", "Thêm mới thành công!");

            } else if (path.equals("/news/update")) {
                String id = request.getParameter("id");
                if (id != null && !id.isEmpty()) {
                    form.setId(id);
                    newsdao.update(form);
                    request.getSession().setAttribute("successMessage", "Cập nhật thành công!");
                } else {
                    request.setAttribute("errorMessage", "ID không hợp lệ để cập nhật.");
                    logger.warning("Update failed - Invalid ID");
                }
            }

            response.sendRedirect(request.getContextPath() + "/news/list");
            return; // Dừng lại sau khi redirect
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error during POST request processing", e);
            request.setAttribute("errorMessage", "Có lỗi xảy ra trong quá trình xử lý: " + e.getMessage());
            if (!response.isCommitted()) {
                forwardToManagePage(request, response);
            }
        }
    }

    private void handleEditRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.trim().isEmpty()) {
            News news = newsdao.selectById(id);
            if (news != null) {
                request.setAttribute("news", news);
                logger.info("Editing news with ID: " + id);
            } else {
                request.setAttribute("errorMessage", "Không tìm thấy tin tức với ID: " + id);
                logger.warning("News not found with ID: " + id);
            }
        } else {
            request.setAttribute("errorMessage", "ID không hợp lệ.");
            logger.warning("Invalid ID for editing news.");
        }

        if (!response.isCommitted()) {
            forwardToManagePage(request, response);
        }
    }

    private void handleDeleteRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null && !id.trim().isEmpty()) {
            try {
                int deleteCount = newsdao.delete(id);
                if (deleteCount > 0) {
                    request.getSession().setAttribute("successMessage", "Xóa thành công!");
                    logger.info("Deleted news with ID: " + id);
                } else {
                    request.setAttribute("errorMessage", "Không tìm thấy tin tức với ID: " + id);
                    logger.warning("Delete failed - News not found for ID: " + id);
                }
            } catch (Exception e) {
                request.setAttribute("errorMessage", "Lỗi khi xóa: " + e.getMessage());
                logger.log(Level.SEVERE, "Error during delete operation", e);
            }
        } else {
            request.setAttribute("errorMessage", "ID không hợp lệ để xóa.");
            logger.warning("Delete failed - Invalid ID");
        }

        response.sendRedirect(request.getContextPath() + "/news/list");
        return;
    }

    private void forwardToManagePage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<News> newsList = newsdao.selectAll();
        request.setAttribute("newsList", newsList);
        logger.info("Forwarding to manage page with newsList size: " + newsList.size());
        if (!response.isCommitted()) {
            request.getRequestDispatcher("/views/Crub/CURDMANGER.jsp").forward(request, response);
        }
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String cd : contentDisposition.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

}
