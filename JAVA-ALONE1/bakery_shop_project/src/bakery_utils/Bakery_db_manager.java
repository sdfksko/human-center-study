package bakery_utils;

import java.sql.*;

public class Bakery_db_manager {
	public static Connection getDBConnection() {
		Connection conn = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
				String url = "jdbc:oracle:thin:@localhost:1521:orcl";
				String username = "bakery_shop";
				String password = "1234";
				
				conn = DriverManager.getConnection(url, username, password);
		}catch(Exception e) {
			e.printStackTrace();
			
			System.out.println("DB연결 오류");
		}
		
		return conn;
	}
	
	public static void dbclose(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch(SQLException se) {
			System.out.println("Oracle DB IO 오류 -> " + se.getMessage());
		}
	}
}
