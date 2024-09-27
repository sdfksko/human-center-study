package com.example.demo.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.example.demo.dto.MemberDTO;

public interface MemberDAO {
	MemberDTO selectLogin(SqlSession s,String memberId)throws SQLException;
}
