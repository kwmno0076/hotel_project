package com.daum.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.AdminDAO;
import com.daum.model.AdminBean;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;

	public AdminBean adminCheck(String admin_id) {
		return this.adminDao.adminCheck(admin_id);
	}
}
