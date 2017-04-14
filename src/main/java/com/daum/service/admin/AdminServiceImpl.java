package com.daum.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.admin.AdminDAO;
import com.daum.model.admin.AdminBean;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;

	public AdminBean adminCheck(String admin_id) {
		return this.adminDao.adminCheck(admin_id);
	}
}
