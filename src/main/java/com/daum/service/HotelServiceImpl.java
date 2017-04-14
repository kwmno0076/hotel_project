package com.daum.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daum.dao.HotelDAO;
import com.daum.model.HotelBean;

@Service
public class HotelServiceImpl implements HotelService {
	
	@Autowired
	private HotelDAO dao;
	

	@Override
	public void insertHotel(HotelBean h) {
		dao.insertHotel(h);
		
	}

	@Override
	public int getListCount(HotelBean h) {
		
		return this.dao.getListCount(h);
	}

	@Override
	public List<HotelBean> getHotelList(HotelBean h) {
	
		return this.dao.getHotelList(h);
	}

	@Override
	public void updateHit(int h_no) {
		this.dao.updateHit(h_no);
		
	}

	@Override
	public HotelBean getHotelCont(int h_no) {
		return this.dao.getHotelCont(h_no);
	}

	@Override
	public void Hoteledit(HotelBean h) {
		this.dao.getHotelEdit(h);
		
	}

	@Override
	public void Hoteldel(int h_no) {
		this.dao.getHoteldel(h_no);
		
	}

	@Override
	public List<HotelBean> getDetail(int h_no) {
		return this.dao.getDetail(h_no);
	}//호텔번호, 이름

	@Override
	public HotelBean getokNum(int h_no) {
		
		return this.dao.getokNum(h_no);
	}//예약가능 정보

	@Override
	public HotelBean getName(int h_no) {
		
		return this.dao.getName(h_no);
	}

	
	
	

}
