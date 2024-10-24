package com.example.demo.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.TimeTableDTO;

public interface TimeTableDAO {
	List<TimeTableDTO> selectMovieName(SqlSession s,HashMap<String, Object> map)throws SQLException;
	List<TimeTableDTO> selectTheaterFirst(SqlSession s,String location_name)throws SQLException;
	List<TimeTableDTO> selectTheaterSecond(SqlSession s,HashMap<String, Object> map)throws SQLException;
}
