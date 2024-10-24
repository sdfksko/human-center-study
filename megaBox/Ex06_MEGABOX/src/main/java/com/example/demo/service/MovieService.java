package com.example.demo.service;

import java.util.HashMap;
import java.util.List;

import com.example.demo.dto.MovieDTO;

public interface MovieService {
	List<MovieDTO> select();
	MovieDTO selectByIdx(int idx);
	HashMap<String, Object> selectTicketing(String openingDate, String name);
	List<MovieDTO> selectMovieName(String name);
}
