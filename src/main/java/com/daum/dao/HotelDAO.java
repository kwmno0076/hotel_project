package com.daum.dao;

import java.util.List;

import com.daum.model.HotelBean;

public interface HotelDAO {

	void insertHotel(HotelBean h);

	int getListCount(HotelBean h);

	List<HotelBean> getHotelList(HotelBean h);

	void updateHit(int h_no);

	HotelBean getHotelCont(int h_no);

	void getHotelEdit(HotelBean h);

	void getHoteldel(int h_no);

	List<HotelBean> getDetail(int h_no);

	HotelBean getokNum(int h_no);

	HotelBean getName(int h_no);

	
}
