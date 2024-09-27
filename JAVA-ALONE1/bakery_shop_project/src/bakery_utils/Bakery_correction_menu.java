package bakery_utils;

import java.util.Scanner;
import java.sql.*;

public class Bakery_correction_menu {
	Scanner scanner = new Scanner(System.in);
	
	int menuNo = 0;
	int menuNo2 = 0;
	int menuNo3 = 0;
	String name = null;
	String name2 = null;
	String name3 = null;
	String memberName = null;
	String memberName2 = null;
	String memberName3 = null;
	
	PreparedStatement pstmt = null;
	
	public void correctionMenu() {
		do {
			System.out.println("| <1> 모든 메뉴 수정 | <2> 빵 메뉴 수정 | <3> 케이크 메뉴 수정 | <4> 음료 메뉴 수정 | <5> 메인 메뉴로 돌아가기");
			System.out.print("메뉴 번호를 선택해주십시오 -> ");
			
			try{
				menuNo = Integer.parseInt(scanner.nextLine());
			}catch(NumberFormatException se) {
				System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("모든 메뉴 수정을 선택하셨습니다");
				
				allMenuCorrection();
				break;
				
			case 2:
				System.out.println("빵 메뉴 수정을 선택하셨습니다");
				
				breadMenuCorrection();
				break;
				
			case 3:
				System.out.println("케이크 메뉴 수정을 선택하셨습니다");
				
				cakeMenuCorrection();
				break;
				
			case 4:
				System.out.println("음료 메뉴 수정을 선택하셨습니다");
				
				drinkMenuCorrection();
				break;
				
			default:
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
			}
		}while(!(menuNo == 5));
		
	}
	
	public void allMenuCorrection() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		System.out.println("수정할 빵 메뉴의 번호를 입력해주십시오");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.println("수정할 빵 메뉴의 이름을 입력해주십시오");
		name = scanner.nextLine();
		System.out.println("수정할 생산자의 이름을 입력해주십시오");
		memberName = scanner.nextLine();
		
		try {
			String menuCorrectionSql = """
					UPDATE bakery_menu SET menu_name = ? member_name = ?
					WHERE menu_no = ? AND menu_type = 'bread'
					""";
			
			pstmt = conn.prepareStatement(menuCorrectionSql);
			pstmt.setString(1, name);
			pstmt.setString(2, memberName);
			pstmt.setInt(3, menuNo);
			pstmt.executeUpdate();
			
			System.out.println("빵 메뉴 수정에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, null);
		}
		
		System.out.println("수정할 케이크 메뉴의 번호를 입력해주십시오");
		menuNo2 = Integer.parseInt(scanner.nextLine());
		System.out.println("수정할 케이크 메뉴의 이름을 입력해주십시오");
		name2 = scanner.nextLine();
		System.out.println("수정할 생산자의 이름을 입력해주십시오");
		memberName2 = scanner.nextLine();
		
		try {
			String menuCorrectionSql2 = """
					UPDATE bakery_menu SET menu_name = ?, member_name = ?
					WHERE menu_no = ? AND menu_type = 'cake'
					""";
			
			pstmt = conn.prepareStatement(menuCorrectionSql2);
			pstmt.setString(1, name);
			pstmt.setString(2, memberName);
			pstmt.setInt(3, menuNo);
			pstmt.executeUpdate();
			
			System.out.println("케이크 메뉴 수정에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, null);
		}
		
		System.out.println("수정할 음료 메뉴의 번호를 입력해주십시오");
		menuNo3 = Integer.parseInt(scanner.nextLine());
		System.out.println("수정할 음료 메뉴의 이름을 입력해주십시오");
		name3 = scanner.nextLine();
		System.out.println("수정할 생산자의 이름을 입력해주십시오");
		memberName3 = scanner.nextLine();
		
		try {
			String menuCorrectionSql3 = """
					UPDATE bakery_menu SET menu_name = ?, member_name = ?
					WHERE menu_no = ? AND menu_type = 'drink'
					""";
			
			pstmt = conn.prepareStatement(menuCorrectionSql3);
			pstmt.setString(1, name);
			pstmt.setString(2, memberName3);
			pstmt.setInt(3, menuNo3);
			pstmt.executeUpdate();
			
			System.out.println("음료 메뉴 수정에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, null);
		}
	}
	
	public void breadMenuCorrection() {
		System.out.println("수정할 빵 메뉴의 번호를 입력해주십시오");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.println("수정할 빵 메뉴의 이름을 입력해주십시오");
		name = scanner.nextLine();
		System.out.println("수정할 생산자의 이름을 입력해주십시오");
		memberName = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		
		try {
			String menuCorrectionSql = "UPDATE bakery_menu SET menu_name = ?, member_name = ? WHERE menu_no = ? AND menu_type = 'bread'";
			
			pstmt = conn.prepareStatement(menuCorrectionSql);
			pstmt.setString(1, name);
			pstmt.setString(2, memberName);
			pstmt.setInt(3, menuNo);
			pstmt.executeUpdate();
			
			System.out.println("빵 메뉴 수정에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, null);
		}
	}
	
	public void cakeMenuCorrection() {
		System.out.println("수정할 케이크 메뉴의 번호를 입력해주십시오");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.println("수정할 케이크 메뉴의 이름을 입력해주십시오");
		name = scanner.nextLine();
		System.out.println("수정할 생산자의 이름을 입력해주십시오");
		memberName = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		
		try {
			String menuCorrectionSql = """
					UPDATE bakery_menu SET menu_name = ?, member_name = ?
					WHERR menu_no = ? AND menu_type = 'cake'
					""";
			pstmt = conn.prepareStatement(menuCorrectionSql);
			pstmt.setString(1, name);
			pstmt.setString(2, memberName);
			pstmt.setInt(3, menuNo);
			pstmt.executeUpdate();
			
			System.out.println("케이크 메뉴 수정에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, null);
		}
	}
	
	public void drinkMenuCorrection() {
		System.out.println("수정할 음료 메뉴의 번호를 입력해주십시오");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.println("수정할 음료 메뉴의 이름을 입력해주십시오");
		name = scanner.nextLine();
		System.out.println("수정할 생산자의 이름을 입력해주십시오");
		memberName = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		
		try {
			String menuCorrectionSql = """
					UPDATE bakery_menu SET menu_name = ?, member_name = ?
					WHERE menu_no = ? AND menu_type = 'drink'
					""";
			pstmt = conn.prepareStatement(menuCorrectionSql);
			pstmt.setString(1, name);
			pstmt.setString(2, memberName);
			pstmt.setInt(3, menuNo);
			pstmt.executeUpdate();
			
			System.out.println("음료 메뉴 수정에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, null);
		}
	}
}
