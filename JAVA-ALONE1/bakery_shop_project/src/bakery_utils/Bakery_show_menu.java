package bakery_utils;

import java.util.*;
import java.sql.*;
import bakery_utils.Bakery_db_manager;

public class Bakery_show_menu {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Scanner scanner = new Scanner(System.in);
	
	int menuNo = 0;
	
	public void showMenu() {
		do {
			System.out.println("| <1> 모든 품목 보기| <2> 빵 품목 보기 | <3> 케이크 품목 보기 | <4> 음료 품목 보기 | <5> 메인 메뉴로 돌아가기");
			System.out.print("메뉴 번호를 선택해주십시오 -> ");
			
			try{
				menuNo = Integer.parseInt(scanner.nextLine());
			}catch(NumberFormatException se) {
				System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("모든 품목 보기를 선택하셨습니다");
				
				showAllMenu();
				break;
				
			case 2:
				System.out.println("빵 품목 보기를 선택하셨습니다");
				
				showBreadMenu();
				break;
				
			case 3:
				System.out.println("케이크 품목 보기를 선택하셨습니다");
				
				showCakeMenu();
				break;
				
			case 4:
				System.out.println("음료 품목 보기를 선택하셨습니다");
				
				showDrinkMenu();
				break;
				
			default:
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
			}
		}while(!(menuNo == 5));
	}
	
	public void showAllMenu() {
		System.out.println("메뉴번호       이름       타입       생산자이름");
		
		Connection conn = Bakery_db_manager.getDBConnection();
			
		String allSelectSql = "SELECT * FROM bakery_menu ORDER BY  menu_type";
		try {
			pstmt = conn.prepareStatement(allSelectSql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 System.out.printf("%-10s%-14s%-10s%-10s%n", 
		                    rs.getInt("menu_no"), 
		                    rs.getString("menu_name"), 
		                    rs.getString("menu_type"), 
		                    rs.getString("member_name"));
				
						
			}
		}catch(SQLException se) {
			System.out.println("모든 메뉴 불러오기가 실패하였습니다" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn,pstmt,rs);
		}
	}
	
	public void showBreadMenu() {
		System.out.println("메뉴번호       이름       타입       생산자이름");
		
		Connection conn = Bakery_db_manager.getDBConnection();
			
		String allSelectSql = "SELECT * FROM bakery_menu WHERE menu_type = 'bread'";
		try {
			pstmt = conn.prepareStatement(allSelectSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf(
						"%-6s%-6s%-6s%-6s\n"
						, rs.getInt("menu_no")
						, rs.getString("menu_name")
						, rs.getString("menu_type")
						, rs.getString("member_name")
						);		
			}
		}catch(SQLException se) {
			System.out.println("빵 메뉴 불러오기가 실패하였습니다" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn,pstmt,rs);
		}
		
	}
	
	public void showCakeMenu() {
		System.out.println("메뉴번호       이름       타입       생산자이름");
		
		Connection conn = Bakery_db_manager.getDBConnection();
			
		String allSelectSql = "SELECT * FROM bakery_menu WHERE menu_type = 'cake'";
		try {
			pstmt = conn.prepareStatement(allSelectSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf(
						"%-6s%-6s%-6s%-6s\n"
						, rs.getInt("menu_no")
						, rs.getString("menu_name")
						, rs.getString("menu_type")
						, rs.getString("member_name")
						);		
			}
		}catch(SQLException se) {
			System.out.println("케이크 메뉴 불러오기가 실패하였습니다" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn,pstmt,rs);
		}
	}
	
	public void showDrinkMenu() {
		System.out.println("메뉴번호       이름       타입       생산자이름");
		
		Connection conn = Bakery_db_manager.getDBConnection();
			
		String allSelectSql = "SELECT * FROM bakery_menu WHERE menu_type = 'drink'";
		try {
			pstmt = conn.prepareStatement(allSelectSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf(
						"%-6s%-6s%-6s%-6s\n"
						, rs.getInt("menu_no")
						, rs.getString("menu_name")
						, rs.getString("menu_type")
						, rs.getString("member_name")
						);		
			}
		}catch(SQLException se) {
			System.out.println("음료 메뉴 불러오기가 실패하였습니다" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn,pstmt,rs);
		}
	}
}