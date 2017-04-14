package com.daum.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.community.PtcmBean;

@Repository
public class AdminPtcmDAOImpl implements AdminPtcmDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getCount(PtcmBean pb) {
		return this.sqlSession.selectOne("adp_count",pb);
	}//개시물 개수

	@Override
	public List<PtcmBean> getPtcmList(PtcmBean pb) {
		return this.sqlSession.selectList("adp_list",pb);
	}//목록

	@Override
	public void insertPtcmf(PtcmBean pb) {
		this.sqlSession.insert("adp_in",pb);
	}//글쓰기

	@Override
	public PtcmBean getCont(int pt_no) {
		return this.sqlSession.selectOne("adp_cont",pt_no);
	}//내용보기

	@Override
	public void editPtcm(PtcmBean pb) {
		this.sqlSession.update("adp_edit",pb);
	}//수정

	@Override
	public void delPtcm(int pt_no) {
		this.sqlSession.delete("adp_del",pt_no);
	}//삭제
	
}
