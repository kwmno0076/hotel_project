package com.daum.service;




import java.util.List;

import javax.mail.MessagingException;

import com.daum.model.community.CmBean;
import com.daum.model.community.PtcmBean;
import com.daum.model.MemberBean;

public interface MemberService {

	void insertMember(MemberBean m);

	MemberBean idCheck(String id);

	MemberBean loginCheck(String login_id);

	MemberBean findid(MemberBean m);

	void sendMail(String to, String subject, String mail_cont) throws MessagingException;

	MemberBean emailCheck(String email);

	MemberBean getMem(String id);

	void updateMem(MemberBean m);

	MemberBean pwdFind(MemberBean m);

	void updatePwd(MemberBean m);

	void delM(MemberBean dm);

	int getListCount(CmBean c);

	List<CmBean> getMyBoardList(CmBean c);

	int getListPcount(PtcmBean c);

	List<PtcmBean> getMyPBoardList(PtcmBean c);
	




}
