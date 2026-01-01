package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import connection.DbConnection;
import model.member;
import model.security;
import model.visitor;

public class securityDao {
	public static security securityLogin(String email,String pass) {
		security s=null;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "SELECT * FROM security_register WHERE email = ? AND password = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				s = new security();
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
				
				System.out.println(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;

	}
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			Connection conn = DbConnection.createConnection();
			String url = "select * from security_register where email=?";
			PreparedStatement pst = conn.prepareStatement(url);
			pst.setString(1, email);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("this is flag value"+flag);
		return flag;
	}
	public static boolean checkOldPassword(String email, String oldpass) {
		boolean flag = false;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "select * from security_register where email=? and password=?";
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

	public static void updatePass(String email, String newpass) {
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "update security_register set password=? where email=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, newpass);
			pst.setString(2, email);
			pst.executeUpdate();
			System.out.println("password updated");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void addVisitor(visitor v) {
		
			try {
				member m=memberDao.getDataOfMember(v.getBlock(), v.getFlatNo());
				Connection conn = DbConnection.createConnection();
				String sql = "insert into visitors(visitor_name,contact_no,member_name,flat_no,block,in_time,visitor_photo,security_id,memberId) values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement pst = conn.prepareStatement(sql);
				pst.setString(1, v.getVname());
				pst.setLong(2, v.getContact());
				pst.setString(3, v.getMemeberName());
				pst.setInt(4, v.getFlatNo());
				pst.setString(5, v.getBlock());
				pst.setString(6, v.getInTime());
				pst.setString(7, v.getPhoto());
				pst.setInt(8, v.getSid());
				pst.setInt(9, m.getMemberId());
				pst.executeUpdate();
				System.out.println("data inserted");
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public static List<visitor> getVisitors() {
		List<visitor> list = new ArrayList<>();
		visitor v=null;
		try {
			Connection conn=DbConnection.createConnection();
			String sql="select * from visitors ";
			PreparedStatement pst = conn.prepareStatement(sql);
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
}
