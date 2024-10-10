package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Users;

import java.io.IOException;
import java.util.List;

import Dao.usedao;

/**
 * Servlet implementation class Usermanger
 */
public class Usermanger extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private usedao userDao = new usedao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Usermanger() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Users> userList = userDao.selectAll(); // This method needs to be implemented in the UserDao to fetch users
        request.setAttribute("userList", userList);

        // Forward to JSP page
        request.getRequestDispatcher("/views/Crub/user_management.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
