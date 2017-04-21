package com.daum.service.custom;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.custom.CustomDAO;
import com.daum.model.admin.AdminGongBean;

@Service
public class CustomServiceImpl implements CustomService {

		@Autowired CustomDAO customdao;

		@Override
		public int getListCount(AdminGongBean g) {
			return customdao.getListCount(g);
		}

		@Override
		public List<AdminGongBean> getGongjiList(AdminGongBean g) {
			return customdao.getGongjiList(g);
		}

		@Override
		public AdminGongBean getGongjiCont(int gongji_no) {
			return customdao.getGongjiCont(gongji_no);
		}

		@Override
		public void updateHit(int gongji_no) {
			customdao.updateHit(gongji_no);
		}

}
