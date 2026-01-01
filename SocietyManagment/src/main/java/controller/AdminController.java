package controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDao;
import model.complaint;
import model.event;
import model.maintenance;
import model.member;
import model.security;
import model.visitor;


/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		if(action.equalsIgnoreCase("viewAllMember")) {
			List<member> list =AdminDao.getAllMember();
			request.setAttribute("members", list);
			request.getRequestDispatcher("admin-allMember.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("viewAllEvents")) {
			List<event> list =AdminDao.getAllEvents();
			request.setAttribute("event", list);
			request.getRequestDispatcher("admin-ViewEventBook.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("viewAllComplaints")) {
			List<complaint> list =AdminDao.getAllComplaints();
			request.setAttribute("complaint", list);
			request.getRequestDispatcher("admin-ViewComplaint.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("viewAllVisitors")) {
			List<visitor> list =AdminDao.getAllVisitors();
			request.setAttribute("Visitors", list);
			request.getRequestDispatcher("admin-ViewVisitor.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("viewAllSecurity")) {
			List<security> list =AdminDao.getAllSecurity();
			request.setAttribute("Security", list);
			request.getRequestDispatcher("admin-ViewSecurity.jsp").forward(request, response);
			
		}
		else if(action.equalsIgnoreCase("viewAllMaintenance")) {
			List<maintenance> list =AdminDao.viewAllMaintenance();
			request.setAttribute("maintenance", list);
			request.getRequestDispatcher("admin-ViewMaintenance.jsp").forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		System.out.println("your action is : "+action );
		if(action.equalsIgnoreCase("login")){
			String username=request.getParameter("username");
			String pass=request.getParameter("password");
			boolean flag= AdminDao.adminLogin(username, pass);
			if(flag==true) {
				HttpSession session=request.getSession();
				 	int totalMembers = AdminDao.getTotalMembers();
			        int totalEvents = AdminDao.getTotalEventBookings();
			        int totalComplaints = AdminDao.getTotalComplaints();
			        int totalVisitors = AdminDao.getTotalVisitors();
			        
			        session.setAttribute("totalMembers", totalMembers);
			        session.setAttribute("totalEvents", totalEvents);
			        session.setAttribute("totalComplaints", totalComplaints);
			        session.setAttribute("totalVisitors", totalVisitors);
				request.getRequestDispatcher("admin-index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Wrong Email And Password!");
				request.getRequestDispatcher("admin-login.jsp").forward(request, response);
			}
		}
		if(action.equalsIgnoreCase("approveMember")) {
		    int memberId = Integer.parseInt(request.getParameter("member_id"));
		    boolean flag = AdminDao.approveMember(memberId);
		    if(flag) {
		        request.setAttribute("msg", "Member approved successfully!");
		    } else {
		        request.setAttribute("msg", "Failed to approve member.");
		    }
		    List<member> list = AdminDao.getAllMember();
		    request.setAttribute("members", list);
		    request.getRequestDispatcher("admin-allMember.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("rejectMember")) {
		    int memberId = Integer.parseInt(request.getParameter("member_id"));
		    boolean flag = AdminDao.rejectMember(memberId);
		    if(flag) {
		        request.setAttribute("msg", "Member rejected successfully!");
		    } else {
		        request.setAttribute("msg", "Failed to reject member.");
		    }
		    List<member> list = AdminDao.getAllMember();
		    request.setAttribute("members", list);
		    request.getRequestDispatcher("admin-allMember.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("approveEvent")) {
			int eventId=Integer.parseInt(request.getParameter("event_id"));
			boolean flag = AdminDao.approveEvent(eventId);
		    if(flag) {
		        request.setAttribute("msg", "event approved successfully!");
		    } else {
		        request.setAttribute("msg", "Failed to approved event.");
		    }
		    List<event> list = AdminDao.getAllEvents();
		    request.setAttribute("event", list);
		    request.getRequestDispatcher("admin-ViewEventBook.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("rejectEvent")) {
			int eventId=Integer.parseInt(request.getParameter("event_id"));
		    boolean flag = AdminDao.rejectEvent(eventId);
		    if(flag) {
		        request.setAttribute("msg", "Event rejected successfully!");
		    } else {
		        request.setAttribute("msg", "Failed to reject Event.");
		    }
		    List<event> list = AdminDao.getAllEvents();
		    request.setAttribute("event", list);
		    request.getRequestDispatcher("admin-ViewEventBook.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("resolveComplaint")) {
			int complaintId=Integer.parseInt(request.getParameter("complaint_id"));
		    boolean flag = AdminDao.resolveComplaint(complaintId);
		    if(flag) {
		        request.setAttribute("msg", "Complaint resolve successfully!");
		    } else {
		        request.setAttribute("msg", "Failed to resolve Complaint.");
		    }
		    List<complaint> list = AdminDao.getAllComplaints();
		    request.setAttribute("complaint", list);
		    request.getRequestDispatcher("admin-ViewComplaint.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("rejectComplaint")) {
			int complaintId=Integer.parseInt(request.getParameter("complaint_id"));
		    boolean flag = AdminDao.rejectComplaint(complaintId);
		    if(flag) {
		        request.setAttribute("msg", "Complaint reject successfully!");
		    } else {
		        request.setAttribute("msg", "Failed to reject Complaint.");
		    }
		    List<complaint> list = AdminDao.getAllComplaints();
		    request.setAttribute("complaint", list);
		    request.getRequestDispatcher("admin-ViewComplaint.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("addSecurity")) {
			security s=new security();
			s.setFname(request.getParameter("first_name"));
			s.setLname(request.getParameter("last_name"));
			s.setGender(request.getParameter("gender"));
			s.setAddress(request.getParameter("address"));
			s.setContact(Long.parseLong(request.getParameter("phone_no")));
			s.setEmail(request.getParameter("email"));
			s.setPassword(request.getParameter("password"));
			AdminDao.addSecurity(s);
			if(s!=null) {
			response.sendRedirect("admin-AddSecurity.jsp");
			}else {
			request.setAttribute("msg", "Something Went Wrong!");
			request.getRequestDispatcher("admin-AddSecurity.jsp").forward(request, response);	
			}
		
		}else if(action.equalsIgnoreCase("addMaintenance")) {
			maintenance m=new maintenance();
			m.setMonth(request.getParameter("month"));
			m.setYear(Integer.parseInt(request.getParameter("year")));
			m.setAmount(Integer.parseInt(request.getParameter("amount")));
			m.setDueDate(request.getParameter("due_date"));
			m.setRemarks(request.getParameter("remarks"));
			boolean flag=AdminDao.createMaintenance(m);
			System.out.println(flag);
			if(flag) {
				request.setAttribute("msg", "Maintenance added successfully");
				request.getRequestDispatcher("admin-CreateMaintenance.jsp").forward(request, response);	
			}
			else {
				request.setAttribute("msg", "Something Went Wrong!");
				request.getRequestDispatcher("admin-CreateMaintenance.jsp").forward(request, response);	
			}
			}
	}
}
