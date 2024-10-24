package com.example.demo.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.NoticeDTO;

public interface NoticeDAO {
	List<NoticeDTO> selectAll(SqlSession s,HashMap<String, Object> map)throws SQLException;
	int selectCount(SqlSession s,HashMap<String, Object> map)throws SQLException;
	NoticeDTO selectByIdx(SqlSession s,int idx)throws SQLException;
	NoticeDTO selectPrevAndNext(SqlSession s,HashMap<String, Object> map)throws SQLException;
	List<NoticeDTO> selectTheaterNotice(SqlSession s)throws SQLException;
}
