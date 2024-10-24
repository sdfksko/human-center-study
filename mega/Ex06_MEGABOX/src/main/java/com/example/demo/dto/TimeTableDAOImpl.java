package com.example.demo.dto;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
}
