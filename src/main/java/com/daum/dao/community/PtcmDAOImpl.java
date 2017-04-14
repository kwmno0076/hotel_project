package com.daum.dao.community;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.community.PtcmBean;
import com.daum.model.community.PtcommentBean;

@Repository
public class PtcmDAOImpl implements PtcmDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertPtcm(PtcmBean p) {
		System.out.println(p+"★");
		this.sqlSession.insert("ptcm_in",p);
	}//포토게시판 저장

	@Override
	public void insertPtcmfile(PtcmBean pb) {
		this.sqlSession.insert("ptcm_in",pb);
	}//파일 저장

	@Override
	public int getListCount(PtcmBean pb) {
		return this.sqlSession.selectOne("p_count",pb);
	}//검색전후목록

	@Override
	public List<PtcmBean> getptcmList(PtcmBean pb) {
		return this.sqlSession.selectList("p_list",pb);
	}//목록보기

	@Override
	public PtcmBean getPtcmCont(int pt_no) {
		return this.sqlSession.selectOne("ptCont",pt_no);
	}//내용보기

	@Override
	public void updateHit(int pt_no) {
		this.sqlSession.update("pthit",pt_no);
	}//조회수증가

	@Override
	public int getPtComCount(int pt_no) {
		return this.sqlSession.selectOne("ptcom_count",pt_no);
	}//댓글개수

	@Override
	public void deletePtcm(int pt_no) {
		this.sqlSession.delete("ptcmdel",pt_no);
	}//삭제

	@Override
	public void geteditPtcm(PtcmBean p) {
		this.sqlSession.update("ptcmEdit",p);
	}//수정

	@Override
	public void insertPtCom(PtcommentBean pcb) {
		this.sqlSession.insert("ptcom_in",pcb);
	}//댓글저장

	@Override
	public void Ptcom_del(int pc_no) {
		this.sqlSession.delete("ptcom_del",pc_no);
	}//댓글삭제

	@Override
	public List<PtcommentBean> getPtComList(int pt_no) {
		return this.sqlSession.selectList("ptcom_list",pt_no);
	}//댓글목록


}
