package com.daum.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.admin.AdminPtcmDAO;
import com.daum.model.community.PtcmBean;

@Service
public class AdminPtcmServiceImpl implements AdminPtcmService {

	@Autowired
	private AdminPtcmDAO adminptcmado;

	@Override
	public int getListCount(PtcmBean pb) {
		return this.adminptcmado.getCount(pb);
	}

	@Override
	public List<PtcmBean> getPtcmList(PtcmBean pb) {
		return this.adminptcmado.getPtcmList(pb);
	}

	@Override
	public void insertPtcmf(PtcmBean pb) {
		this.adminptcmado.insertPtcmf(pb);
	}

	@Override
	public PtcmBean getCont(int pt_no) {
		return this.adminptcmado.getCont(pt_no);
	}

	@Override
	public void editPtcm(PtcmBean pb) {
		this.adminptcmado.editPtcm(pb);
	}

	@Override
	public void delPtcm(int pt_no) {
		this.adminptcmado.delPtcm(pt_no);
	}

	
	
	
	
}
