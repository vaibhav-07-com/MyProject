package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import connection.DbConnection;
import model.complaint;
import model.event;
import model.maintenance;
import model.member;
import model.security;
import model.visitor;

public class AdminDao {

	public static boolean adminLogin(String username,String pass) {
		
		boolean flag=false;
		try {
			Connection conn=DbConnection.createConnection();
			String sql="select * from admin where username=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	public static int getTotalMembers() {
		int count=0;
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT COUNT(*) FROM member";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
	            count = rs.getInt(1);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public static int getTotalEventBookings() {
		int count=0;
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT COUNT(*) FROM event_booking";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
	            count = rs.getInt(1);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public static int getTotalComplaints() {
		int count=0;
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT COUNT(*) FROM complaint";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
	            count = rs.getInt(1);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public static int getTotalVisitors() {
		int count=0;
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT COUNT(*) FROM visitors";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
	            count = rs.getInt(1);
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public static List<member> getAllMember(){
		List<member> list = new ArrayList<>();
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT * FROM member ORDER BY created_at DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
	            member m = new member();
	            m.setMemberId(rs.getInt("member_id"));
	            m.setFirstName(rs.getString("first_name"));
	            m.setLastName(rs.getString("last_name"));
	            m.setGender(rs.getString("gender"));
	            m.setDob(rs.getDate("dob"));
	            m.setEmail(rs.getString("email"));
	            m.setContactNo(rs.getLong("contact_no"));
	            m.setOccupation(rs.getString("occupation"));
	            m.setBlock(rs.getString("block"));
	            m.setFlat_no(rs.getString("flat_no"));
	            m.setAddress(rs.getString("address"));
	            m.setPhoto(rs.getString("photo"));
	            m.setStatus(rs.getString("status"));
	            list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static boolean approveMember(int memberId) {
		boolean flag=false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE member SET status=? WHERE member_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "approve");
			pst.setInt(2, memberId);
			pst.executeUpdate();
			flag=true;
			System.out.println("data Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static boolean rejectMember(int memberId) {
		boolean flag=false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE member SET status=? WHERE member_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "reject");
			pst.setInt(2, memberId);
			pst.executeUpdate();
			flag=true;
			System.out.println("data Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static List<event> getAllEvents(){
		List<event> list = new ArrayList<>();
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT * FROM event_booking ORDER BY request_date DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
	            event m = new event();
	            m.setMemberId(rs.getInt("member_id"));
	            m.setEventId(rs.getInt("event_id"));
	            m.setEventName(rs.getString("event_name"));
	            m.setEventDate(rs.getString("event_date"));
	            m.setDescription(rs.getString("description"));
	            m.setGuests(rs.getInt("guests"));
	            m.setVenue(rs.getString("venue"));
	            m.setStatus(rs.getString("status"));
	            list.add(m);
	            System.out.println(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static boolean approveEvent(int eventId) {
		boolean flag=false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE event_booking SET status=? WHERE event_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "approve");
			pst.setInt(2, eventId);
			pst.executeUpdate();
			flag=true;
			System.out.println("data Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static boolean rejectEvent(int eventId) {
		boolean flag=false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE event_booking SET status=? WHERE event_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "reject");
			pst.setInt(2, eventId);
			pst.executeUpdate();
			flag=true;
			System.out.println("data Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static List<complaint> getAllComplaints(){
		List<complaint> list = new ArrayList<>();
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT * FROM complaint ORDER BY complaint_date DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				complaint c = new complaint();
				c.setcId(rs.getInt("complaint_id"));
				c.setmId(rs.getInt("member_id"));
				c.setSubject(rs.getString("subject"));
				c.setDescription(rs.getString("description"));
				c.setDate(rs.getString("complaint_date"));
				c.setStatus(rs.getString("status"));
	            list.add(c);
	            System.out.println(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static boolean resolveComplaint(int complaintId) {
		boolean flag=false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE complaint SET status=? WHERE complaint_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "resolve");
			pst.setInt(2, complaintId);
			pst.executeUpdate();
			flag=true;
			System.out.println("data Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static boolean rejectComplaint(int complaintId) {
		boolean flag=false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE complaint SET status=? WHERE complaint_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "reject");
			pst.setInt(2, complaintId);
			pst.executeUpdate();
			flag=true;
			System.out.println("data Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static List<visitor> getAllVisitors(){
		List<visitor> list = new ArrayList<>();
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT * FROM visitors ORDER BY in_time DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				visitor v = new visitor();
				v.setVid(rs.getInt("visitor_id"));
				v.setSid(rs.getInt("security_id"));
				v.setmId(rs.getInt("memberId"));
				v.setVname(rs.getString("visitor_name"));
				v.setMemeberName(rs.getString("member_name"));
				v.setContact(rs.getLong("contact_no"));
				v.setFlatNo(rs.getInt("flat_no"));
				v.setBlock(rs.getString("block"));
				v.setPhoto(rs.getString("visitor_photo"));
				v.setStatus(rs.getString("status"));
				v.setInTime(rs.getString("in_time"));
				
	            list.add(v);
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static List<security> getAllSecurity(){
		List<security> list = new ArrayList<>();
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT * FROM security_register";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				security s = new security();
				s.setId(rs.getInt("security_id"));
				s.setFname(rs.getString("first_name"));
				s.setAddress(rs.getString("address"));
				s.setContact(rs.getLong("phone_no"));
				s.setEmail(rs.getString("email"));
				s.setGender(rs.getString("gender"));
				s.setJoindate(rs.getString("joining_date"));
				s.setLname(rs.getString("last_name"));
				s.setPassword(rs.getString("password"));
				s.setStatus(rs.getString("status"));
	            list.add(s);
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static void addSecurity(security s) {
		try {
			Connection conn=DbConnection.createConnection();
			String sql="INSERT INTO security_register (first_name, last_name, gender, address, phone_no, email, password) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, s.getFname());
			pst.setString(2, s.getLname());
			pst.setString(3, s.getGender());
			pst.setString(4, s.getAddress());
			pst.setLong(5, s.getContact());
			pst.setString(6, s.getEmail());
			pst.setString(7, s.getPassword());
			pst.executeUpdate();
			System.out.println("data inserted");
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static List<maintenance> viewAllMaintenance(){
		List<maintenance> list = new ArrayList<>();
		try {
			Connection conn=DbConnection.createConnection();
			String sql="SELECT * FROM maintenance ";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				maintenance m = new maintenance();
                m.setId(rs.getInt("id"));
                m.setMemberId(rs.getInt("member_id"));
                m.setMonth(rs.getString("month"));
                m.setYear(rs.getInt("year"));
                m.setAmount(rs.getDouble("amount"));
                m.setDueDate(rs.getString("due_date"));
                m.setPaidDate(rs.getString("paid_date"));
                m.setRemarks(rs.getString("remarks"));
                m.setStatus(rs.getString("status")); 
                list.add(m);
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static boolean createMaintenance(maintenance m) {
		boolean flag=false;
		Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = DbConnection.createConnection();

            // Step 1: Get all approved members
            String getMembersSql = "SELECT member_id FROM member WHERE status = 'approve'";
            pst = conn.prepareStatement(getMembersSql);
            rs = pst.executeQuery();

            // Step 2: Prepare insert query for maintenance
            String insertSql = "INSERT INTO maintenance (member_id, month, year, amount, status, due_date, remarks) "
                    + "VALUES (?, ?, ?, ?, 'Unpaid', ?, ?)";
            PreparedStatement insertPst = conn.prepareStatement(insertSql);

            // Step 3: Loop through all members and insert
            int count = 0;
            while (rs.next()) {
                int memberId = rs.getInt("member_id");

                insertPst.setInt(1, memberId);
                insertPst.setString(2, m.getMonth());
                insertPst.setInt(3, m.getYear());
                insertPst.setDouble(4, m.getAmount());
                insertPst.setString(5, m.getDueDate());
                insertPst.setString(6, m.getRemarks());

                insertPst.addBatch(); // Add to batch
                count++;
            }

            if (count > 0) {
                insertPst.executeBatch(); // Execute all at once
                flag = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pst != null) pst.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
        return flag;
    }
}
