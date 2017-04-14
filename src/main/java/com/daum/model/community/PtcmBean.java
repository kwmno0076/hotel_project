package com.daum.model.community;

public class PtcmBean {
	
	@Override
	public String toString() {
		return "PtcmBean [pt_no=" + pt_no + ", pt_name=" + pt_name + ", pt_title=" + pt_title + ", pt_pwd=" + pt_pwd
				+ ", pt_cont=" + pt_cont + ", pt_file=" + pt_file + ", ori_pt_file=" + ori_pt_file + ", pt_hit="
				+ pt_hit + ", pt_date=" + pt_date + ", startrow=" + startrow + ", endrow=" + endrow + ", find_field="
				+ find_field + ", find_name=" + find_name + "]";
	}
	///게시판
	private int pt_no;
	private String pt_name;
	private String pt_title;
	private String pt_pwd;
	private String pt_cont;
	private String pt_file;
	private String ori_pt_file;
	private int pt_hit;
	private String pt_date;
	
	//페이징 관련변수
	private int startrow;//시작행번호
	private int endrow;//끝행번호
			
	//검색필드와 검색어 저장변수
	private String find_field;//검색필드
	private String find_name;//검색어
	
	
	
	public String getPt_file() {
		return pt_file;
	}
	public void setPt_file(String pt_file) {
		this.pt_file = pt_file;
	}
	public String getOri_pt_file() {
		return ori_pt_file;
	}
	public void setOri_pt_file(String ori_pt_file) {
		this.ori_pt_file = ori_pt_file;
	}
	public int getPt_no() {
		return pt_no;
	}
	public void setPt_no(int pt_no) {
		this.pt_no = pt_no;
	}
	public String getPt_name() {
		return pt_name;
	}
	public void setPt_name(String pt_name) {
		this.pt_name = pt_name;
	}
	public String getPt_title() {
		return pt_title;
	}
	public void setPt_title(String pt_title) {
		this.pt_title = pt_title;
	}
	public String getPt_pwd() {
		return pt_pwd;
	}
	public void setPt_pwd(String pt_pwd) {
		this.pt_pwd = pt_pwd;
	}
	public String getPt_cont() {
		return pt_cont;
	}
	public void setPt_cont(String pt_cont) {
		this.pt_cont = pt_cont;
	}
	public int getPt_hit() {
		return pt_hit;
	}
	public void setPt_hit(int pt_hit) {
		this.pt_hit = pt_hit;
	}
	public String getPt_date() {
		return pt_date;
	}
	public void setPt_date(String pt_date) {
		this.pt_date = pt_date.substring(0,10);
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
}
