package com.example.demo.dto;

import lombok.Data;

@Data
public class MemberDTO {
	private String memberId;
	private String password;
	private int managerCode;
	private String name;
	private String email;
	private int phoneNumber;
	private boolean chk;
}
