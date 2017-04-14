package com.daum.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.community.CmBean;

@Repository
public class AdminCmDAOImpl implements AdminCmDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getCount(CmBean cm) {
		return this.sqlSession.selectOne("ad_count",cm);
	}//개시물 개수

	@Override
	public List<CmBean> getCmList(CmBean cm) {
		return this.sqlSession.selectList("ad_list",cm);
	}//게시판 목록

	@Override
	public void insertCm(CmBean cb) {
		this.sqlSession.insert("ad_in",cb);
	}//게시판 글쓰기

	@Override
	public CmBean getCont(int cm_no) {
		return this.sqlSession.selectOne("ad_cont",cm_no);
	}

	@Override
	public void editCm(CmBean cb) {
		this.sqlSession.update("ad_edit",cb);
	}//게시판 글수정

	@Override
	public void delCm(int cm_no) {
		this.sqlSession.delete("ad_del",cm_no);
	}//게시판 삭제

	
	
}
