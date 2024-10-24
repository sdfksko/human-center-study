package com.dbManager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class dbManager {
	
		public static Connection getDBConnection() {
			Connection conn = null;
			
			try {
				Class.forName("oracle.jdbc.OracleDriver");	// 오라클 접속을 위한 Driver 사전작업
				
					//String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 오라클 접속할 위치값 저장
					// String url = "jdbc:oracle:thin:@1.220.247.78:1522:orcl";	// 오라클 접속할 위치값 저장
					String url = "jdbc:oracle:thin:@1.220.247.78:1522:orcl"; // 오라클 접속할 위치값 저장
					String username = "semi_2405_team3";		// 오라클 접속 계정id
					String password = "1234";			// 오라클 접속 계정pw
					
					conn = DriverManager.getConnection(url, username, password); 
					// 실제 오라클 접속하여 접속을 다루는 객체를 받아서 Connection클래스 객체에 대입
					
				} catch(Exception e) {
					e.printStackTrace();	// 에러 추적 표시
					
					System.out.println("DB연결 오류");
				}
			
			return conn;
		}
		
		public static void dbClose(Connection conn, PreparedStatement pstmt, ResultSet rs) {
			// DB입출력 자원을 정리
					try {
						if (rs != null) {
							rs.close();
						}
						if (pstmt != null) {
							pstmt.close();
						}
						if (conn != null) {
							conn.close();
						}
					} catch (SQLException se) {
						System.out.println("Oracle DB IO 오류 -> " + se.getMessage());
					}
			}
	}
