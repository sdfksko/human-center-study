package com.example.demo.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dao.ReviewDAOImpl;
import com.example.demo.dto.ReviewDTO;
import com.example.demo.mybatis.MybatisConnection;

public class ReviewServiceImpl implements ReviewService{
	private static ReviewServiceImpl instance = new ReviewServiceImpl();
	private ReviewServiceImpl() {}
	public static ReviewServiceImpl getInstance() {
		return instance;
	}
	@Override
	public List<ReviewDTO> selectMovieRef(int movieRef) {
		SqlSession s = null;
		List<ReviewDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = ReviewDAOImpl.getInstance().selectMovieRef(s, movieRef);
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
	public List<ReviewDTO> selectType(String type, int movieRef) {
		SqlSession s = null;
		List<ReviewDTO> vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			HashMap<String, Object> map = new HashMap<>();
			map.put("type", type);
			map.put("movieRef", movieRef);
			vo = ReviewDAOImpl.getInstance().selectType(s, map);
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
	public void updateLike(String type, int movieIdx) {
		SqlSession s = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			HashMap<String, Object> map = new HashMap<>();
			map.put("type", type);
			map.put("movieIdx", movieIdx);
			ReviewDAOImpl.getInstance().updateLike(s, map);
			s.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			s.rollback();
		}finally {
			s.close();
		}
	}
	@Override
	public ReviewDTO selectByReviewIdx(int reviewIdx) {
		SqlSession s = null;
		ReviewDTO vo = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = ReviewDAOImpl.getInstance().selectByReviewIdx(s, reviewIdx);
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
	public void insertReview(ReviewDTO vo) {
		SqlSession s = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			ReviewDAOImpl.getInstance().insertReview(s, vo);
			s.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			s.rollback();
		}finally {
			s.close();
		}
	}

}
