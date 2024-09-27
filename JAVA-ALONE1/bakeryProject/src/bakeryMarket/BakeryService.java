package bakeryMarket;

import java.util.*;

public class BakeryService {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int menuNo = 0;
		
		System.out.println("베이커리 마켓 프로그램 시작");
		do{
			System.out.println("| <1> 메뉴판 보기 | <2> 메뉴 개발 | <3> 제품 생산 | <4> 제품 생산자 조회 | <5> 메뉴 삭제 | <6> 메뉴 수정 | <7> 종료 |");
			System.out.print("메뉴 번호를 입력해주십시오 > ");
			
			try{
				menuNo = Integer.parseInt(scanner.nextLine());
			}catch(NumberFormatException e) {
				System.out.println("올바른 값이 아닙니다. 숫자로 입력해주십시오");
			}
			
			switch(menuNo) {
				case 1:
				System.out.println("메뉴판 보기");
				break;
				
				case 2:
					System.out.println("메뉴 개발");
					break;
					
				case 3:
					System.out.println("제품 생산");
					break;
					
				case 4:
					System.out.println("제품 생산자 조회");
					break;
					
				case 5:
					System.out.println("메뉴 삭제");
					break;
					
				case 6:
					System.out.println("메뉴 수정");
					break;
				
				case 7:
					System.out.println("프로그램을 종료합니다");
					break;
				default:
					System.out.println("1에서 7사이의 숫자만 입력해주세요");
					break;
			}
			
		}while(menuNo!=7);
		scanner.close();
	}

}
