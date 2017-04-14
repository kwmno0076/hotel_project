package com.daum.dao;




import java.util.List;

import com.daum.model.community.CmBean;
import com.daum.model.community.PtcmBean;
import com.daum.model.MemberBean;

public interface MemDAO {

	void insertmember(MemberBean m);

	MemberBean idchk(String id);

	MemberBean loginchk(String login_id);

	MemberBean find_id(MemberBean m);

	MemberBean emailchk(String email);

	MemberBean getMem(String id);

	void updateMem(MemberBean m);

	MemberBean pwdFine(MemberBean m);

	void updatePwd(MemberBean m);

	void delM(MemberBean dm);

	int Listc(CmBean c);

	List<CmBean> getMyList(CmBean c);

	int ListPt(PtcmBean c);

	List<PtcmBean> getPtList(PtcmBean c);



}
