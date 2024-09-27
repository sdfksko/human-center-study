package com.example.demo.calendar;

import java.util.ArrayList;
import java.util.List;

public class Calendar {

	public static void main(String[] args) {
		List<CalendarDTO> li = Calendar.prn(2024, 8, 1);
		for(var l : li) {
			System.out.println(l);
		}
	}

	// 윤년 계산
	private static boolean isLeapYear(int year) {
		boolean leap = false;

		if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
			leap = true;
		}
		return leap;
	}

	private static int getDate(int year, int month) {
		int tmp = 0;

		if (isLeapYear(year)) {

			switch (month) {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				tmp = 31;
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				tmp = 30;
				break;
			case 2:
				tmp = 29;
				break;
			}
		} else {
			if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
				tmp = 31;
			} else if (month == 4 || month == 6 || month == 9 || month == 11) {
				tmp = 30;
			} else if (month == 2) {
				tmp = 28;
			}
		}
		return tmp;
	}

	// 해당 월의 첫번쨰 요일 계산
	private static int getDayOfWeek(int year, int month) {
		int dayOfWeek = 0;
		int sum = 0;

		// 1.1.1 ~ year-1.12.31
		for (int i = 1; i < year; i++) {
			for (int j = 1; j <= 12; j++) {
				sum += getDate(i, j);
			}
		}

		// year.1.1 ~ year.month-1.마지막(31,30.29.28)
		for (int k = 1; k < month; k++) {
			sum += getDate(year, k);
		}

		// year.month.1일
		sum += 1;

		// 요일
		dayOfWeek = sum % 7;
		
		return dayOfWeek;
	}

	public static List<CalendarDTO> prn(int year, int month, int day) {
		// 달력 윗부분 출력

		List<CalendarDTO> li = new ArrayList<>();
		// 시작 요일
		// 마지막 날짜
		int last = getDate(year, month);

		int start = Calendar.getDayOfWeek(year, month);
		System.out.println("start : "+start);
		// 달력출력
		for (int i = day; i <= last; i++) {
			if(li.size()>=14)break;
			li.add(new CalendarDTO(month,i,dayKorea((i+start-1)%7)));
		}
		if (li.size() < 14) {
			int end2 = Calendar.getDate(year, month + 1);
			int start2 = Calendar.getDayOfWeek(year, month+1);
			for (int i = 1; i <= end2; i++) {
				if(li.size()>=14)break;
				li.add(new CalendarDTO(month+1,i,dayKorea((i+start2-1)%7)));
			}
		}
		return li;
	}
	public static String dayKorea(int day) {
		String result = "";
		switch(day) {
		case 1:
			result="월";
			break;
		case 2:
			result="화";
			break;
		case 3:
			result="수";
			break;
		case 4:
			result="목";
			break;
		case 5:
			result="금";
			break;
		case 6:
			result="토";
			break;
		default:
			result="일";
			break;
		}
		return result;
	}
}
