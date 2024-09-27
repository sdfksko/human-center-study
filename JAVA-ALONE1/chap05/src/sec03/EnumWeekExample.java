package sec03;

import java.util.Calendar;

public class EnumWeekExample {
	
	public static void main(String[] args) {
		Week week1 = Week.SATURDAY;
		Week week2 = Week.SATURDAY;
		System.out.println(week1 == week2); // true
		
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR); // final int 변수 -> 연도
		System.out.println("현재연도: " + year);
		int month = now.get(Calendar.MONTH + 1); // java에서는 1월일 때 0값을 돌려줌
		System.out.println("현재월: " + month);
		int day = now.get(Calendar.DAY_OF_MONTH);  // 일
		System.out.println("현재일: " + day);
		int week = now.get(Calendar.DAY_OF_WEEK);  // 요일(1~7) : 일요일 -> 1, 월요일 -> 2 ...
		System.out.println("현재요일: " + week);
		int hour = now.get(Calendar.HOUR);				// 시
		System.out.println("현재시간: " + hour);		
		int minute = now.get(Calendar.MINUTE); 			// 분
		System.out.println("현재분: " + minute);		
		int second = now.get(Calendar.SECOND);			// 초
		System.out.println("현재초: " + second);
		
		// ----------------------------------------------------------
		
		Week today = null;
		
		Calendar cal = Calendar.getInstance();
		int week3 = cal.get(Calendar.DAY_OF_WEEK);
		
		switch(week3) {
			case 1:
				today = Week.SUNDAY; break;
			case 2:
				today = Week.MONDAY; break;
			case 3:
				today = Week.TUESDAY; break;
			case 4:
				today = Week.WEDNESDAY; break;
			case 5:
				today = Week.THURSDAY; break;
			case 6:
				today = Week.FRIDAY; break;
			case 7:
				today = Week.SATURDAY; break;
				}
		System.out.println("오늘 요일: " + today);
		
		if(today == Week.SUNDAY) {
			System.out.println("일요일에는 축구를 합니다.");
		} else {
			System.out.println("열심히 자바 공부합니다.");
		}
	}

}
