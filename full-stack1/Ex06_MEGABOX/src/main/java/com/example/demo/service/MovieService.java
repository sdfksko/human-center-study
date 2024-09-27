package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.MovieDTO;

public interface MovieService {
	List<MovieDTO> select();
	MovieDTO selectByIdx(int idx);
	List<MovieDTO> selectMovieName(String name);
}
