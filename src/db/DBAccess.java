package db;

import java.sql.*;

public class DBAccess {
	private Connection con = null;
	private PreparedStatement sta = null;
	private ResultSet rs = null;
	
	public DBAccess(){
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	public void Open() {
		try {
			con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=web;user=sa;password=nicai");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int ExecuteUpdate(String sql) {
		int result = 0;
		if(con == null) {
			Open();
		}
		try {
			sta = con.prepareStatement(sql);
			result = sta.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	
	public ResultSet ExecuteQuery(String sql) {
		if(con == null) {
			Open();
		}
		try {
			sta = con.prepareStatement(sql);
			rs = sta.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public void Close() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(sta != null) {
			try {
				sta.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
}
