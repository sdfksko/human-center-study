package com.example.demo.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dao.MovieDAOImpl;
import com.example.demo.dto.MovieDTO;
import com.example.demo.mybatis.MybatisConnection;

import lombok.extern.log4j.Log4j2;
@Log4j2
public class MovieServiceImpl implements MovieService{
	private static MovieServiceImpl instance = new MovieServiceImpl();
	private MovieServiceImpl() {}
	public static MovieServiceImpl getInstance() {
		return instance;
	}
	@Override
	public List<MovieDTO> select() {
		SqlSession s = null;
		List<MovieDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = MovieDAOImpl.getInstance().select(s);
			s.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			s.rollback();
		}finally {
			s.close();
		}
		return vo;
	}

	@Override
	public MovieDTO selectByIdx(int idx) {
		SqlSession s = null;
		MovieDTO vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = MovieDAOImpl.getInstance().selectByIdx(s,idx);
			s.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			s.rollback();
		}finally {
			s.close();
		}
		return vo;
	}
	@Override
	public List<MovieDTO> selectMovieName(String name) {
		SqlSession s = null;
		List<MovieDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = MovieDAOImpl.getInstance().selectMovieName(s,name);
			s.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			s.rollback();
		}finally {
			s.close();
		}
		return vo;
	}
	@Override
	public HashMap<String, Object> selectTicketing(String openingDate, String name) {
		SqlSession s = null;
		HashMap<String, Object> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			HashMap<String, Object> map = new HashMap<>();
			log.info("결과 : {} {}",openingDate,name);
			map.put("openingDate", openingDate);
			map.put("name", name);
			vo = MovieDAOImpl.getInstance().selectTicketing(s,map);
			s.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			s.rollback();
		}finally {
			s.close();
		}
		return vo;
	}

}
