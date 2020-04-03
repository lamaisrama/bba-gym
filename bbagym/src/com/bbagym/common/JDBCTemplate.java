package com.bbagym.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;



public class JDBCTemplate {
	
	private static Properties prop = new Properties();

	
	public static Connection getConnection() {
		
		
		
		Connection conn = null;	
		
		try {
			String path=JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
			prop.load(new FileReader(path));
			Class.forName(prop.getProperty("driver"));
			conn = DriverManager.getConnection(prop.getProperty("url"),prop.getProperty("user"),prop.getProperty("pw"));
			conn.setAutoCommit(false);
			
			
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		return conn;
	}
	

	public static void close(Connection conn) {
		
		try {
			if(!conn.isClosed() && conn != null){
				conn.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public static void close(ResultSet rs) {
			
			try {
				if(!rs.isClosed() && rs != null){
					rs.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			
		}
	public static void close(PreparedStatement pstmt) {
			
			try {
				if(!pstmt.isClosed() && pstmt != null){
					pstmt.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			
		}
			
	public static void commit(Connection conn) {
			
			try {
				if(!conn.isClosed() && conn != null){
					conn.commit();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
			
			
		}

	public static void rollback(Connection conn) {
		
		try {
			if(!conn.isClosed() && conn != null){
				conn.rollback();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		
	}
				
}
