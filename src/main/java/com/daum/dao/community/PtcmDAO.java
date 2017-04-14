package com.daum.dao.community;

import java.util.List;

import com.daum.model.community.PtcmBean;
import com.daum.model.community.PtcommentBean;

public interface PtcmDAO {

	void insertPtcm(PtcmBean p);
	void insertPtcmfile(PtcmBean pb);
	int getListCount(PtcmBean pb);
	List<PtcmBean> getptcmList(PtcmBean pb);
	PtcmBean getPtcmCont(int pt_no);
	void updateHit(int pt_no);
	int getPtComCount(int pt_no);
	void deletePtcm(int pt_no);
	void geteditPtcm(PtcmBean p);
	void insertPtCom(PtcommentBean pcb);
	void Ptcom_del(int pc_no);
	List<PtcommentBean> getPtComList(int pt_no);

}
