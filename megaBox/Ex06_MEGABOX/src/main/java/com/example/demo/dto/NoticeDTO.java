package com.example.demo.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDTO {
	private int idx;
	private int row_num;
	private String name;
	private String category;
	private String title;
	private String content;
	private Date regDate;
}
