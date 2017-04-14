package com.daum.dao.admin;

import java.util.List;

import com.daum.model.community.CmBean;

public interface AdminCmDAO {

	int getCount(CmBean cm);
	List<CmBean> getCmList(CmBean cm);
	void insertCm(CmBean cb);
	CmBean getCont(int cm_no);
	void editCm(CmBean cb);
	void delCm(int cm_no);
	
}
