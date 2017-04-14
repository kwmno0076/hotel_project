package com.daum.dao.admin;

import java.util.List;

import com.daum.model.admin.AdminGongBean;

public interface AdminGongDAO {

	int getListCount(AdminGongBean g);

	List<AdminGongBean> getgongList(AdminGongBean g);

	void insertg(AdminGongBean g);

	AdminGongBean getListCount(int gongji_no);

	void editBoard(AdminGongBean eb);

	void deleteGong(int no);

}
