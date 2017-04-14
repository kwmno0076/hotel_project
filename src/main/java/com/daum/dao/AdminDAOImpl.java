package com.daum.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.AdminBean;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//관리자 로그인 인증
	public AdminBean adminCheck(String admin_id) {
		return this.sqlSession.selectOne("ad_check",admin_id);
	}

	
	
}
