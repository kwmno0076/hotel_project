package com.daum.service.admin;

import java.util.List;

import com.daum.model.MemberBean;

public interface AdminMemService {

	int getListCount(MemberBean m);

	List<MemberBean> getBbsList(MemberBean m);

	MemberBean getMember(String id);

	void editMem(MemberBean m);

	void delMem(String id);

}
