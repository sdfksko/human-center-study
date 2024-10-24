package com.example.demo.dto;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public interface TimeTableDAO {
	List<TimeTableDTO> selectMovieName(SqlSession s,HashMap<String, Object> map)throws SQLException;
}
