package com.daum.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainAction {
	
	//index.jsp 메인화면 매핑
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	
	
	
	
	//고객센터
	@RequestMapping("/customcenter")
	public String customcenter(){
		return "customcenter/customcenter";
	}
	
	//포토텔
	@RequestMapping("/h_photo")
	public String h_photo(){
	return "hotel_photo/h_photo";
		}
	//포토텔
		@RequestMapping("/h_photo2")
		public String h_photo2(){
		return "hotel_photo/h_photo2";
			}
		//포토텔
		@RequestMapping("/h_photo3")
		public String h_photo3(){
		return "hotel_photo/h_photo3";
			}//포토텔
		@RequestMapping("/h_photo4")
		public String h_photo4(){
		return "hotel_photo/h_photo4";
			}//포토텔
		@RequestMapping("/h_photo5")
		public String h_photo5(){
		return "hotel_photo/h_photo5";
			}
		
	//호텔메인
	@RequestMapping("/map")
	public String map(){
		return "hotel/map";
	}
	
	
	
	//로그인창
	@RequestMapping("/login")
	public String login(){
		return "member/login";
	}
	
	//회원가입
	@RequestMapping("/join")
	public String join(){
		return "member/join";
	}
	
	//아이디 찾기
	@RequestMapping("/findid")
	public String findid(){
		return "member/findid";
	}
	
	//비빌번호 찾기
	@RequestMapping("/findpwd")
	public String findpwd(){
		return "member/findpwd";
	}
	
}
