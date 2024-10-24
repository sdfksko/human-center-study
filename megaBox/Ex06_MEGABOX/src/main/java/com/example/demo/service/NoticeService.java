package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.NoticeDTO;

public interface NoticeService {
	List<NoticeDTO> selectAll(int startNo,int size,String type,String title);
	int selectCount(String title,String type);
	NoticeDTO selectByIdx(int idx);
	NoticeDTO selectPrevAndNext(String type,int idx);
	List<NoticeDTO> selectTheaterNotice();
}
