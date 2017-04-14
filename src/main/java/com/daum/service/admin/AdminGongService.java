package com.daum.service.admin;

import java.util.List;

import com.daum.model.admin.AdminGongBean;

public interface AdminGongService {

	int getListCount(AdminGongBean g);

	List<AdminGongBean> getGongjiList(AdminGongBean g);

	void insertGongji(AdminGongBean g);

	AdminGongBean getGongjiCont(int gongji_no);

	void editBoard(AdminGongBean eb);

	void deleteGongji(int no);

}
