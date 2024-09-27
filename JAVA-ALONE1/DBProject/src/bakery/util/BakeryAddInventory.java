package bakery.util;

import java.util.Scanner;
import BakeryMarket.BakeryServiceMenu;

public class BakeryAddInventory {
	BakeryServiceMenu bSM = new BakeryServiceMenu();
	Scanner scanner = new Scanner(System.in);
	int menuNo = 0;
	public void addInventory() {
		System.out.println(String.format("%65s", "Bakery 품목 재고 추가하기"));

		while(true) {
			System.out.println(String.format("%70s", "<<<<< Bakery 품목 재고 추가 >>>>>"));
			System.out.println(
					  		String.format("%35s", "| <1> 빵 재고 추가 | ")
						   + "<2> 케이크 재고 추가 | "
						   + "<3> 음료 재고 추가 | "
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
				System.out.println("빵 재고 추가");
				
				bSM.updateBreadInventory();
				break;
			case 2:
				System.out.println("케이크 재고 추가");
				
				bSM.updateCakeInventory();
				break;
			case 3:
				System.out.println("음료 재고 추가");
				
				bSM.updateDrinkInventory();
				break;
			}
		
		if (menuNo == 4) {
			System.out.println("메인 메뉴로 돌아갑니다");
			break;
		}
		
		}				
	}
}
