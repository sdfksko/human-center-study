package bakery_utils;

import java.util.Scanner;
import java.sql.*;


public class Bakery_menu_development {
	Scanner scanner = new Scanner(System.in);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int menuNo = 0;
	int count = 0;
	int resultRows = 0;
	String name = null;
	String menu_type = null;
	String member_name = null;
	
	public void menuDevelopmentMenu() {
		do {
			System.out.println("| <1> 모든 메뉴 개발 | <2> 빵 메뉴 개발 | <3> 케이크 메뉴 개발 | <4> 음료 메뉴 개발 | <5> 메인 메뉴로 돌아가기");
			System.out.print("메뉴 번호를 선택해주십시오 -> ");
			
			try{
				menuNo = Integer.parseInt(scanner.nextLine());
			}catch(NumberFormatException se) {
				System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("모든 메뉴 개발을 선택하셨습니다");
				
				allMenuDevelopment();
				break;
				
			case 2:
				System.out.println("빵 메뉴 개발을 선택하셨습니다");
				
				breadMenuDevelopment();
				break;
				
			case 3:
				System.out.println("케이크 메뉴 개발을 선택하셨습니다");
				
				cakeMenuDevelopment();
				break;
				
			case 4:
				System.out.println("음료 메뉴 개발을 선택하셨습니다");
				
				drinkMenuDevelopment();
				break;
				
			default:
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
			}
		}while(!(menuNo == 5));
		
	}
	
	public void allMenuDevelopment() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		System.out.print("개발할 빵의 메뉴번호를 입력해주십시오 -> ");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.print("개발할 빵의 이름을 입력해주십시오 -> ");
		name = scanner.nextLine();
		
		while(true) {
			System.out.print("개발한 사람의 이름을 입력해주십시오 -> ");
			member_name = scanner.nextLine();
			
			try {
			    String countSql = "SELECT COUNT(*) FROM MEMBER WHERE member_name = ?";
					
				pstmt = conn.prepareStatement(countSql);
				pstmt.setString(1, member_name);
			
				rs = pstmt.executeQuery();
			
				if(rs.next() && rs.getInt(1) == 0) {
					System.out.println("등록되지않은 사용자 이름입니다. 등록된 사용자의 이름을 입력해주십시오");
					continue;
				}
				break;
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		}
			
		try {
			String breadMenuSql = "INSERT INTO bakery_menu VALUES(?, ?, 'bread', ?)";
			
			pstmt = conn.prepareStatement(breadMenuSql);
			pstmt.setInt(1, menuNo);
			pstmt.setString(2, name);
			pstmt.setString(3, member_name);
			
			resultRows = pstmt.executeUpdate();
			
			System.out.println("새로 개발한 빵의 메뉴번호: " + menuNo +
						   		" 이름: " + name +
						   		" 생산자 이름: " + member_name
						   		);
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, rs);
		}
			
		System.out.print("개발할 케이크의 메뉴번호를 입력해주십시오 -> ");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.print("개발할 케이크의 이름을 입력해주십시오 -> ");
		name = scanner.nextLine();
		
		while(true) {
			System.out.print("개발한 사람의 이름을 입력해주십시오 -> ");
			member_name = scanner.nextLine();
				
			try {
			    String countSql = "SELECT COUNT(*) FROM MEMBER WHERE member_name = ?";
						
				pstmt = conn.prepareStatement(countSql);
				pstmt.setString(1, member_name);
				
				rs = pstmt.executeQuery();
				
				if(rs.next() && rs.getInt(1) == 0) {
					System.out.println("등록되지않은 사용자 이름입니다. 등록된 사용자의 이름을 입력해주십시오");
					continue;
				}
				break;
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		}
				
		try {
			String cakeMenuSql = "INSERT INTO bakery_menu VALUES(?, ?, 'cake', ?)";
				
			pstmt = conn.prepareStatement(cakeMenuSql);
			pstmt.setInt(1, menuNo);
			pstmt.setString(2, name);
			pstmt.setString(3, member_name);
				
			resultRows = pstmt.executeUpdate();
				
			System.out.println("새로 개발한 케이크의 메뉴번호: " + menuNo +
						   		" 이름: " + name +
						   		" 생산자 이름: " + member_name
						   		);
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, rs);
		}
				
		System.out.print("개발할 음료의 메뉴번호를 입력해주십시오 -> ");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.print("개발할 음료의 이름을 입력해주십시오 -> ");
		name = scanner.nextLine();
		
