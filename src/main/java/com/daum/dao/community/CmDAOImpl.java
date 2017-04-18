package com.daum.dao.community;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.community.CmBean;
import com.daum.model.community.CommentBean;

@Repository
public class CmDAOImpl implements CmDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertCm(CmBean c) {
		this.sqlSession.insert("cm_in",c);
	}//게시판 저장

	@Override
	public int getListCount(CmBean c) {
		return this.sqlSession.selectOne("cCount",c);
	}//검색전후 게시물 수

	@Override
	public List<CmBean> getCmlist(CmBean c) {
		return this.sqlSession.selectList("clist",c);
	}//검색전후 게시판 목록

	@Override
	public void updateHit(int cm_no) {
		this.sqlSession.update("cmHit",cm_no);
	}//조회수 증가

	@Override
	public CmBean getCmCont(int cm_no) {
		return this.sqlSession.selectOne("cmCont",cm_no);
	}//내용보기 수정 삭제폼

	@Override
	public void geteditCm(CmBean cb) {
		this.sqlSession.update("cmEdit",cb);
	}//게시판 수정

	@Override
	public void deleteCm(int cm_no) {
		this.sqlSession.delete("cmDel",cm_no);
	}//게시판 삭제
	
	@Override
	public int getComCount(int cm_no) {
		return this.sqlSession.selectOne("com_count",cm_no);
	}//댓글 개수

	@Override
	public List<CommentBean> getComList(int cm_no) {
		return this.sqlSession.selectList("com_list",cm_no);
	}//댓글 목록

	@Override
	public void insertCom(CommentBean cb) {
		this.sqlSession.insert("com_in",cb);
	}//댓글 저장

	@Override
	public void com_del(int c_no) {
		this.sqlSession.delete("com_del",c_no);
	}//댓글 삭제

	
}
