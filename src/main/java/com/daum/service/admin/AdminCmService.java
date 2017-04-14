package com.daum.service.admin;

import java.util.List;

import com.daum.model.community.CmBean;

public interface AdminCmService {

	int getListCount(CmBean cm);
	List<CmBean> getCmList(CmBean cm);
	void insertBoard(CmBean cb);
	CmBean getCont(int cm_no);
	void editCm(CmBean cb);
	void delCm(int cm_no);

}
