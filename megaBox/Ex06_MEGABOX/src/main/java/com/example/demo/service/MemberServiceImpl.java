package com.example.demo.service;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dao.MemberDAOImpl;
import com.example.demo.dto.MemberDTO;
import com.example.demo.mybatis.MybatisConnection;

public class MemberServiceImpl implements MemberService{
	private static MemberServiceImpl instance = new MemberServiceImpl();
	private MemberServiceImpl() {}
	public static MemberServiceImpl getInstance() {
		return instance;
	}
	@Override
	public MemberDTO selectLogin(String memberId) {
		MemberDTO vo = null;
		SqlSession s = null;
		try {
			s = MybatisConnection.getSqlSessionFactory().openSession(false);
			vo = MemberDAOImpl.getInstance().selectLogin(s, memberId);
			s.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			s.rollback();
		}finally {
			s.close();
		}
		return vo;
	}

}
