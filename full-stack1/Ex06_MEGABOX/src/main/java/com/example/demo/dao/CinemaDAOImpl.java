package com.example.demo.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.CinemaDTO;

public class CinemaDAOImpl implements CinemaDAO{
	private static CinemaDAOImpl instance = new CinemaDAOImpl();
	private CinemaDAOImpl() {}
	public static CinemaDAOImpl getInstance() {
		return instance;
	}
	@Override
	public List<CinemaDTO> selectLocationName(SqlSession s, String location_name) throws SQLException {
		return s.selectList("cinema.selectLocationName",location_name);
	}
	@Override
	public List<CinemaDTO> selectRoomLocation(SqlSession s, HashMap<String, Object> map) throws SQLException {
		return s.selectList("cinema.selectRoomLocation",map);
	}
	@Override
	public String selectMovieNameByIdx(SqlSession s, int movieIdx) throws SQLException {
		return s.selectOne("cinema.selectMovieNameByIdx",movieIdx);
	}

}
