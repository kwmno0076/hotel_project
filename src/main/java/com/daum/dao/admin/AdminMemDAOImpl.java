package com.daum.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.MemberBean;

@Repository
public class AdminMemDAOImpl implements AdminMemDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getMemCount(MemberBean m) {
		return this.sqlSession.selectOne("mcount",m);
	}//검색 전 후 회원수

	@Override
	public List<MemberBean> getMemList(MemberBean m) {
		return this.sqlSession.selectList("amlist",m);
	}//검색 전 후 목록

	@Override
	public MemberBean getMember(String id) {
		return sqlSession.selectOne("ainfo",id);
	}

	@Override
	public void editM(MemberBean m) {
			sqlSession.update("editM",m);
	}

	@Override
	public void delMem(String id) {
		sqlSession.delete("delMem",id);
	}
	
	
}
