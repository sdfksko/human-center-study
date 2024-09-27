package BakeryMarket;

import java.util.*;

import bakery.util.BakeryAddInventory;
import bakery.util.BakeryAddMenu;
import bakery.util.BakeryUpdateMenu;
import bakery.util.BakeryDeleteMenu;
import bakery.util.BakeryCorrectionMenu;

public class BakeryMarketService {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		BakeryAddMenu bAM = new BakeryAddMenu();
		BakeryUpdateMenu bUM = new BakeryUpdateMenu();
		BakeryAddInventory bAI = new BakeryAddInventory();
		BakeryDeleteMenu bDM = new BakeryDeleteMenu();
		BakeryServiceMenu bSM = new BakeryServiceMenu();
		BakeryCorrectionMenu bCM = new BakeryCorrectionMenu();
		int menuNo = 0;
		System.out.println(String.format("%70s", "Bakery 프로그램 접속"));
		
		while(true) {
			System.out.println(String.format("%73s", "<<<<< Bakery >>>>>"));
			System.out.println(
					String.format("%30s", "| <1> 메뉴 목록 보기 | ")
					+ "<2> 메뉴 추가 | "
					+ "<3> 기존 메뉴에 품목 추가 | "
					+ "<4> 품목 재고 추가 | "
					+ "<5> 메뉴 삭제 | "
					+ "<6> 기존 메뉴 수정 | "
					+ "<7> 종료 | "
					);
				
			try {
				menuNo = Integer.parseInt(scanner.nextLine());
			} catch (NumberFormatException se) {
				System.out.println("올바른 숫자를 입력해주십시오.");
			}
			
			if (!(menuNo > 0 && menuNo < 8)) {
				System.out.println("메뉴 번호는 0보다 크고 8보다 작은 숫자로 입력하여야 합니다.");
			}
			
			switch(menuNo) {
			case 1: // 목록 보기
				System.out.println("메뉴 목록");
				
				bSM.allMenu();
				break;
			
			case 2: // 메뉴 추가
				System.out.println("메뉴 추가");
				
				bAM.addMenu();
				break;
			
			case 3: // 기존 메뉴 추가
				System.out.println("기존 메뉴 품목 추가");
				
				bUM.updateMenu();
				break;
				
			case 4: // 품목 재고 추가
				System.out.println("품목 재고 추가");
				
				bAI.addInventory();
				break;
			
			case 5: // 메뉴 삭제
				System.out.println("메뉴 삭제");
				
				bDM.deleteService();
				break;
				
			case 6: // 메뉴 수정
				System.out.println("메뉴 수정");
				
				bCM.correctionMenu();
				break;
			}
			
			if (menuNo == 7) {
				break;
			}
		}
		
		System.out.println("                                                    Bakery 프로그램 종료                            ");

	}

}
