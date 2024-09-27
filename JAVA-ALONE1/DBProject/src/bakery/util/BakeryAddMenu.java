package bakery.util;

import java.util.*;
import BakeryMarket.BakeryServiceMenu;

public class BakeryAddMenu {
	Scanner scanner = new Scanner(System.in);
	BakeryServiceMenu bSM  = new BakeryServiceMenu();
	int menuNo = 0;
	public void addMenu() {
		System.out.println(String.format("%70s", "Bakery 매장 품목 추가하기"));
	
		while(true) {
			System.out.println(String.format("%74s", "<<<<< Bakery 품목 추가 >>>>>"));
			System.out.println(
							  String.format("%35s", "| <1> 빵 메뉴 추가 | ")
							   + "<2> 케이크 메뉴 추가 | "
							   + "<3> 음료 메뉴 추가 | "
							   + "<4> 모든 메뉴 추가 | "
							   + "<5> 메인 메뉴로 돌아가기 | "
							   );
		   try {
				menuNo = Integer.parseInt(scanner.nextLine());
			} catch (NumberFormatException se) {
				System.out.println("올바른 숫자를 입력해주십시오.");
			}
								
			if (0 < menuNo && menuNo < 6) {
			} else {
				System.out.println("menuNo는 0보다 크고 6보다 작은 숫자로 입력하여야 합니다.");
			}
			
			switch(menuNo) {
			case 1:
				System.out.println("빵 메뉴 추가");
				
				bSM.addBreadMenu();
				break;
			case 2:
				System.out.println("케이크 메뉴 추가");
				
				bSM.addCakeMenu();
				break;
			case 3:
				System.out.println("음료 메뉴 추가");
				
				bSM.addDrinkMenu();
				break;
			case 4:
				System.out.println("모든 메뉴 추가");
				
				bSM.addAllMenu();
				break;
			}
			
			if (menuNo == 5) {
				System.out.println("메인 메뉴로 돌아갑니다");
				break;
			}
		}				
	}
}

	