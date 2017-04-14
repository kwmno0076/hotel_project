package com.daum.model;

public class CmBean {

	private int cm_no;
	private String cm_name;
	private String cm_title;
	private String cm_pwd;
	private String cm_cont;
	private int cm_hit;
	private String cm_date;
	
	//페이징 관련변수
	private int startrow;//시작행번호
	private int endrow;//끝행번호
		
	//검색필드와 검색어 저장변수
	private String find_field;//검색필드
	private String find_name;//검색어
	
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
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public String getCm_title() {
		return cm_title;
	}
	public void setCm_title(String cm_title) {
		this.cm_title = cm_title;
	}
	public String getCm_pwd() {
		return cm_pwd;
	}
	public void setCm_pwd(String cm_pwd) {
		this.cm_pwd = cm_pwd;
	}
	public String getCm_cont() {
		return cm_cont;
	}
	public void setCm_cont(String cm_cont) {
		this.cm_cont = cm_cont;
	}
	public int getCm_hit() {
		return cm_hit;
	}
	public void setCm_hit(int cm_hit) {
		this.cm_hit = cm_hit;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date.substring(0,10);
	}
}
