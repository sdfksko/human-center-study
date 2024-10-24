package com.example.demo.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.ReviewDTO;

public class ReviewDAOImpl implements ReviewDAO{
	private static ReviewDAOImpl instance = new ReviewDAOImpl();
	private ReviewDAOImpl() {}
	public static ReviewDAOImpl getInstance() {
		return instance;
	}
	@Override
	public List<ReviewDTO> selectMovieRef(SqlSession s, int idx) throws SQLException {
		return s.selectList("reivew.selectMovieRef",idx);
	}

	@Override
	public void updateLike(SqlSession s, HashMap<String, Object> map) throws SQLException {
		s.update("review.updateLike",map);
	}

	@Override
	public List<ReviewDTO> selectType(SqlSession s, HashMap<String, Object> map) throws SQLException {
		return s.selectList("review.selectType",map);
	}
	@Override
	public ReviewDTO selectByReviewIdx(SqlSession s, int idx) throws SQLException {
		return s.selectOne("review.selectByReviewIdx",idx);
	}
	@Override
	public void insertReview(SqlSession s, ReviewDTO vo) throws SQLException {
		s.insert("review.insertReview",vo);
	}
	
}
