package com.daum.dao.admin;

import java.util.List;

import com.daum.model.MemberBean;

public interface AdminMemDAO {

	int getMemCount(MemberBean m);

	List<MemberBean> getMemList(MemberBean m);

	MemberBean getMember(String id);

	void editM(MemberBean m);

	void delMem(String id);

}
