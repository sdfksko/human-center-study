package bakery;

import java.util.*;
import bakery_utils.*;
import java.sql.*;

public class BakeryService {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		Bakery_show_menu bSM = new Bakery_show_menu();
		Bakery_menu_development bMD = new Bakery_menu_development();
		Bakery_producer_check bPC = new Bakery_producer_check();
		Bakery_delete_menu bDM = new Bakery_delete_menu();
		Bakery_correction_menu bCM = new Bakery_correction_menu();
		Bakery_producer_registration bPR = new Bakery_producer_registration();
		
		int menuNo = 0;
		int resultRow = 0;
		String memberId = null;
		String password = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		while(true) {
			System.out.println("베이커리 프로그램에 접속하기 위해 아이디를 입력해주십시오");
			System.out.print("아이디: ");
			memberId = scanner.nextLine();
			
			Connection conn = Bakery_db_manager.getDBConnection();
			
			try{
				String countSql = """
						SELECT COUNT(*) FROM MEMBER WHERE member_id = ?
						""";
			
				pstmt = conn.prepareStatement(countSql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				resultRow = rs.getInt(1);
			}
			if(resultRow == 0) {
				System.out.println("등록되지 않은 아이디입니다");
				continue;
			}
			break;
			}catch(SQLException se) {
				System.out.println("error" + se.getMessage());
			}
		}
		System.out.println("베이커리 프로그램을 시작합니다");
		
		do {
			System.out.println("| <1> 메뉴판 보기 | <2> 메뉴 개발 | <3> 생산자 조회 | <4> 메뉴 삭제 | <5> 메뉴 수정| <6> 생산자 메뉴 | <7> 종료 |");
			System.out.print("메뉴 번호를 입력해주십시오 -> ");
			
			try{
				menuNo = Integer.parseInt(scanner.nextLine());
			}catch(NumberFormatException se) {
				System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("메뉴판 보기를 선택하셨습니다");
				
				bSM.showMenu();
				break;
				
			case 2:
				System.out.println("메뉴 개발을 선택하셨습니다");
				
				bMD.menuDevelopmentMenu();
				break;
				
			case 3:
				System.out.println("생산자 조회를 선택하셨습니다");
				
				bPC.menuProducerCheck();
				break;
				
			case 4:
				System.out.println("메뉴 삭제를 선택하셨습니다");
				
				bDM.deleteMenu();
				break;
				
			case 5:
				System.out.println("메뉴 수정을 선택하셨습니다");
				
				bCM.correctionMenu();
				break;
				
			case 6:
				System.out.println("생산자 메뉴로 이동합니다");
				
				bPR.producerRegistrationMenu();
				break;
			
			case 7:
				System.out.println("베이커리 프로그램을 종료합니다");
				break;
				
			default :
				System.out.println("1에서 7까지의 숫자만 입력해주십시오");
				break;
			}
		}while(!(menuNo == 7));

		scanner.close();
	}

}
