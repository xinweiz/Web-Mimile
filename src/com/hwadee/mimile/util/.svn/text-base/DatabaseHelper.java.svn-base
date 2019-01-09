package com.hwadee.mimile.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import sun.jdbc.rowset.CachedRowSet;
public class DatabaseHelper {
	static {
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/mml?useOldAliasMetadataBehavior=true&characterEncoding=utf-8"
					,"root","111");
			/////注意，这里大家将数据库密码改成111
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void executeUpdate(String s) {
		String sql = s;
		Connection conn = getConnection();
		Statement stmt;
		try {
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			releaseConn(conn);
		}
	}
	public static void releaseConn(Connection conn){ 
		try {
			if(conn != null) {
			   conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    public static ResultSet executeQuery(String sql) {
    	Connection conn = getConnection();
		Statement stmt;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			CachedRowSet crs = new CachedRowSet();
			crs.populate(rs);
			return crs;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			releaseConn(conn);
		}
		return null;
	}
    
}
