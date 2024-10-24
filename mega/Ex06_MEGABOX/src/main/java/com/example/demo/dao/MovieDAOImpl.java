package com.example.demo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.MovieDTO;

public class MovieDAOImpl implements MovieDAO{
	private static MovieDAOImpl instance = new MovieDAOImpl();
	private MovieDAOImpl() {}
	public static MovieDAOImpl getInstance() {
		return instance;
	}
	@Override
	public List<MovieDTO> select(SqlSession s) throws SQLException {
		return s.selectList("movie.selectAll");
	}

	@Override
	public MovieDTO selectByIdx(SqlSession s, int idx) throws SQLException {
		return s.selectOne("movie.selectByIdx",idx);
	}
	@Override
	public List<MovieDTO> selectMovieName(SqlSession s, String name) throws SQLException {
		return s.selectList("movie.selectMovieName",name);
	}
}
