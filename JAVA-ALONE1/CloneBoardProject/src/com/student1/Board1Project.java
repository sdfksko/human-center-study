package com.student1;

import java.util.*;

public class Board1Project {
	public static void main(String[] args) {
		System.out.println("게시판 프로그램 시작");
		
		Board1Service boardService = new Board1Service(); // 게시판 접근 및 제어 객체 생성
		Scanner scanner = new Scanner(System.in);		  // 키보드입력 받는 객체
		int menuNumber = 0;
		// 0. 게시판 프로그램 대기를 위해 무한루프 코드 작성.
		while(true) {
			// 게시판 제목
			System.out.println("                   << 게시판 >>");
			// 게시판 메뉴
			System.out.println("(1.글작성, 2.글목록, 3.상세보기, 4.수정, 5.삭제, 6.종료)>>");
			
			// 1. 메뉴 선택번호를 입력받기
			try {
				menuNumber = Integer.parseInt(scanner.nextLine());
			} catch(InputMismatchException | NumberFormatException e) {
				System.out.println("올바른 번호를 입력해주십시오.");
				continue;
			}
			System.out.print("선택된 번호->" + menuNumber);
			
			if (menuNumber < 1 || menuNumber > 6) {
				System.out.println("\n메뉴 번호는 1~6번 사이의 숫자만 가능");
				continue;
			}
			
			switch(menuNumber) {
			case 1:	// 글 작성 실행 
				System.out.println("(글작성)");
				
				boardService.insertBoard();
				break;
			case 2: // 글목록 실행
				System.out.println("(글목록)");
				
				boardService.selectAllBoard();
				break;
			case 3: // 상세보기 실행
				System.out.println("(상세보기)");
				
				boardService.selectOneBoard();
				break;
			case 4: // 글수정 실행
				System.out.println("(글수정)");
				
				boardService.updateBoard();
				break;
			case 5: // 글삭제 실행
				System.out.println("(글삭제)");
				
				boardService.deleteBoard();
				break;
			}
			
			if(menuNumber == 6) {	// 6번일 때는 무한루프를 빠져나가게 하여 프로그램을 종료
				break;
			}
			
		}

		

		//프로그램 종료 표시
		System.out.println("게시판 프로그램 종료");

	}

}
