package com.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.CmDAO;
import com.daum.model.CmBean;
import com.daum.model.CommentBean;

@Service
public class CmServiceImpl implements CmService {

	@Autowired
	private CmDAO cmDAO;
	
	@Override
	public void insertCm(CmBean c) {
		this.cmDAO.insertCm(c);
	}

	@Override
	public int getListCount(CmBean c) {
		return this.cmDAO.getListCount(c);
	}

	@Override
	public List<CmBean> getCmList(CmBean c) {
		return this.cmDAO.getCmlist(c);
	}

	@Override
	public void updateHit(int cm_no) {
		this.cmDAO.updateHit(cm_no);
		
	}

	@Override
	public CmBean getCmCont(int cm_no) {
		return this.cmDAO.getCmCont(cm_no);
	}

	@Override
	public void editCm(CmBean cb) {
		this.cmDAO.geteditCm(cb);
	}

	@Override
	public void deleteCm(int cm_no) {
		this.cmDAO.deleteCm(cm_no);
	}

	@Override
	public int getComCount(int cm_no) {
		return this.cmDAO.getComCount(cm_no);
	}
	
	@Override
	public List<CommentBean> getComList(int cm_no) {
		return this.cmDAO.getComList(cm_no);
	}

	@Override
	public void insertCom(CommentBean cb) {
		this.cmDAO.insertCom(cb);
	}

	@Override
	public void com_del(int c_no) {
		this.cmDAO.com_del(c_no);
	}

}
