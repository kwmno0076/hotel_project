package com.daum.service.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.community.PtcmDAO;
import com.daum.model.community.PtcmBean;
import com.daum.model.community.PtcommentBean;

@Service
public class PtcmServiceImpl implements PtcmService {

	@Autowired
	private PtcmDAO ptcmdao;
	
	@Override
	public void insertPtcm(PtcmBean p) {
		this.ptcmdao.insertPtcm(p);
	}

	@Override
	public void insertPtcmfile(PtcmBean pb) {
		this.ptcmdao.insertPtcmfile(pb);
	}

	@Override
	public int getListCount(PtcmBean pb) {
		return this.ptcmdao.getListCount(pb);
	}

	@Override
	public List<PtcmBean> getptcmList(PtcmBean pb) {
		return this.ptcmdao.getptcmList(pb);
	}

	@Override
	public PtcmBean getPtcmCont(int pt_no) {
		return this.ptcmdao.getPtcmCont(pt_no);
	}

	@Override
	public void updateHit(int pt_no) {
		this.ptcmdao.updateHit(pt_no);
	}

	@Override
	public int getPtComCount(int pt_no) {
		return this.ptcmdao.getPtComCount(pt_no);
	}

	@Override
	public void deletePtcm(int pt_no) {
		this.ptcmdao.deletePtcm(pt_no);
	}

	@Override
	public void editPtcm(PtcmBean p) {
		this.ptcmdao.geteditPtcm(p);
	}

	@Override
	public void insertPtCom(PtcommentBean pcb) {
		this.ptcmdao.insertPtCom(pcb);
	}

	@Override
	public void Ptcom_del(int pc_no) {
		this.ptcmdao.Ptcom_del(pc_no);
	}

	@Override
	public List<PtcommentBean> getPtComList(int pt_no) {
		return this.ptcmdao.getPtComList(pt_no);
	}

	



}
