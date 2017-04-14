package com.daum.dao;

import java.util.List;

import com.daum.model.CmBean;
import com.daum.model.CommentBean;

public interface CmDAO {

	void insertCm(CmBean c);
	int getListCount(CmBean c);
	List<CmBean> getCmlist(CmBean c);
	void updateHit(int cm_no);
	CmBean getCmCont(int cm_no);
	void geteditCm(CmBean cb);
	void deleteCm(int cm_no);
	int getComCount(int cm_no);
	List<CommentBean> getComList(int cm_no);
	void insertCom(CommentBean cb);
	void com_del(int c_no);
	
}
