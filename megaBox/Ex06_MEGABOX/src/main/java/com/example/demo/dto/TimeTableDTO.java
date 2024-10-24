package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class TimeTableDTO {
	private String location_name;
	private int movie_idx;
	private Date start_time;
	private String room_location;
	private String seat_no;
	private Date end_time;
}
