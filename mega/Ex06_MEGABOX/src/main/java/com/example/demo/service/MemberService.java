package com.example.demo.service;

import com.example.demo.dto.MemberDTO;

public interface MemberService {
	MemberDTO selectLogin(String memberId);
}
