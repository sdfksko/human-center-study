package bakery.util;

import java.util.Scanner;
import BakeryMarket.BakeryServiceMenu;

public class BakeryUpdateMenu {
	public void updateMenu() {
		BakeryServiceMenu bSM = new BakeryServiceMenu();
		Scanner scanner = new Scanner(System.in);
		int menuNo = 0;
		System.out.println(String.format("%68s","Bakery 기존 메뉴에 품목 추가하기"));
	
		while(true) {
			System.out.println(String.format("%73s", "<<<<< Bakery 기존 메뉴에 품목 추가 >>>>>"));
			System.out.println(
							  String.format("%35s", "| <1> 빵 품목 추가 | ")
							   + "<2> 케이크 품목 추가 | "
							   + "<3> 음료 품목 추가 | "
							   + "<4> 메인 메뉴로 돌아가기 | "
							   );
		   try {
				menuNo = Integer.parseInt(scanner.nextLine());
			} catch (NumberFormatException se) {
				System.out.println("올바른 숫자를 입력해주십시오.");
			}
								
			if (0 < menuNo && menuNo < 5) {
			} else {
				System.out.println("menuNo는 0보다 크고 5보다 작은 숫자로 입력하여야 합니다.");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("빵 품목 추가");
				
				bSM.updateOneBMenu();
				break;
			case 2:
				System.out.println("케이크 품목 추가");
				
				bSM.updateOneCMenu();
				break;
			case 3:
				System.out.println("음료 품목 추가");
				
				bSM.updateOneDMenu();
				break;
			}
			
			if (menuNo == 4) {
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
			}
		}				
	}
}
