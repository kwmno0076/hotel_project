package com.daum.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.daum.model.admin.AdminGongBean;
import com.daum.model.community.CmBean;
import com.daum.model.community.PtcmBean;
import com.daum.service.admin.AdminGongService;
import com.daum.service.community.CmService;
import com.daum.service.community.PtcmService;

@Controller
public class MainAction {
	
	@Autowired
	private PtcmService ptcmService;
	
	@Autowired
	private CmService cmService;
	
	@Autowired
	private AdminGongService adminGongjiService;
	
	//index.jsp 메인화면 매핑
	@RequestMapping("/index")
	public String index(Model listM, Model listC, Model listG,HttpServletRequest request, 
			@ModelAttribute PtcmBean pb, @ModelAttribute CmBean c,@ModelAttribute AdminGongBean g)throws Exception{
		
		
		int page=1;
		int limit=4;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));			
		}
		String find_name=null;//검색어를 저장할 변수명
		String find_field=null;//검색필드를 저장할 변수명

		if(request.getParameter("find_name") != null){
	        find_name=request.getParameter("find_name").trim();	
	 find_name=new String(find_name.getBytes("ISO-8859-1"),"UTF-8");
	 //get방식으로 넘어온 한글을 안깨지게 할려면 String클래스의 
	 //getBytes()메서드를 사용해야 한다.
			}
			find_field=request.getParameter("find_field");
			//검색필드를 저장함.bbs_title,bbs_cont를 저장
			pb.setFind_field(find_field);
			pb.setFind_name("%"+find_name+"%");
			//%는 오라클 쿼리문 검색연산자로서 하나이상의임의의 문자와
			//매핑을 한다.
			//검색전 총레코드개수,제목 검색후 레코드 개수,
			//내용 검색후 레코드 개수
			int listcount=this.ptcmService.getListCount(pb);		
	        			
			pb.setStartrow((page-1)*10+1);
			pb.setEndrow(pb.getStartrow()+limit-1);
			
			List<PtcmBean> plist=
					this.ptcmService.getptcmList(pb);
	        //검색전 총 목록 개수와 검색 후 검색된 목록 개수 			
			//총 페이지 수.
			int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리.
			//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
			int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
			//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
			int endpage = maxpage;

			if (endpage>startpage+10-1) endpage=startpage+10-1;
			
			listM.addAttribute("plist", plist);
			listM.addAttribute("page", page);
			listM.addAttribute("startpage", startpage);
			listM.addAttribute("endpage", endpage);
			listM.addAttribute("maxpage", maxpage);
			listM.addAttribute("listcount",listcount);	
			listM.addAttribute("find_field",find_field);
			listM.addAttribute("find_name", find_name);
			
			
			
			
			int page1=1;//쪽번호
			int limit1=5;//한페이지에 보여질 목록개수
			
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			c.setFind_field(find_field);
			c.setFind_name("%"+find_name+"%");//%는 오라클에서 사용하는 하나이상의 임의의 문자와 매핑대응하는 와일드 카드문자
			
			int listcount1=this.cmService.getListCount(c);
			
			c.setStartrow((page-1)*10+1);
			c.setEndrow(c.getStartrow()+limit1-1);
			
			List<CmBean> clist=this.cmService.getCmList(c);//검색전후 목록
			
			int maxpage1=(int)((double)listcount/limit1+0.95);//총페이지수
			int startpage1=(((int)((double)page/10+0.9))-1)*10+1;
			//현재페이지에 보여질 시작페이지
			
			int endpage1=maxpage1;
			if(endpage1>startpage1+10-1){
				endpage1=startpage1+10-1;
			}
			
			listC.addAttribute("clist",clist);
			listC.addAttribute("listcount1",listcount1);
			
//			ModelAndView listC=new ModelAndView();
//			listC.addObject("clist",clist);
//			listC.addObject("listcount1",listcount1);
//			listC.addObject("page",page);//쪽번호
//			listC.addObject("startpage",startpage);
//			listC.addObject("endpage",endpage);
//			listC.addObject("maxpage",maxpage);
//			listC.addObject("find_field",find_field1);//검색필드
//			listC.addObject("find_name",find_name1);//검색어
//			listC.setViewName("community/cm_list");
			
			
			List<AdminGongBean> blist=this.adminGongjiService.getGongjiList(g);
			
			listG.addAttribute("blist",blist);
			listG.addAttribute("listcount",listcount);
			
		
		return "index";
	}
	

	
	
	
//	//고객센터
//	@RequestMapping("/customcenter")
//	public String customcenter(){
//		return "customcenter/customcenter";
//	}
	
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
