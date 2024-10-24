package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MovieDTO {
	private int movieIdx;
	private String name;
	private String content;
	private String image;
	private String background;
	private int movieLike;
	private Date openingDate;
	private double movieRate;
}
