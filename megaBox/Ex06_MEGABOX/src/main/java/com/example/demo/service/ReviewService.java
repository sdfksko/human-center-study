package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.ReviewDTO;

public interface ReviewService {
	List<ReviewDTO> selectMovieRef(int movieRef);
	List<ReviewDTO> selectType(String type,int movieRef);
	ReviewDTO selectByReviewIdx(int reviewIdx);
	void updateLike(String type,int movieIdx);
	void insertReview(ReviewDTO vo);
}
