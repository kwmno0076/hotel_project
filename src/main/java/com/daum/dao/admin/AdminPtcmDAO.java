package com.daum.dao.admin;

import java.util.List;

import com.daum.model.community.PtcmBean;

public interface AdminPtcmDAO {

	int getCount(PtcmBean pb);
	List<PtcmBean> getPtcmList(PtcmBean pb);
	void insertPtcmf(PtcmBean pb);
	PtcmBean getCont(int pt_no);
	void editPtcm(PtcmBean pb);
	void delPtcm(int pt_no);
	
}
