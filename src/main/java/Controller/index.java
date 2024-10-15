package Controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import Dao.Newsdao;
import model.News;

@WebServlet(urlPatterns = {"/home"})
public class index extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Newsdao newsdao = new Newsdao();

    public index() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext application = request.getServletContext();

        // Lấy danh sách tất cả tin tức để hiển thị trên trang chính
        ArrayList<News> newsList = (ArrayList<News>) application.getAttribute("newsList");
        if (newsList == null) {
            newsList = Newsdao.selectAll();
            ArrayList<News> filteredNewsList = new ArrayList<>();
            for (News news : newsList) {
                if (news.isHome()) {
                    filteredNewsList.add(news);
                }
            }
            int limit = 10;
            if (filteredNewsList.size() > limit) {
                filteredNewsList = new ArrayList<>(filteredNewsList.subList(0, limit));
            }
            application.setAttribute("newsList", filteredNewsList);
        }

        // Lấy tin tức mới nhất (5 bản tin)
     // Lấy tin tức mới nhất (5 bản tin)
        List<News> latestNews = newsdao.getLatestNews();
        HttpSession session = request.getSession();
        session.setAttribute("latestNews", latestNews);

        // Lấy tin tức có nhiều lượt xem nhất (5 bản tin)
        List<News> topViewedNews = newsdao.getTopViewedNews();
        session.setAttribute("topViewedNews", topViewedNews);


        // Chuyển tiếp request và response tới trang JSP
        request.getRequestDispatcher("/views/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
