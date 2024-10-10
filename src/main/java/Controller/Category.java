package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CATEGORIES;
import Dao.CATEGORIESDao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet("/categories")
public class Category extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CATEGORIESDao categoryDao = new CATEGORIESDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteCategory(request, response);
                break;
            default:
                listCategories(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "insert":
                insertCategory(request, response);
                break;
            case "update":
                updateCategory(request, response);
                break;
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<CATEGORIES> categoriesList = categoryDao.selectAll();
        request.setAttribute("categoriesList", categoriesList);
        request.getRequestDispatcher("/views/manage_categories.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/manage_categories.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        CATEGORIES category = categoryDao.selectById(id);
        request.setAttribute("category", category);
        request.getRequestDispatcher("/views/manage_categories.jsp").forward(request, response);
    }

    private void deleteCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        categoryDao.delete(new CATEGORIES(id, ""));
        response.sendRedirect(request.getContextPath() + "/categories?action=list");
    }

    private void updateCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        categoryDao.update(new CATEGORIES(id, name));
        response.sendRedirect(request.getContextPath() + "/categories?action=list");
    }

    private void insertCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy ID và tên loại tin từ form nhập liệu
        String id = request.getParameter("id");
        String name = request.getParameter("name");

        // Kiểm tra xem ID đã tồn tại hay chưa để tránh trùng lặp
        CATEGORIES existingCategory = categoryDao.selectById(id);
        if (existingCategory != null) {
            request.setAttribute("errorMessage", "ID đã tồn tại, vui lòng nhập ID khác.");
            request.getRequestDispatcher("/views/manage_categories.jsp").forward(request, response);
        } else {
            // Thực hiện thêm mới loại tin nếu ID chưa tồn tại
            CATEGORIES category = new CATEGORIES(id, name);
            categoryDao.insert(category);
            response.sendRedirect(request.getContextPath() + "/categories?action=list");
        }
    }

}