		while(true) {
			System.out.print("개발한 사람의 이름을 입력해주십시오 -> ");
			member_name = scanner.nextLine();
					
			try {
			    String countSql = "SELECT COUNT(*) FROM MEMBER WHERE member_name = ?";
							
				pstmt = conn.prepareStatement(countSql);
				pstmt.setString(1, member_name);
					
				rs = pstmt.executeQuery();
					
				if(rs.next() && rs.getInt(1) == 0) {
					System.out.println("등록되지않은 사용자 이름입니다. 등록된 사용자의 이름을 입력해주십시오");
					continue;
				}
				break;
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		}
		try {
			String drinkMenuSql = "INSERT INTO bakery_menu VALUES(?, ?, 'drink', ?)";
					
			pstmt = conn.prepareStatement(drinkMenuSql);
			pstmt.setInt(1, menuNo);
			pstmt.setString(2, name);
			pstmt.setString(3, member_name);
					
			resultRows = pstmt.executeUpdate();
					
			System.out.println("새로 개발한 음료의 메뉴번호: " + menuNo +
						   		" 이름: " + name +
						   		" 생산자 이름: " + member_name
									   		);
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, rs);
		}
	}
	
	
	public void breadMenuDevelopment() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		System.out.print("개발할 빵의 메뉴번호를 입력해주십시오 -> ");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.print("개발할 빵의 이름을 입력해주십시오 -> ");
		name = scanner.nextLine();
		
		while(true) {
			System.out.print("개발한 사람의 이름을 입력해주십시오 -> ");
			member_name = scanner.nextLine();
			
			try {
			    String countSql = "SELECT COUNT(*) FROM MEMBER WHERE member_name = ?";
					
				pstmt = conn.prepareStatement(countSql);
				pstmt.setString(1, member_name);
			
				rs = pstmt.executeQuery();
			
				if(rs.next() && rs.getInt(1) == 0) {
					System.out.println("등록되지않은 사용자 이름입니다. 등록된 사용자의 이름을 입력해주십시오");
					continue;
				}
				break;
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		}
		
		try {
			String breadMenuSql = "INSERT INTO bakery_menu VALUES(?, ?, 'bread', ?)";
			
			pstmt = conn.prepareStatement(breadMenuSql);
			pstmt.setInt(1, menuNo);
			pstmt.setString(2, name);
			pstmt.setString(3, member_name);
			
			resultRows = pstmt.executeUpdate();
			
			System.out.println("새로 개발한 빵의 메뉴번호: " + menuNo +
						   		" 이름: " + name +
						   		" 생산자 이름: " + member_name
					   			);
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, rs);
		}
	}
	
	public void cakeMenuDevelopment() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		System.out.print("개발할 케이크의 메뉴번호를 입력해주십시오 -> ");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.print("개발할 케이크의 이름을 입력해주십시오 -> ");
		name = scanner.nextLine();
		while(true) {
			System.out.print("개발한 사람의 이름을 입력해주십시오 -> ");
			member_name = scanner.nextLine();
			
			try {
			    String countSql = "SELECT COUNT(*) FROM MEMBER WHERE member_name = ?";
					
				pstmt = conn.prepareStatement(countSql);
				pstmt.setString(1, member_name);
			
				rs = pstmt.executeQuery();
			
				if(rs.next() && rs.getInt(1) == 0) {
					System.out.println("등록되지않은 사용자 이름입니다. 등록된 사용자의 이름을 입력해주십시오");
					continue;
				}
				break;
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		}
		
		try {
			String cakeMenuSql = "INSERT INTO bakery_menu VALUES(?, ?, 'cake', ?)";
			
			pstmt = conn.prepareStatement(cakeMenuSql);
			pstmt.setInt(1, menuNo);
			pstmt.setString(2, name);
			pstmt.setString(3, member_name);
			
			resultRows = pstmt.executeUpdate();
			
			System.out.println("새로 개발한 케이크의 메뉴번호: " + menuNo +
						   		" 이름: " + name +
						   		" 생산자 이름: " + member_name
						   		);
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, rs);
			}
	}
	
	public void drinkMenuDevelopment() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		System.out.print("개발할 음료의 메뉴번호를 입력해주십시오 -> ");
		menuNo = Integer.parseInt(scanner.nextLine());
		System.out.print("개발할 음료의 이름을 입력해주십시오 -> ");
		name = scanner.nextLine();
		
		while(true) {
			System.out.print("개발한 사람의 이름을 입력해주십시오 -> ");
			member_name = scanner.nextLine();
			
			try {
			    String countSql = "SELECT COUNT(*) FROM MEMBER WHERE member_name = ?";
					
				pstmt = conn.prepareStatement(countSql);
				pstmt.setString(1, member_name);
			
				rs = pstmt.executeQuery();
			
				if(rs.next() && rs.getInt(1) == 0) {
					System.out.println("등록되지않은 사용자 이름입니다. 등록된 사용자의 이름을 입력해주십시오");
					continue;
				}
				break;
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		}
		
		try {
			String drinkMenuSql = "INSERT INTO bakery_menu VALUES(?, ?, 'drink', ?)";
			
			pstmt = conn.prepareStatement(drinkMenuSql);
			pstmt.setInt(1, menuNo);
			pstmt.setString(2, name);
			pstmt.setString(3, member_name);
			
			resultRows = pstmt.executeUpdate();
			
			System.out.println("새로 개발한 음료의 메뉴번호: " + menuNo +
						   		" 이름: " + name +
						   		" 생산자 이름: " + member_name
						   		);
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, rs);
		}
	}
}

