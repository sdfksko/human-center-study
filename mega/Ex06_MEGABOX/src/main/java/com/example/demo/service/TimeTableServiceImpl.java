package com.example.demo.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dao.TimeTableDAOImpl;
import com.example.demo.dto.TimeTableDTO;
import com.example.demo.mybatis.MybatisConnection;

public class TimeTableServiceImpl implements TimeTableService{
	private static TimeTableServiceImpl instance = new TimeTableServiceImpl();
	private TimeTableServiceImpl() {}
	public static TimeTableServiceImpl getInstance() {
		return instance;
	}
	@Override
	public List<TimeTableDTO> selectMovieName(String type,String location_name, int movie_idx, String room_location,String time) {
		SqlSession s = null;
		List<TimeTableDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			HashMap<String, Object> map = new HashMap<>();
			map.put("type", type);
			map.put("location_name", location_name);
			map.put("movie_idx", movie_idx);
			map.put("room_location", room_location);
			map.put("start_time", time);
			vo = TimeTableDAOImpl.getInstance().selectMovieName(s, map);
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
	public List<TimeTableDTO> selectTheaterFirst(String location_name) {
		SqlSession s = null;
		List<TimeTableDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = TimeTableDAOImpl.getInstance().selectTheaterFirst(s, location_name);
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
	public List<TimeTableDTO> selectTheaterSecond(String location_name, int movie_idx, String room_location) {
		SqlSession s = null;
		List<TimeTableDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			HashMap<String, Object> map = new HashMap<>();
			map.put("location_name", location_name);
			map.put("movie_idx", movie_idx);
			map.put("room_location", room_location);
			vo = TimeTableDAOImpl.getInstance().selectTheaterSecond(s, map);
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
