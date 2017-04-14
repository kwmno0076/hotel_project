package com.daum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.daum.model.HotelBean;

@Repository
public class HotelDAOImpl implements HotelDAO {
	
	@Autowired
	private SqlSession sql;
	
	
	@Override
	public void insertHotel(HotelBean h) {
		sql.insert("h_in", h);
	}

	@Override
	public int getListCount(HotelBean h) {
	
		return this.sql.selectOne("hcount",h);
	}//검색전후 레코드 개수

	@Override
	public List<HotelBean> getHotelList(HotelBean h) {
		
		return this.sql.selectList("hlist",h);
	}//호텔목록

	@Override
	public void updateHit(int h_no) {
		this.sql.update("hhit", h_no);
		}//조회수 증가
	

	@Override
	public HotelBean getHotelCont(int h_no) {
		return this.sql.selectOne("hcont",h_no);
		
	}//내용보기,수정,삭제폼

	@Override
	public void getHotelEdit(HotelBean h) {
		this.sql.update("hedit",h);
		
	}
	
	@Override
	public void getHoteldel(int h_no) {
		this.sql.delete("hdel",h_no);
		
	}

	@Override
	public List<HotelBean> getDetail(int h_no) {
		return this.sql.selectList("de_01",h_no);
	}//호텔 번호 이름

	@Override
	public HotelBean getokNum(int h_no) {
		return this.sql.selectOne("getNum",h_no);
	}//예약가능한지

	@Override
	public HotelBean getName(int h_no) {
		
		return this.sql.selectOne("getName",h_no);
	}

}
