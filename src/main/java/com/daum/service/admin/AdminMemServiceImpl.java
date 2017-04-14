package com.daum.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.admin.AdminMemDAO;
import com.daum.model.MemberBean;

@Service
public class AdminMemServiceImpl implements AdminMemService {
	
	@Autowired
	private AdminMemDAO adminMemDao;

	@Override
	public int getListCount(MemberBean m) {
		return this.adminMemDao.getMemCount(m);
	}

	@Override
	public List<MemberBean> getBbsList(MemberBean m) {
		return this.adminMemDao.getMemList(m);
	}

	@Override
	public MemberBean getMember(String id) {
		return adminMemDao.getMember(id);
	}

	@Override
	public void editMem(MemberBean m) {
		adminMemDao.editM(m);
	}

	@Override
	public void delMem(String id) {
		adminMemDao.delMem(id);
	}
}
