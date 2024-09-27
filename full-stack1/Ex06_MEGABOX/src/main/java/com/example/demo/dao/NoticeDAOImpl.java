package com.example.demo.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.NoticeDTO;

public class NoticeDAOImpl implements NoticeDAO{
	private static NoticeDAOImpl instance = new NoticeDAOImpl();
	private NoticeDAOImpl() {}
	public static NoticeDAOImpl getInstance() {
		return instance;
	}
	@Override
	public List<NoticeDTO> selectAll(SqlSession s,HashMap<String, Object> map) throws SQLException {
		return s.selectList("notice.selectAll",map);
	}
	@Override
	public int selectCount(SqlSession s,HashMap<String, Object> map) throws SQLException {
		return s.selectOne("notice.selectCount",map);
	}
	@Override
	public NoticeDTO selectByIdx(SqlSession s, int idx) throws SQLException {
		return s.selectOne("notice.selectByIdx",idx);
	}
	@Override
	public NoticeDTO selectPrevAndNext(SqlSession s, HashMap<String, Object> map) throws SQLException {
		return s.selectOne("notice.selectPrevAndNext",map);
	}
	@Override
	public List<NoticeDTO> selectTheaterNotice(SqlSession s) throws SQLException {
		return s.selectList("notice.selectTheaterNotice");
	}
}
