package com.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.ReserveBean;

@Repository
public class AdminReserveDAOImpl implements AdminReserveDAO {

	@Autowired
	private SqlSession sql;
	
	
	@Override
	public int ReserveListCount(ReserveBean bean) {
		
		return this.sql.selectOne("r_count",bean);
	}

	@Override
	public List<ReserveBean> ReserveList(ReserveBean bean) {
		return this.sql.selectList("r_list",bean);
	}
	
	
	
}
