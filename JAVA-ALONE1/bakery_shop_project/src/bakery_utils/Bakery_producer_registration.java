package bakery_utils;

import java.util.*;
import java.sql.*;

public class Bakery_producer_registration {
	Scanner scanner = new Scanner(System.in);
	
	int menuNo = 0;
	String memberName = null;
	String memberId = null;
	String memberPassword = null;
	
	PreparedStatement pstmt = null;
	
	public void producerRegistrationMenu() {
		do{
			System.out.println("| <1> 생산자 등록 | <2> 등록된 생산자 조회 | <3> 메인 메뉴로 돌아가기 |");
			System.out.print("메뉴 번호를 입력하세요 -> ");
			menuNo = Integer.parseInt(scanner.nextLine());
			switch(menuNo) {
			case 1:
				System.out.println("생산자를 등록합니다");
				
				producerRegistration();
				break;
				
			case 2:
				System.out.println("등록된 생산자를 조회합니다");
				
				showProducer();
				break;
				
			case 3:
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
				
			default:
				System.out.println("1부터 3까지의 숫자를 입력해야합니다");
			}
		}while(!(menuNo == 3));	
	}
	
	public void producerRegistration() {
		System.out.println("등록할 생산자의 이름을 입력해주십시오");
		memberName = scanner.nextLine();
		System.out.println("등록할 생산자의 아이디를 입력해주십시오");
		memberId = scanner.nextLine();
		System.out.println("등록할 생산자의 비밀번호를 입력해주십시오");
		memberPassword = scanner.nextLine();
		
		Connection conn = Bakery_db_manager.getDBConnection();
		
		try {
			String registrationSql = """
					INSERT INTO MEMBER VALUES(?, ?, ?)
					""";
			
			pstmt = conn.prepareStatement(registrationSql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberId);
			pstmt.setString(3, memberPassword);
			pstmt.executeUpdate();
			
			System.out.println("생산자 등록에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, null);
		}
		
	}
	
	public void showProducer() {
		Connection conn = Bakery_db_manager.getDBConnection();
		
		ResultSet rs = null;
		
		try {
			String showSql = "SELECT member_name, member_id FROM MEMBER";
			
			pstmt = conn.prepareStatement(showSql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.printf("%-15s%-15s\n",
								rs.getString("member_name"),
								rs.getString("member_id")
						);
				
			}
			System.out.println("등록된 생산자 조회에 성공하였습니다");
		}catch(SQLException se) {
			System.out.println("error" + se.getMessage());
		}finally {
			Bakery_db_manager.dbclose(conn, pstmt, rs);
			
		}
	}
}
