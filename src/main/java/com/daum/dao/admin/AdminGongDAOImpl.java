package com.daum.dao.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daum.model.admin.AdminGongBean;

@Repository
public class AdminGongDAOImpl implements AdminGongDAO {
	
		@Autowired
		 private SqlSession sqlsession;

		@Override
		public int getListCount(AdminGongBean g) {
			return this.sqlsession.selectOne("gongcount",g);
		}

		@Override
		public List<AdminGongBean> getgongList(AdminGongBean g) {
			return this.sqlsession.selectList("gonglist",g);
		}

		@Override
		public void insertg(AdminGongBean g) {
				this.sqlsession.insert("insertg",g);
		}

		@Override
		public AdminGongBean getListCount(int gongji_no) {
			return sqlsession.selectOne("gongcont",gongji_no);
		}

		@Override
		public void editBoard(AdminGongBean eb) {
			 this.sqlsession.update("gongedit",eb);
		}

		@Override
		public void deleteGong(int no) {
			this.sqlsession.delete("gongdel",no);		

		}
	
}
