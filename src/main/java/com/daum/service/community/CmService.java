package com.daum.service.community;

import java.util.List;

import com.daum.model.community.CmBean;
import com.daum.model.community.CommentBean;

public interface CmService {

	void insertCm(CmBean c);
	int getListCount(CmBean c);
	List<CmBean> getCmList(CmBean c);
	void updateHit(int cm_no);
	CmBean getCmCont(int cm_no);
	void editCm(CmBean cb);
	void deleteCm(int cm_no);
	int getComCount(int cm_no);
	List<CommentBean> getComList(int cm_no);
	void insertCom(CommentBean cb);
	void com_del(int c_no);
	
}
