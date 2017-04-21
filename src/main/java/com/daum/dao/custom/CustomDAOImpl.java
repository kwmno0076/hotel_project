package com.daum.dao.custom;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.admin.AdminGongBean;

@Repository
public class CustomDAOImpl implements CustomDAO {

	@Autowired
		private SqlSession sqlsession;

	@Override
	public int getListCount(AdminGongBean g) {
		return this.sqlsession.selectOne("ggcount",g);
	}

	@Override
	public List<AdminGongBean> getGongjiList(AdminGongBean g) {
		return this.sqlsession.selectList("gglist",g);
	}

	@Override
	public AdminGongBean getGongjiCont(int gongji_no) {
		return sqlsession.selectOne("ggcont",gongji_no);
	}

	@Override
	public void updateHit(int gongji_no) {
		sqlsession.update("gghit",gongji_no);
	}
}
