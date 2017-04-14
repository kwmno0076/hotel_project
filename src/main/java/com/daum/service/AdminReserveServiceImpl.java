package com.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.AdminReserveDAO;
import com.daum.model.ReserveBean;

@Service
public class AdminReserveServiceImpl implements AdminReserveService{

	@Autowired
	private AdminReserveDAO dao;

	@Override
	public int getReserveListCount(ReserveBean bean) {
		
		return this.dao.ReserveListCount(bean);
	}

	@Override
	public List<ReserveBean> getReserveList(ReserveBean bean) {
		
		return this.dao.ReserveList(bean);
	}
	
	
	
	
	
	
}
