package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.TimeTableDTO;

public interface TimeTableService {
	List<TimeTableDTO> selectMovieName(String type,String location_name,int movie_idx,String room_location,String time);
	List<TimeTableDTO> selectTheaterFirst(String location_name);
	List<TimeTableDTO> selectTheaterSecond(String location_name,int movie_idx,String room_location);
}
