package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DbConnection;
import model.Chairman;

public class ChairmanDao {
  public static boolean checkEmail(String email) {
	  boolean flag = false;
		try {
			Connection conn = DbConnection.createConnection();
			String url = "select * from chairman where email=?";
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
  public static Chairman loginChairman(String email,String pass) {
	   Chairman m = null;
		try {
			Connection conn = DbConnection.createConnection();
			String sql = "select * from chairman where email=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				m = new Chairman();
				m.setCid(rs.getInt("chairman_id"));
				m.setFirst_name(rs.getString("first_name"));
				m.setLast_name(rs.getString("last_name"));
				m.setGender(rs.getString("gender"));
				m.setDob(rs.getString("dob"));
				m.setEmail(rs.getString("email"));
				m.setPassword(rs.getString("password"));
				m.setContact_no(rs.getLong("contact_no"));
				m.setAddress(rs.getString("address"));
				m.setPhoto(rs.getString("photo"));
				System.out.println(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
  }
}
