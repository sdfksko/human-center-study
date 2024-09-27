package com.jiwoon;

import java.io.*;
import java.util.*;


public class EnglishNote02 {
	
	Scanner scanner = new Scanner(System.in);
	List<EnglishNote> listENote = new ArrayList<>();
	
	private int counter = 0;
	private int h = 1;
	private int a;
	private String b;
	private String c;
	
	public void menu() throws Exception {
		while(true) {
		System.out.println("--------------------------------------------");
		System.out.println("1. 등록하기  |  2. 목록보기  |  3. 수정하기  |"
				+ "  4. 삭제하기  |  5. 파일저장  |  6. 파일불러오기  |  7. 종료");
		System.out.println("--------------------------------------------");
		System.out.print("선택: ");
		String Number = scanner.nextLine();
		switch (Number) {
		case "1":
			add();
			break;
		case "2":
			showMenu();
			break;
		case "3":
			correction();
			break;
		case "4":
			delete();
			break;
		case "5":
			save();
			break;
		case "6":
			read();
			break;
		case "7":
			end();
			return;
			}
		}
	}
	
	public void add() {
		EnglishNote str = new EnglishNote();
		str.seteNum(++counter);
		
		System.out.print("영어단어: ");
		str.setEnglish(scanner.nextLine());
		
		System.out.print("영어단어의 뜻: ");
		str.setAnswer(scanner.nextLine());
		
		listENote.add(str);
	}
	
	public void showMenu() {
		for(EnglishNote str : listENote) {
			System.out.println(
					str.geteNum() + " 영어단어: " +
					str.getEnglish() + " " + "영어단어의 뜻: " +
					str.getAnswer()
					);
		}
	}
	
	
	public void correction() {
		for(int i = 0; i < listENote.size(); i++) {
			EnglishNote str = listENote.get(i);
			System.out.println(
					str.geteNum() + " 영어단어: " +
					str.getEnglish() + " " + "영어단어의 뜻: " +
					str.getAnswer()
					);
			
			
		}
		System.out.print("수정할 단어의 번호를 입력하십시오. 번호 입력: ");
		int b = Integer.parseInt(scanner.nextLine());
		EnglishNote eN = listENote.get(b - 1);
		
		System.out.print("영어단어: ");
		eN.setEnglish(scanner.nextLine());
		System.out.print("영어단어의 뜻: ");
		eN.setAnswer(scanner.nextLine());
		
		listENote.set(b - 1, eN);
		
	}
	
	
	public void delete() {
		System.out.print("삭제할 단어의 번호를 입력하십시오. 번호 입력: ");
		int b;
		int v;
		b = Integer.parseInt(scanner.nextLine());
		listENote.remove(b - 1);
		for(int i = 0; i < listENote.size(); i++) {
			EnglishNote str = listENote.get(i);
			
			
			
		}
	}
	public void save() throws Exception {
		try {
			FileOutputStream fileOutputStream = new FileOutputStream("EngNote.txt");
			ObjectOutputStream printStream = new ObjectOutputStream(fileOutputStream);
			printStream.writeObject(listENote);
			printStream.flush();
			printStream.close();
	        fileOutputStream.close();
	        System.out.println("저장이 완료되었습니다");
		 
		}	catch(Exception e) {
			System.out.println("저장이 실패하였습니다.");
		}
	
		
	}
	
	public List<EnglishNote> read() throws Exception {
		

        try (FileInputStream fileInputStream = new FileInputStream("EngNote.txt");
             ObjectInputStream fin = new ObjectInputStream(fileInputStream)) {
            listENote = (List<EnglishNote>) fin.readObject();
            
            System.out.println("파일불러오기에 성공하였습니다.");
        } catch (Exception e) {
            System.out.println("파일불러오기에 실패하였습니다.");
        }

        return listENote;
	}
	
//	public read() throws Exception {
//		
//	}
	
	public void end() {
		System.out.println("노트를 덮습니다");
	}
	
	

}
