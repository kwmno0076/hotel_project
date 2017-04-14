package com.daum.model;

import java.util.List;

public class HotelBean {
	private int h_no;
	private String h_name;
	
	private String h_phone;
	
	private String h_title;
	private String h_local;
	
	private String h_cont;
	private String h_file;
	private int h_hit;
//	private int h_ref;
//	private int h_step;
//	private int h_level;
	private String h_date;
	private List<String> fileList;
	
	private String h_room;
	private int h_room_ok;
	private int h_price_room;
	private String h_option;
	private int h_price_option;
	private String h_bank;
	private String h_anumber;
	
	
	
		//페이징 관련변수
		private int startrow;//시작행번호
		private int endrow;//끝행번호
		
		//검색필드와 검색어 저장변수
		private String find_field;
		private String find_name;
	
		
	
	
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	
	
	
	
	
	
	public String getH_phone() {
		return h_phone;
	}
	public void setH_phone(String h_phone) {
		this.h_phone = h_phone;
	}
	public String getH_title() {
		return h_title;
	}
	public void setH_title(String h_title) {
		this.h_title = h_title;
	}
	
	
	
	
	
	
	public String getH_room() {
		return h_room;
	}
	public void setH_room(String h_room) {
		this.h_room = h_room;
	}
	public int getH_price_room() {
		return h_price_room;
	}
	public void setH_price_room(int h_price_room) {
		this.h_price_room = h_price_room;
	}
	
	
	
	
	
	public int getH_room_ok() {
		return h_room_ok;
	}
	public void setH_room_ok(int h_room_ok) {
		this.h_room_ok = h_room_ok;
	}
	public String getH_option() {
		return h_option;
	}
	public void setH_option(String h_option) {
		this.h_option = h_option;
	}
	public int getH_price_option() {
		return h_price_option;
	}
	public void setH_price_option(int h_price_option) {
		this.h_price_option = h_price_option;
	}
	

	
	
	
	public String getH_bank() {
		return h_bank;
	}
	public void setH_bank(String h_bank) {
		this.h_bank = h_bank;
	}
	public String getH_anumber() {
		return h_anumber;
	}
	public void setH_anumber(String h_anumber) {
		this.h_anumber = h_anumber;
	}
	public String getH_local() {
		return h_local;
	}
	public void setH_local(String h_local) {
		this.h_local = h_local;
	}
	
	
	
	
	
	public String getH_cont() {
		return h_cont;
	}
	public void setH_cont(String h_cont) {
		this.h_cont = h_cont;
	}
	
	
	public String getH_file() {
		return h_file;
	}
	public void setH_file(String h_file) {
		this.h_file = h_file;
	}
	
	public int getH_hit() {
		return h_hit;
	}
	public void setH_hit(int h_hit) {
		this.h_hit = h_hit;
	}
	
	
	
	
	
//	public int getH_ref() {
//		return h_ref;
//	}
//	public void setH_ref(int h_ref) {
//		this.h_ref = h_ref;
//	}
//	public int getH_step() {
//		return h_step;
//	}
//	public void setH_step(int h_step) {
//		this.h_step = h_step;
//	}
//	public int getH_level() {
//		return h_level;
//	}
//	public void setH_level(int h_level) {
//		this.h_level = h_level;
//	}
	public String getH_date() {
		return h_date;
	}
	public void setH_date(String h_date) {
		this.h_date = h_date;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	public List<String> getFileList() {
		return fileList;
	}
	public void setFileList(List<String> fileList) {
		this.fileList = fileList;
	}
	
	
	
	
}
