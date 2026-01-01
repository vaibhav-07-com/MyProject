package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.securityDao;
import model.security;
import model.visitor;

/**
 * Servlet implementation class SecurityController
 */
@MultipartConfig
@WebServlet("/security")
public class SecurityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SecurityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		System.out.println("action got here in get method action is: " +action);
	   if(action.equalsIgnoreCase("viewVisitor")) {
			List<visitor> visitorList = new ArrayList<>();
			System.out.println(visitorList.toString());
			visitorList = securityDao.getVisitors();
			
			request.setAttribute("visitorList", visitorList);
			
		    request.getRequestDispatcher("Visitor-Approve.jsp").forward(request, response);
		}
	}
	
	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		System.out.println(cd);
		String[] items = cd.split(";");
		for (String string : items) {
			if (string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("login")){
			String email=request.getParameter("email");
			String pass=request.getParameter("password");
			security s=securityDao.securityLogin(email,pass);
			if (s != null) {
				HttpSession session = request.getSession();
				session.setAttribute("data", s);
				request.getRequestDispatcher("security-Home.jsp").forward(request, response);
				return;
			} else {
				 request.setAttribute("msg", "Invalid credentials or account not approved yet.");
				request.getRequestDispatcher("Security-Login.jsp").forward(request, response);
				return;
			}
		}
		else if (action.equalsIgnoreCase("Send OTP")) {
			String email = request.getParameter("email");	
			boolean flag =securityDao.checkEmail(email);
			Random r = new Random();
			int num = r.nextInt(100000, 999999);
			System.out.println(num);
			
			try {
				if(flag==true) {
				System.out.println("inside try blcok and flag value is "+flag);
				request.setAttribute("otp", num);
				request.setAttribute("email", email);
				request.getRequestDispatcher("Security-Verify-OTP.jsp").forward(request, response);
				return;
				}else {
					request.setAttribute("msg", "No such email exist! Enter valid email");
					request.getRequestDispatcher("Security-forgot-password.jsp").forward(request, response);
					return;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (action.equalsIgnoreCase("verify")) {
			String email = request.getParameter("email");
			int otp1 = Integer.parseInt(request.getParameter("OTP1"));
			int otp2 = Integer.parseInt(request.getParameter("OTP2"));
			if (otp1 == otp2) {
				request.setAttribute("email", email);
				request.getRequestDispatcher("Security-New-Pass.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "OTP not matched");
				request.setAttribute("otp", otp1);
				request.setAttribute("email", email);
				request.getRequestDispatcher("Security-Verify-OTP.jsp").forward(request, response);
			}
		}
		else if (action.equalsIgnoreCase("NewPassword")) {
			String email = request.getParameter("email");
			String newpss = request.getParameter("NewPass");
			String cnewpass = request.getParameter("CNewPass");
			if (newpss.equals(cnewpass)) {
				securityDao.updatePass(email, newpss);
				response.sendRedirect("Security-Login.jsp");
			} else {
				request.setAttribute("msg", "New and Confirm New Password not matched");
				request.getRequestDispatcher("Security-forgot-password.jsp").forward(request, response);
			}
		}
		if(action.equalsIgnoreCase("AddVisitor")) {
			String savePath = "C:\\Users\\Admin\\eclipse-workspace\\SocietyManagment\\src\\main\\webapp\\images";
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("visitor_photo");
			String fileName = extractfilename(file1);
			file1.write(savePath + File.separator + fileName);
			String filePath = savePath + File.separator + fileName;

			String savePath2 = "C:\\Users\\Admin\\eclipse-workspace\\SocietyManagment\\src\\main\\webapp\\images";
			File imgSaveDir = new File(savePath2);
			if (!imgSaveDir.exists()) {
				imgSaveDir.mkdir();
			}
			visitor v=new visitor();
			v.setVname(request.getParameter("visitor_name"));
			v.setMemeberName(request.getParameter("member_name"));
			v.setContact(Long.parseLong(request.getParameter("contact_no")));
			v.setFlatNo(Integer.parseInt(request.getParameter("flat_no")));
			v.setBlock(request.getParameter("block"));
			v.setInTime(request.getParameter("in_time"));
			v.setSid(Integer.parseInt(request.getParameter("security_id")));
			v.setPhoto(fileName);
			
			
			securityDao.addVisitor(v);
			response.sendRedirect("visitor.jsp");
			}else {
				request.setAttribute("msg", "Something went Wrong try after SomeTime");
				request.getRequestDispatcher("visitor.jsp").forward(request, response);
			}
		}

	}

