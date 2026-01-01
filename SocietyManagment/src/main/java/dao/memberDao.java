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
import model.visitor;

public class memberDao {
	
	public static void insertMember(member m) {
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "insert into member(first_name,last_name,gender,dob,email,password,contact_no,occupation,block,flat_no,address,photo) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, m.getFirstName());
			pst.setString(2, m.getLastName());
			pst.setString(3, m.getGender());
			pst.setDate(4, m.getDob());
			pst.setString(5, m.getEmail());
			pst.setString(6, m.getPassword());
			pst.setLong(7, m.getContactNo());
			pst.setString(8, m.getOccupation());
			pst.setString(9, m.getBlock());
			pst.setString(10, m.getFlat_no());
			pst.setString(11, m.getAddress());
			pst.setString(12, m.getPhoto());

			pst.executeUpdate();
			System.out.println("data inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			Connection conn = DbConnection.createConnection();
			String url = "select * from member where email=?";
			PreparedStatement pst = conn.prepareStatement(url);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static member memberLogin(String email, String pass) {
		member m = null;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "SELECT * FROM member WHERE email = ? AND password = ? AND status = 'approve'";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				m = new member();
				m.setMemberId(rs.getInt("member_id"));
				m.setFirstName(rs.getString("first_name"));
				m.setLastName(rs.getString("last_name"));
				m.setGender(rs.getString("gender"));
				m.setDob(rs.getDate("dob"));
				m.setEmail(rs.getString("email"));
				m.setPassword(rs.getString("password"));
				m.setContactNo(rs.getLong("contact_no"));
				m.setOccupation(rs.getString("occupation"));
				m.setBlock(rs.getString("block"));
				m.setFlat_no(rs.getString("flat_no"));
				m.setAddress(rs.getString("address"));
				m.setPhoto(rs.getString("photo"));
				System.out.println(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}
	
	public static List<Integer> getBookedFlatsByBlock(String block) throws SQLException {
        List<Integer> flats = new ArrayList<>();
        try {
			Connection conn = DbConnection.createConnection();
			String sql = "SELECT flat_no FROM member WHERE block = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, block);
			ResultSet rs = pst.executeQuery();

			 while (rs.next()) {
	                flats.add(rs.getInt("flat_no"));
	            }
		} catch (Exception e) {
			e.printStackTrace();
		}
        return flats;
    }
	public static void updatePass(String email, String newpass) {
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "update member set password=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, newpass);
			pst.setString(2, email);
			pst.executeUpdate();
			System.out.println("password updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<String> getBookedVenuesByDate(String date) throws SQLException {
	    List<String> venues = new ArrayList<>();
	    
	    try {
			Connection conn = DbConnection.createConnection();
			String sql = "SELECT venue FROM event_booking WHERE event_date = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, date);
			ResultSet rs = pst.executeQuery();

	        while (rs.next()) {
	            venues.add(rs.getString("venue"));
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
	    return venues;
	}
	
	public static void addEvent(event e) {
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "insert into event_booking (member_id,event_name,venue,event_date,guests,description) values(?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, e.getMemberId());
			pst.setString(2, e.getEventName());
			pst.setString(3, e.getVenue());
			pst.setString(4, e.getEventDate());
			pst.setInt(5, e.getGuests());
			pst.setString(6, e.getDescription());

			pst.executeUpdate();
			System.out.println("data inserted");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public static List<maintenance> getMaintenanceByMember(int memberId) {
		List<maintenance> list = new ArrayList<>();
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "SELECT * FROM maintenance WHERE member_id = ? ORDER BY year DESC, month DESC";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, memberId);			
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
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        return list;
	    }
	
	public static boolean updateMaintenanceAsPaid(int maintenanceId) {
		boolean flag=false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE maintenance SET status = ?, paid_date = CURDATE() WHERE id = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "Paid");
			pst.setInt(2, maintenanceId);
			int rows = pst.executeUpdate();
		        if (rows > 0) {
		            flag = true;
		        }	     
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        return flag;
	}
	
	public static List<visitor> getMemberVisitors(int memberId) {
		List<visitor> list = new ArrayList<>();
		visitor v=null;
		try {
			Connection conn=DbConnection.createConnection();
			String sql="select * from visitors WHERE memberId=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, memberId);
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				v=new visitor();
				v.setVid(rs.getInt("visitor_id"));
				v.setVname(rs.getString("visitor_name"));
				v.setContact(rs.getInt("contact_no"));
				v.setMemeberName(rs.getString("member_name"));
				v.setFlatNo(rs.getInt("flat_no"));
				v.setBlock(rs.getString("block"));
				v.setInTime(rs.getString("in_time"));
				v.setPhoto(rs.getString("visitor_photo"));
				v.setStatus(rs.getString("status"));
				System.out.println(v);
				list.add(v);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public static member getDataOfMember(String block,int flat) {
		member m = null;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "SELECT * FROM member WHERE block = ? AND flat_no = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, block);
			pst.setInt(2, flat);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				m = new member();
				m.setMemberId(rs.getInt("member_id"));
				m.setFirstName(rs.getString("first_name"));
				m.setLastName(rs.getString("last_name"));
				m.setGender(rs.getString("gender"));
				m.setDob(rs.getDate("dob"));
				m.setEmail(rs.getString("email"));
				m.setPassword(rs.getString("password"));
				m.setContactNo(rs.getLong("contact_no"));
				m.setOccupation(rs.getString("occupation"));
				m.setBlock(rs.getString("block"));
				m.setFlat_no(rs.getString("flat_no"));
				m.setAddress(rs.getString("address"));
				m.setPhoto(rs.getString("photo"));
				System.out.println(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;

	}
	public static void changeVisitorStatus(String action,int memberId) {

		try {
			Connection conn=DbConnection.createConnection();
			String sql="update visitors set status=? where memberId=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, action);
			pst.setInt(2, memberId);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void addComplaint(complaint c) {
		try {
			Connection conn =DbConnection.createConnection();
			String sql="insert into complaint (member_id,subject,description) values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, c.getmId());
			pst.setString(2, c.getSubject());
			pst.setString(3, c.getDescription());
			pst.executeUpdate();
			System.out.println("data inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void updateMember(member m) {
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "UPDATE member SET first_name=?,last_name=?,gender=?,dob=?,email=?,contact_no=?,occupation=?,address=?,photo=? WHERE member_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, m.getFirstName());
			pst.setString(2, m.getLastName());
			pst.setString(3, m.getGender());
			pst.setDate(4, m.getDob());
			pst.setString(5, m.getEmail());
			pst.setLong(6, m.getContactNo());
			pst.setString(7, m.getOccupation());
			pst.setString(8, m.getAddress());
			pst.setString(9, m.getPhoto());
			pst.setInt(10, m.getMemberId());
			
			pst.executeUpdate();
			System.out.println("data Updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static boolean checkOldPassword(String email, String oldpass) {
		boolean flag = false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "select * from member where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, oldpass);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

}

