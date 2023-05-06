package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Database.DBConnect;
import Model.Users;

public class UsersDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public Users checkAccountExist(String phoneNumber) {
		String query = "select * from Users\r\n"
				+ "where [phoneNumber] = ?";
		
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, phoneNumber);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				return new Users(rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getInt(5));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void register(Users user) {
		String query = "INSERT INTO Users(phoneNumber, password, email, role_id) values(?, ?, ?, ?)";
		
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getPhoneNumber());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setInt(4, user.getRole_id());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Users checkLogin(String phoneNumber, String password) {
		String query = "SELECT * FROM Users WHERE [phoneNumber] = ? AND [password] = ?";
		
		try {
			new DBConnect();
			conn = DBConnect.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, phoneNumber);
			ps.setString(2, password);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				return new Users(rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getInt(5));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
