package com.example.demo.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.TimeTableDTO;

public class TimeTableDAOImpl implements TimeTableDAO{
	private static TimeTableDAOImpl instance = new TimeTableDAOImpl();
	private TimeTableDAOImpl() {}
	public static TimeTableDAOImpl getInstance() {
		return instance;
	}
	@Override
	public List<TimeTableDTO> selectMovieName(SqlSession s, HashMap<String, Object> map) throws SQLException {
		return s.selectList("timetable.selectMovieName",map);
	}
	@Override
	public List<TimeTableDTO> selectTheaterFirst(SqlSession s, String location_name) throws SQLException {
		return s.selectList("timetable.selectTheaterFirst",location_name);
	}
	@Override
	public List<TimeTableDTO> selectTheaterSecond(SqlSession s, HashMap<String, Object> map) throws SQLException {
		return s.selectList("timetable.selectTheaterSecond",map);
	}
}
