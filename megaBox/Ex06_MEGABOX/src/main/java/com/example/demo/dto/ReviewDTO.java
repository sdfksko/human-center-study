package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int reviewIdx;
	private String title;
	private String content;
	private int reviewLike;
	private int movieRef;
	private Date regDate;
	private String userId;
	private int movieLike;
}
