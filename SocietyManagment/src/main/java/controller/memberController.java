package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.memberDao;
import dao.securityDao;
import model.complaint;
import model.event;
import model.maintenance;
import model.member;
import model.visitor;
import send_mail.EmailSender;

/**
 * Servlet implementation class memberController
 */
@MultipartConfig
@WebServlet("/member")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action= request.getParameter("action");
		System.out.println("your action in get method is "+action);
		if ("getBookedFlats".equals(action)) {
            String block = request.getParameter("block");

            try {
                List<Integer> bookedFlats = memberDao.getBookedFlatsByBlock(block);

                StringBuilder jsonBuilder = new StringBuilder();
                jsonBuilder.append("[");
                for (int i = 0; i < bookedFlats.size(); i++) {
                    jsonBuilder.append(bookedFlats.get(i));
                    if (i < bookedFlats.size() - 1) {
                        jsonBuilder.append(",");
                    }
                }
                jsonBuilder.append("]");

                String json = jsonBuilder.toString();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                return;

            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\":\"Database error\"}");
                return;
            }
        }else if ("getBookedVenues".equals(action)) {
            String date = request.getParameter("date");

            try {
                List<String> bookedVenues = memberDao.getBookedVenuesByDate(date);
                StringBuilder jsonBuilder = new StringBuilder();
                jsonBuilder.append("[");
                for (int i = 0; i < bookedVenues.size(); i++) {
                    jsonBuilder.append("\"").append(bookedVenues.get(i)).append("\"");
                    if (i < bookedVenues.size() - 1) {
                        jsonBuilder.append(",");
                    }
                }
                jsonBuilder.append("]");

                String json = jsonBuilder.toString();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(json);
                return;

            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\":\"Database error\"}");
                return;
            }
        }
        else if(action.equalsIgnoreCase("viewMaintenance")) {
            int memberId = Integer.parseInt(request.getParameter("member_id"));
            List<maintenance> maintenanceList = memberDao.getMaintenanceByMember(memberId);
            request.setAttribute("maintenanceList", maintenanceList);
            request.getRequestDispatcher("Member-Maintenance.jsp").forward(request, response);
        }
        else if (action.equalsIgnoreCase("payMaintenance")) {
            System.out.println("Action payMaintenance triggered");

            String maintenanceIdStr = request.getParameter("maintenance_id");
            String memberIdStr = request.getParameter("memberId");

            System.out.println("Raw maintenanceId param: " + maintenanceIdStr);
            System.out.println("Raw memberId param: " + memberIdStr);

            if (maintenanceIdStr != null && memberIdStr != null) {
                int maintenanceId = Integer.parseInt(maintenanceIdStr);
                int memberId = Integer.parseInt(memberIdStr);

                boolean isPaid = memberDao.updateMaintenanceAsPaid(maintenanceId);
                System.out.println("Update result (isPaid): " + isPaid);

                if (isPaid) {
                    request.setAttribute("msg", "Maintenance paid successfully!");
                } else {
                    request.setAttribute("msg", "Some problem occurred while processing payment.");
                }

                List<maintenance> mList = memberDao.getMaintenanceByMember(memberId);
                request.setAttribute("maintenanceList", mList);

                request.getRequestDispatcher("Member-Maintenance.jsp").forward(request, response);
            } else {
                System.out.println("❌ Missing parameters!");
                request.setAttribute("msg", "Invalid payment request. Please try again.");
                request.getRequestDispatcher("Member-Maintenance.jsp").forward(request, response);
            }
        }else if(action.equalsIgnoreCase("viewVisitor")) {
				List<visitor> visitorList = new ArrayList<>();
				System.out.println(visitorList.toString());
				int memberId=Integer.parseInt(request.getParameter("member_id"));
				
				visitorList = memberDao.getMemberVisitors(memberId);
				
				request.setAttribute("visitorList", visitorList);
				
			    request.getRequestDispatcher("MemberVisitor.jsp").forward(request, response);
			}
        else if(action.equalsIgnoreCase("approve")||action.equalsIgnoreCase("reject")) {
        	int memberId=Integer.parseInt(request.getParameter("member_id"));
        	memberDao.changeVisitorStatus(action,memberId);
			
        	HttpSession session = request.getSession();
			// Inside second method
			response.sendRedirect("member?action=viewVisitor&member_id" +memberId);
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
String action= request.getParameter("action");
System.out.println("your action in post method is "+action);
		
		if(action.equalsIgnoreCase("register")) {
			String savePath = "C:\\Users\\Admin\\eclipse-workspace\\SocietyManagment\\src\\main\\webapp\\images";
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("photo");
			String fileName = extractfilename(file1);
			file1.write(savePath + File.separator + fileName);
			String filePath = savePath + File.separator + fileName;

			String savePath2 = "C:\\Users\\Admin\\eclipse-workspace\\SocietyManagment\\src\\main\\webapp\\images";
			File imgSaveDir = new File(savePath2);
			if (!imgSaveDir.exists()) {
				imgSaveDir.mkdir();
			}
			String dobStr = request.getParameter("dob");
			java.sql.Date sqlDate = null;

			try {
			    // Parse string into java.util.Date first
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    java.util.Date utilDate = sdf.parse(dobStr);

			    // Convert to java.sql.Date
			    sqlDate = new java.sql.Date(utilDate.getTime());
			} catch (ParseException e) {
			    e.printStackTrace();
			}
			
			String checkkEmail=request.getParameter("email");
			Boolean flag=memberDao.checkEmail(checkkEmail);
			if(flag==false) {
			member m=new member();
			m.setFirstName(request.getParameter("first_name"));
			m.setLastName(request.getParameter("last_name"));
			m.setAddress(request.getParameter("address"));
			m.setGender(request.getParameter("gender"));
			m.setDob(sqlDate);
			m.setContactNo(Long.parseLong(request.getParameter("contact_no")));
			m.setOccupation(request.getParameter("occupation"));
			m.setBlock(request.getParameter("block"));
			m.setFlat_no(request.getParameter("flat_no"));
			m.setEmail(request.getParameter("email"));
			m.setPassword(request.getParameter("password"));
			m.setPhoto(fileName);
			System.out.println(m);
			memberDao.insertMember(m);
			response.sendRedirect("Member-Login.jsp");
			}else {
				request.setAttribute("msg", "Email already exist");
				request.getRequestDispatcher("Member-Registration.jsp").forward(request, response);	
			}
			
		}else if(action.equalsIgnoreCase("login")) {
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			member m = memberDao.memberLogin(email, pass);
			if (m != null) {
				HttpSession session = request.getSession();
				session.setAttribute("data", m);
				request.getRequestDispatcher("member-Home.jsp").forward(request, response);
			} else {
				 request.setAttribute("msg", "Invalid credentials or account not approved yet.");
				request.getRequestDispatcher("Member-Login.jsp").forward(request, response);
			}
		}
		else if (action.equalsIgnoreCase("Send OTP")) {
			String email = request.getParameter("email");	
			boolean flag =memberDao.checkEmail(email);
			Random r = new Random();
			int num = r.nextInt(100000, 999999);
			System.out.println(num);
			
			String subject = "Password Reset OTP - Society Management System";
			
			String message = String.format(
			    "Dear User,\n\n" +
			    "We received a request to reset your password for your Doctor & Patient Management System account.\n\n" +
			    "Your One-Time Password (OTP) is:\n\n" +
			    "🔐 OTP Code: %d\n\n" +
			    "This code is valid for the next 10 minutes. Please do not share this code with anyone.\n\n" +
			    "If you did not request a password reset, please ignore this email or contact our support team immediately.\n\n" +
			    "Thank you for using our system.\n\n" +
			    "Best regards,\n" +
			    "Society Management System Team\n" +
			    "doctorfinder523@gmail.com", num);

			
			try {
				if(flag==true) {
				//EmailSender.sendOTP(email, num, subject, message);
				request.setAttribute("otp", num);
				request.setAttribute("email", email);
				request.getRequestDispatcher("Member-Verify-OTP.jsp").forward(request, response);
				}else {
					request.setAttribute("msg", "No such email exist! Enter valid email");
					request.getRequestDispatcher("Member-forgot-password.jsp").forward(request, response);
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
				request.getRequestDispatcher("Member-New-Pass.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "OTP not matched");
				request.setAttribute("otp", otp1);
				request.setAttribute("email", email);
				request.getRequestDispatcher("Member-Verify-OTP.jsp").forward(request, response);
			}
		}
		else if (action.equalsIgnoreCase("NewPassword")) {
			String email = request.getParameter("email");
			String newpss = request.getParameter("NewPass");
			String cnewpass = request.getParameter("CNewPass");
			if (newpss.equals(cnewpass)) {
				memberDao.updatePass(email, newpss);
				response.sendRedirect("Member-Login.jsp");
			} else {
				request.setAttribute("msg", "New and Confirm New Password not matched");
				request.getRequestDispatcher("Member-forgot-password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("bookEvent")) {
			event e= new event();
			e.setMemberId(Integer.parseInt(request.getParameter("member_id")));
			e.setEventName(request.getParameter("event_name"));
			e.setVenue(request.getParameter("venue"));
			e.setEventDate(request.getParameter("event_date"));
			e.setDescription(request.getParameter("description"));
			e.setGuests(Integer.parseInt(request.getParameter("guests")));
			memberDao.addEvent(e);
			if (e != null) {
				 request.setAttribute("msg", "✅ Your event booking request has been submitted successfully.\r\n"
				 		+ "Please wait for approval from the society administrator.");
					request.getRequestDispatcher("Member-EventBook.jsp").forward(request, response);
			}else{
				request.setAttribute("msg", "⚠️ Unable to process your event booking at the moment. Please try again after some time.");
				request.getRequestDispatcher("Member-EventBook.jsp").forward(request, response);
			}
		}else if(action.equalsIgnoreCase("addComplaint")) {
			complaint c=new complaint();
			c.setmId(Integer.parseInt(request.getParameter("member_id")));
			c.setSubject(request.getParameter("subject"));
			c.setDescription(request.getParameter("description"));
			memberDao.addComplaint(c);
			if (c != null) {
				 request.setAttribute("msg", "✅ Your complaint request has been submitted successfully.");
					request.getRequestDispatcher("Member-Complaint.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "⚠️ Unable to process your Complaint at the moment. Please try again after some time.");
				request.getRequestDispatcher("Member-EventBook.jsp").forward(request, response);
			}
		}else if(action.equalsIgnoreCase("updatePassword")) {
			String email=request.getParameter("email");
			String oldpass=request.getParameter("oldpass");
			String newpass=request.getParameter("newpass");
			String cnewpass=request.getParameter("confnewpass");
			boolean flag = memberDao.checkOldPassword(email, oldpass);
			if (flag == true) {
				if (newpass.equals(cnewpass)) {
					memberDao.updatePass(email, newpass);
					response.sendRedirect("member-Home.jsp");
				} else {
					request.setAttribute("msg", "New and Confirm New Password not matched");
					request.getRequestDispatcher("Member-Change-passsword.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "Old pass incorrect");
				request.getRequestDispatcher("Member-Change-passsword.jsp").forward(request, response);
			}
					
		}
		else if(action.contentEquals("updateProfile")) {
			String savePath = "C:\\Users\\Admin\\eclipse-workspace\\SocietyManagment\\src\\main\\webapp\\images";
			File fileSaveDir = new File(savePath);
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdir();
			}
			Part file1 = request.getPart("photo");
			String fileName = extractfilename(file1);
			file1.write(savePath + File.separator + fileName);
			String filePath = savePath + File.separator + fileName;

			String savePath2 = "C:\\Users\\Admin\\eclipse-workspace\\SocietyManagment\\src\\main\\webapp\\images";
			File imgSaveDir = new File(savePath2);
			if (!imgSaveDir.exists()) {
				imgSaveDir.mkdir();
			}
			String dobStr = request.getParameter("dob");
			java.sql.Date sqlDate = null;

			try {
			    // Parse string into java.util.Date first
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    java.util.Date utilDate = sdf.parse(dobStr);

			    // Convert to java.sql.Date
			    sqlDate = new java.sql.Date(utilDate.getTime());
			} catch (ParseException e) {
			    e.printStackTrace();
			}
			
			member m= new member();
			m.setMemberId(Integer.parseInt(request.getParameter("member_id")));
			m.setFirstName(request.getParameter("first_name"));
			m.setLastName(request.getParameter("last_name"));
			m.setAddress(request.getParameter("address"));
			m.setGender(request.getParameter("gender"));
			m.setDob(sqlDate);
			m.setContactNo(Long.parseLong(request.getParameter("contact_no")));
			m.setOccupation(request.getParameter("occupation"));
			m.setBlock(request.getParameter("block"));
			m.setFlat_no(request.getParameter("flat_no"));
			m.setEmail(request.getParameter("email"));
			m.setPassword(request.getParameter("password"));
			m.setPhoto(fileName);
			System.out.println(m);
			memberDao.updateMember(m);
			HttpSession session = request.getSession();
			session.setAttribute("data", m);
			request.getRequestDispatcher("Member-Profile.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "⚠️ Unable to process your Update at the moment. Please try again after some time.");
			request.getRequestDispatcher("Member-Profile.jsp").forward(request, response);	
		}
	}
	
}


