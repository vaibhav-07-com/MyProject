package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChairmanDao;
import model.Chairman;

/**
 * Servlet implementation class ChairmanController
 */
@WebServlet("/Chairman")
public class ChairmanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChairmanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("login")) {
			String email=request.getParameter("email");
			String pass=request.getParameter("password");
			boolean flag=ChairmanDao.checkEmail(email);
			if(flag) {
				Chairman c=ChairmanDao.loginChairman(email,pass);
				if(c!=null) {
					HttpSession session = request.getSession();
					session.setAttribute("data", c);
					request.getRequestDispatcher("Chairman-Home.jsp").forward(request, response);
				}else {
					request.setAttribute("msg", "Invalid credentials");
					request.getRequestDispatcher("chairman-login.jsp").forward(request, response);
				}
			}else {
				request.setAttribute("msg", "Email Not exist");
				request.getRequestDispatcher("chairman-login.jsp").forward(request, response);
			}
		}
	}

}
