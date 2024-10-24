package com.example.demo.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.ReviewDTO;

public interface ReviewDAO {
	List<ReviewDTO> selectMovieRef(SqlSession s,int idx)throws SQLException;
	ReviewDTO selectByReviewIdx(SqlSession s,int idx)throws SQLException;
	void updateLike(SqlSession s,HashMap<String, Object> map)throws SQLException;
	void insertReview(SqlSession s,ReviewDTO vo)throws SQLException;
	List<ReviewDTO> selectType(SqlSession s,HashMap<String, Object> map)throws SQLException;
}
