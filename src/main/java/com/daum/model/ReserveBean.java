package com.daum.model;

public class ReserveBean {

	private int reserve_no;// 예약번호
	private int reserve_hno;// 예약번호
	private String reserve_name; // 호텔이름
	private int reserve_roomfind; // 호텔 구분 짓기
	private String reserve_userid; // 예약id
	private String reserve_username; // 예약자이름(입금자명)
	private int reserve_date; // 호텔예약날짜
	private String reserve_night; // 숙박일수
	private int reserve_ref; // 예약번호묶음
	private String reserve_addr; // 예약자 연락처
	private String reserve_pwd; // 예약자 비밀번호
	private int reserve_price; // 결제금액
	private String reserve_payment; // 결제방법
	private String reserve_payname; // 입금은행
	private String reserve_paynum; // 계좌번호
	private String reserve_payok; //결제여부 ('Y' = 승인 , 'N'= 결제대기 , 'X' = 결제취소
	
	private String reserve_regdate; //예약날짜
	
	
	
	// 페이징 관련변수
	private int startrow;// 시작행번호
	private int endrow;// 끝행번호

	// 검색필드와 검색어 저장변수
	private String find_field;
	private String find_name;
	public int getReserve_no() {
		return reserve_no;
	}
	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}
	public int getReserve_hno() {
		return reserve_hno;
	}
	public void setReserve_hno(int reserve_hno) {
		this.reserve_hno = reserve_hno;
	}
	public String getReserve_name() {
		return reserve_name;
	}
	public void setReserve_name(String reserve_name) {
		this.reserve_name = reserve_name;
	}
	
	
	
	
	
	
	
	public int getReserve_roomfind() {
		return reserve_roomfind;
	}
	public void setReserve_roomfind(int reserve_roomfind) {
		this.reserve_roomfind = reserve_roomfind;
	}
	
	
	public String getReserve_userid() {
		return reserve_userid;
	}
	public void setReserve_userid(String reserve_userid) {
		this.reserve_userid = reserve_userid;
	}
	public String getReserve_username() {
		return reserve_username;
	}
	public void setReserve_username(String reserve_username) {
		this.reserve_username = reserve_username;
	}
	public int getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(int reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReserve_night() {
		return reserve_night;
	}
	public void setReserve_night(String reserve_night) {
		this.reserve_night = reserve_night;
	}
	public int getReserve_ref() {
		return reserve_ref;
	}
	public void setReserve_ref(int reserve_ref) {
		this.reserve_ref = reserve_ref;
	}
	public String getReserve_addr() {
		return reserve_addr;
	}
	public void setReserve_addr(String reserve_addr) {
		this.reserve_addr = reserve_addr;
	}
	public String getReserve_pwd() {
		return reserve_pwd;
	}
	public void setReserve_pwd(String reserve_pwd) {
		this.reserve_pwd = reserve_pwd;
	}
	public int getReserve_price() {
		return reserve_price;
	}
	public void setReserve_price(int reserve_price) {
		this.reserve_price = reserve_price;
	}
	public String getReserve_payment() {
		return reserve_payment;
	}
	public void setReserve_payment(String reserve_payment) {
		this.reserve_payment = reserve_payment;
	}
	public String getReserve_payname() {
		return reserve_payname;
	}
	public void setReserve_payname(String reserve_payname) {
		this.reserve_payname = reserve_payname;
	}
	public String getReserve_paynum() {
		return reserve_paynum;
	}
	public void setReserve_paynum(String reserve_paynum) {
		this.reserve_paynum = reserve_paynum;
	}
	public String getReserve_payok() {
		return reserve_payok;
	}
	public void setReserve_payok(String reserve_payok) {
		this.reserve_payok = reserve_payok;
	}
	public String getReserve_regdate() {
		return reserve_regdate;
	}
	public void setReserve_regdate(String reserve_regdate) {
		this.reserve_regdate = reserve_regdate;
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
