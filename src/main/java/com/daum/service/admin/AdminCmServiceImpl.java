package com.daum.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.admin.AdminCmDAO;
import com.daum.model.community.CmBean;

@Service
public class AdminCmServiceImpl implements AdminCmService {

	@Autowired
	private AdminCmDAO admincmdao;
	
	@Override
	public int getListCount(CmBean cm) {
		return this.admincmdao.getCount(cm);
	}

	@Override
	public List<CmBean> getCmList(CmBean cm) {
		return this.admincmdao.getCmList(cm);
	}

	@Override
	public void insertBoard(CmBean cb) {
		this.admincmdao.insertCm(cb);
	}

	@Override
	public CmBean getCont(int cm_no) {
		return this.admincmdao.getCont(cm_no);
	}

	@Override
	public void editCm(CmBean cb) {
		this.admincmdao.editCm(cb);
	}

	@Override
	public void delCm(int cm_no) {
		this.admincmdao.delCm(cm_no);
	}
	

}
