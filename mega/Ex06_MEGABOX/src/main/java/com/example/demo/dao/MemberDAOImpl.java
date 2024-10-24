package com.example.demo.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.MemberDTO;

public class MemberDAOImpl implements MemberDAO{
	private static MemberDAOImpl instance = new MemberDAOImpl();
	private MemberDAOImpl() {}
	public static MemberDAOImpl getInstance() {
		return instance;
	}
	@Override
	public MemberDTO selectLogin(SqlSession s, String memberId) throws SQLException {
		return s.selectOne("member.selectLogin",memberId);
	}

}
