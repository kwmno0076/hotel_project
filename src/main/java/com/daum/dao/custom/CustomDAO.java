package com.daum.dao.custom;

import java.util.List;

import com.daum.model.admin.AdminGongBean;

public interface CustomDAO {

	int getListCount(AdminGongBean g);

	List<AdminGongBean> getGongjiList(AdminGongBean g);

	AdminGongBean getGongjiCont(int gongji_no);

	void updateHit(int gongji_no);

}
