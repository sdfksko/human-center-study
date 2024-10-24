package com.example.demo.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dao.NoticeDAOImpl;
import com.example.demo.dto.NoticeDTO;
import com.example.demo.mybatis.MybatisConnection;

import lombok.extern.log4j.Log4j2;
@Log4j2
public class NoticeServiceImpl implements NoticeService{
	private static NoticeServiceImpl instance = new NoticeServiceImpl();
	private NoticeServiceImpl() {}
	public static NoticeServiceImpl getInstance() {
		return instance;
	}
	@Override
	public List<NoticeDTO> selectAll(int startNo,int size,String type,String title) {
		SqlSession s = null;
		List<NoticeDTO> pv = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("startNo", startNo+1);
			map.put("endNo", startNo+size);
			map.put("type", type);
			map.put("title", title);
			pv=NoticeDAOImpl.getInstance().selectAll(s,map);
			log.info("결과물 : {}",pv);
			s.commit();
		} catch (SQLException e) {
			s.rollback();
			e.printStackTrace();
		} finally {
			s.close();
		}
		return pv;
	}
	@Override
	public int selectCount(String title,String type) {
		SqlSession s = null;
		int result = 0;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			HashMap<String, Object> map = new HashMap<>();
			map.put("title", title);
			map.put("type", type);
			result = NoticeDAOImpl.getInstance().selectCount(s,map);
			s.commit();
		} catch (SQLException e) {
			s.rollback();
			e.printStackTrace();
		} finally {
			s.close();
		}
		return result;
	}
	@Override
	public NoticeDTO selectByIdx(int idx) {
		SqlSession s = null;
		NoticeDTO vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = NoticeDAOImpl.getInstance().selectByIdx(s,idx);
			s.commit();
		} catch (SQLException e) {
			s.rollback();
			e.printStackTrace();
		} finally {
			s.close();
		}
		return vo;
	}
	@Override
	public NoticeDTO selectPrevAndNext(String type, int idx) {
		SqlSession s = null;
		NoticeDTO vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			HashMap<String, Object> map = new HashMap<>();
			map.put("type", type);
			map.put("idx", idx);
			vo = NoticeDAOImpl.getInstance().selectPrevAndNext(s,map);
			s.commit();
		} catch (SQLException e) {
			s.rollback();
			e.printStackTrace();
		} finally {
			s.close();
		}
		return vo;
	}
	@Override
	public List<NoticeDTO> selectTheaterNotice() {
		SqlSession s = null;
		List<NoticeDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = NoticeDAOImpl.getInstance().selectTheaterNotice(s);
			s.commit();
		} catch (SQLException e) {
			s.rollback();
			e.printStackTrace();
		} finally {
			s.close();
		}
		return vo;
	}
}
