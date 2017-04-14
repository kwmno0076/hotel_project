package com.daum.model;

public class MemberBean {

		private String mem_name;
		private String mem_pwd;
		private String mem_phone;
		private String mem_email;
		private int mem_state;
		private String mem_date;
		private String mem_deldate;
		private String mem_id;
		
		//페이징 관련 변수
		private int startrow;
		private int endrow;
		
		//검색 관련 변수
		private String find_field;//검색필드
		private String find_name;//검색어
		
		
		public String getMem_name() {
			return mem_name;
		}
		public void setMem_name(String mem_name) {
			this.mem_name = mem_name;
		}
		public String getMem_pwd() {
			return mem_pwd;
		}
		public void setMem_pwd(String mem_pwd) {
			this.mem_pwd = mem_pwd;
		}
		public String getMem_phone() {
			return mem_phone;
		}
		public void setMem_phone(String mem_phone) {
			this.mem_phone = mem_phone;
		}
		public String getMem_email() {
			return mem_email;
		}
		public void setMem_email(String mem_email) {
			this.mem_email = mem_email;
		}
		public int getMem_state() {
			return mem_state;
		}
		public void setMem_state(int mem_state) {
			this.mem_state = mem_state;
		}
		public String getMem_date() {
			return mem_date;
		}
		public void setMem_date(String mem_date) {
			this.mem_date = mem_date.substring(0,10);
		}
		public String getMem_deldate() {
			return mem_deldate;
		}
		public void setMem_deldate(String mem_deldate) {
			this.mem_deldate = mem_deldate;
		}
		public String getMem_id() {
			return mem_id;
		}
		public void setMem_id(String mem_id) {
			this.mem_id = mem_id;
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