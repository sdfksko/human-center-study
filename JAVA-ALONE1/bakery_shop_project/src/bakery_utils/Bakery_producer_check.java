package bakery_utils;

import java.util.Scanner;
import java.sql.*;

public class Bakery_producer_check {
	Scanner scanner = new Scanner(System.in);
	
	int menuNo = 0;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void menuProducerCheck() {
		do {
			System.out.println("| <1> 모든 메뉴 생산자 조회 | <2> 빵 메뉴 생산자 조회 | <3> 케이크 메뉴 생산자 조회 | <4> 음료 메뉴 생산자 조회 | <5> 특정 생산자 조회 | <6> 메인 메뉴로 돌아가기");
			System.out.print("메뉴 번호를 선택해주십시오 -> ");
			
			try{
				menuNo = Integer.parseInt(scanner.nextLine());
			}catch(NumberFormatException se) {
				System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("모든 메뉴 생산자 조회를 선택하셨습니다");
				
				allProducerCheck();
				break;
				
			case 2:
				System.out.println("빵 메뉴 생산자 조회를 선택하셨습니다");
				
				breadProducerCheck();
				break;
				
			case 3:
				System.out.println("케이크 메뉴 생산자 조회를 선택하셨습니다");
				
				cakeProducerCheck();
				break;
				
			case 4:
				System.out.println("음료 메뉴 생산자 조회를 선택하셨습니다");
				
				drinkProducerCheck();
				break;
				
			case 5:
				System.out.println("특정 생산자 조회를 선택하셨습니다");
				break;
				
			default:
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
			}
		}while(!(menuNo == 6));
		
	}
	
	public void allProducerCheck() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		try{
			String allProducerSql = """
					SELECT menu_name, menu_type, member_name 
					FROM bakery_menu ORDER BY menu_type
					""";
		
			pstmt = conn.prepareCall(allProducerSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%-15s%-15s%-15s\n",
							rs.getString("menu_type"),
							rs.getString("menu_name"),
							rs.getString("member_name"));
			}
			System.out.println("모든 생산자 조회에 성공하였습니다");
			
		}catch(SQLException se){
			System.out.println("error" + se.getMessage());
		}
		
	}
	
	public void breadProducerCheck() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		try {
			String breadProducerSql = """
				SELECT menu_name, menu_type, member_name 
				FROM bakery_menu WHERE menu_type = 'bread'
				""";
			
			pstmt = conn.prepareStatement(breadProducerSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%-15s%-15s%-15s\n",
							rs.getString("menu_type"),
							rs.getString("menu_name"),
							rs.getString("member_name"));
			}
			System.out.println("빵 생산자 조회에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
	}
	
	public void cakeProducerCheck() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		try{
			String cakeProducerSql = """
					SELECT menu_name, menu_type, member_name FROM bakery_menu
					WHERE menu_type = 'cake'
					""";
			pstmt = conn.prepareStatement(cakeProducerSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%-15s%-15s%-15s\n",
								rs.getString("menu_type"),
								rs.getString("menu_name"),
								rs.getString("member_name"));
			}
			System.out.println("케이크 생산자 조회에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
	}

	public void drinkProducerCheck() {
		Connection conn = Bakery_db_manager.getDBConnection();
		try {
			String drinkProducerSql = """
					SELECT menu_name, menu_type, member_name FROM bakery_menu
					WHERE menu_type = 'drink'
					""";
			pstmt = conn.prepareStatement(drinkProducerSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%-15s%-15s%-15s\n",
									rs.getString("menu_type"),
									rs.getString("menu_name"),
									rs.getString("member_name"));
			}
			System.out.println("음료 생산자 조회에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}
	}
}
