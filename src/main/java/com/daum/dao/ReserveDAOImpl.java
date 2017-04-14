package com.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.daum.model.ReserveBean;

@Repository
public class ReserveDAOImpl implements ReserveDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReserveBean> Reslist(int h_no) {
		return this.sqlSession.selectList("getres" , h_no);
	}

	@Override
	public List<ReserveBean> getresdate(int hr_date) {
		
		return this.sqlSession.selectList("getdate",hr_date);
	}

	@Override
	public int res_in(ReserveBean rb) {
		
		return this.sqlSession.insert("res_in", rb);
	}

	@Override
	public void res_in2(ReserveBean rb) {
		
		this.sqlSession.insert("ref_in", rb);
	}

	@Override
	public int getNopayInfo(ReserveBean rb) {
		
		return this.sqlSession.selectOne("getNopay", rb);
	}
	

}
