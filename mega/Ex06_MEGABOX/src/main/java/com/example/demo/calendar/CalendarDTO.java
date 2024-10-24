package com.example.demo.calendar;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class CalendarDTO{
	private int month;
	private int day;
	private String dayOfWeek;
	public CalendarDTO(int month,int day,String dayOfWeek) {
		this.month=month;
		this.day=day;
		this.dayOfWeek=dayOfWeek;
	}
}

