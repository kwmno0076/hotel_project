package com.daum.model.community;

public class PtcommentBean {

	private int pc_no;
	private String pc_name;
	private String pc_cont;
	private String pc_date;
	private int pt_no;
	private int startrow;
	private int endrow;
	
	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	public String getPc_name() {
		return pc_name;
	}
	public void setPc_name(String pc_name) {
		this.pc_name = pc_name;
	}
	public String getPc_cont() {
		return pc_cont;
	}
	public void setPc_cont(String pc_cont) {
		this.pc_cont = pc_cont;
	}
	public String getPc_date() {
		return pc_date;
	}
	public void setPc_date(String pc_date) {
		this.pc_date = pc_date;
	}
	public int getPt_no() {
		return pt_no;
	}
	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
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
}
