package com.daum.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.admin.AdminGongDAO;
import com.daum.model.admin.AdminGongBean;

@Service
public class AdminGongServiceImpl implements AdminGongService {

	@Autowired
	AdminGongDAO admingongdao;

	@Override
	public int getListCount(AdminGongBean g) {
		return admingongdao.getListCount(g);
	}

	@Override
	public List<AdminGongBean> getGongjiList(AdminGongBean g) {
		return admingongdao.getgongList(g);
	}

	@Override
	public void insertGongji(AdminGongBean g) {
		admingongdao.insertg(g);
	}

	@Override
	public AdminGongBean getGongjiCont(int gongji_no) {
		return admingongdao.getListCount(gongji_no);
	}

	@Override
	public void editBoard(AdminGongBean eb) {
		admingongdao.editBoard(eb);
	}

	@Override
	public void deleteGongji(int no) {
			admingongdao.deleteGong(no);
	}
}
