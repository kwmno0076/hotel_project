package com.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.daum.dao.ReserveDAO;
import com.daum.model.ReserveBean;

@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	private ReserveDAO dao;

	@Override
	public List<ReserveBean> getReslist(int h_no) {
	
		return this.dao.Reslist(h_no);
	}

	@Override
	public List<ReserveBean> getresdatelist(int hr_date) {
		
		return dao.getresdate(hr_date);
	}

	@Override
	public int res_in(ReserveBean rb) {
		
		return this.dao.res_in(rb);
	}

	@Override
	public void res_in2(ReserveBean rb) {
		
		this.dao.res_in2(rb);
	}

	@Override
	public int getNopayinfo(ReserveBean rb) {
		
		return this.dao.getNopayInfo(rb);
	}
	

	
}
