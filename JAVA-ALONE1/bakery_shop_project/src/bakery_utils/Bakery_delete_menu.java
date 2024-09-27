package bakery_utils;

import java.util.Scanner;
import java.sql.*;

public class Bakery_delete_menu {
	Scanner scanner = new Scanner(System.in);
	
	PreparedStatement pstmt = null;
	
	int menuNo = 0;
	int resultRows = 0;
	String name = null;
	
	public void deleteMenu() {
		do {
			System.out.println("| <1> 모든 메뉴 삭제 | <2> 빵 메뉴 삭제 | <3> 케이크 메뉴 삭제 | <4> 음료 메뉴 삭제 | <5> 메인 메뉴로 돌아가기");
			System.out.print("메뉴 번호를 선택해주십시오 -> ");
			
			try{
				menuNo = Integer.parseInt(scanner.nextLine());
			}catch(NumberFormatException se) {
				System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("모든 메뉴 삭제를 선택하셨습니다");
				
				deleteAllMenu();
				break;
				
			case 2:
				System.out.println("빵 메뉴 삭제를 선택하셨습니다");
				
				deleteBreadMenu();
				break;
				
			case 3:
				System.out.println("케이크 메뉴 삭제를 선택하셨습니다");
				
				deleteCakeMenu();
				break;
				
			case 4:
				System.out.println("음료 메뉴 삭제를 선택하셨습니다");
				
				deleteDrinkMenu();
				break;
				
			default:
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
			}
		}while(!(menuNo == 5));
		
	}
	
	public void deleteAllMenu() {
		System.out.println("삭제할 빵의 이름을 입력해주십시오");
		name = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		try {
			String deleteMenuSql = "DELETE FROM bakery_menu WHERE menu_name = ? AND menu_type = 'bread'";
			
			pstmt = conn.prepareCall(deleteMenuSql);
			pstmt.setString(1, name);
			resultRows = pstmt.executeUpdate();
			
			System.out.println("빵 메뉴 " +name + " 삭제되었습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
		
		System.out.println("삭제할 케이크의 이름을 입력해주십시오");
		name = scanner.nextLine();
		
		try {
			String deleteMenuSql = "DELETE FROM bakery_menu WHERE menu_name = ? AND menu_type = 'cake'";
			
			pstmt = conn.prepareCall(deleteMenuSql);
			pstmt.setString(1, name);
			resultRows = pstmt.executeUpdate();
			
			System.out.println("케이크 메뉴 " + name + " 삭제되었습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
		
		System.out.println("삭제할 음료의 이름을 입력해주십시오");
		name = scanner.nextLine();
		
		try {
			String deleteMenuSql = "DELETE FROM bakery_menu WHERE menu_name = ? AND menu_type = 'drink'";
			
			pstmt = conn.prepareCall(deleteMenuSql);
			pstmt.setString(1, name);
			resultRows = pstmt.executeUpdate();
			
			System.out.println("음료 메뉴 " + name + " 삭제되었습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
	}
	
	public void deleteBreadMenu() {
		System.out.println("삭제할 빵의 이름을 입력해주십시오");
		name = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		try {
			String deleteMenuSql = "DELETE FROM bakery_menu WHERE menu_name = ? AND menu_type = 'bread'";
			
			pstmt = conn.prepareCall(deleteMenuSql);
			pstmt.setString(1, name);
			resultRows = pstmt.executeUpdate();
			
			System.out.println("빵 메뉴 " +name + " 삭제되었습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
	}
	
	public void deleteCakeMenu() {
		System.out.println("삭제할 케이크의 이름을 입력해주십시오");
		name = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		try {
			String deleteMenuSql = "DELETE FROM bakery_menu WHERE menu_name = ? AND menu_type = 'cake'";
			
			pstmt = conn.prepareCall(deleteMenuSql);
			pstmt.setString(1, name);
			resultRows = pstmt.executeUpdate();
			
			System.out.println("케이크 메뉴 " + name + " 삭제되었습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
	}
	
	public void deleteDrinkMenu() {
		System.out.println("삭제할 음료의 이름을 입력해주십시오");
		name = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		try {
			String deleteMenuSql = "DELETE FROM bakery_menu WHERE menu_name = ? AND menu_type = 'drink'";
			
			pstmt = conn.prepareCall(deleteMenuSql);
			pstmt.setString(1, name);
			resultRows = pstmt.executeUpdate();
			
			System.out.println("음료 메뉴 " + name + " 삭제되었습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
	}
	
}
