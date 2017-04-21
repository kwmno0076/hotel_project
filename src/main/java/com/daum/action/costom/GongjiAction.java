package com.daum.action.costom;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daum.model.admin.AdminGongBean;
import com.daum.service.custom.CustomService;

@Controller
public class GongjiAction {

	@Autowired
		private CustomService customservice;
	//관리자 공지목록
		@RequestMapping("/customcenter")
		public ModelAndView customcenter(
				@ModelAttribute AdminGongBean g,
				HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
				int page=1;//쪽번호
				int limit=5;//한페이지에 보여질 목록개수
				if(request.getParameter("page") != null){
					page=Integer.parseInt(request.getParameter("page"));
					//get으로 넘어온 쪽번호는 문자열이기 때문에 정수 숫자
					//로 바꿔서 저장
				}
				String find_field=request.getParameter("find_field");
				//검색 필드
				String find_name=request.getParameter("find_name");
				//검색어
				g.setFind_field(find_field);
				g.setFind_name("%"+find_name+"%");
				//%는 오라클에서 사용하는 하나이상의 임의의 문자와
				//매핑 대응하는 와일드 카드문자

				int listcount=this.customservice.getListCount(g);
				//검색전후 레코드 개수

				g.setStartrow((page-1)*5+1);
				g.setEndrow(g.getStartrow()+limit-1);

				List<AdminGongBean> blist=this.customservice.getGongjiList(g);
				//검색전후 목록

				int maxpage=(int)((double)listcount/limit+0.95);
				//총페이지 수
				int startpage=(((int)((double)page/10+0.9))-1)*10+1;
				//현재페이지에 보여질 시작 페이지(1,11,21...)
				int endpage=maxpage;
				if(endpage>startpage+10-1){
					endpage=startpage+10-1;
				}

				ModelAndView listM=new ModelAndView();
				listM.addObject("blist",blist);
				listM.addObject("listcount",listcount);
				listM.addObject("page",page);//쪽번호
				listM.addObject("startpage",startpage);
				listM.addObject("endpage",endpage);
				listM.addObject("maxpage",maxpage);
				listM.addObject("find_field",find_field);//검색
				//필드
				listM.addObject("find_name",find_name);//검색어

				listM.setViewName("customcenter/customcenter");
				return listM;
		}
		
		//공지 상세보기
		@RequestMapping("/customcenter_cont")
		public ModelAndView customcenter_cont(
				@RequestParam("no") int gongji_no,
				HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session) throws Exception{
			response.setContentType("text/html;charset=UTF-8");    	

				int page=1;
				if(request.getParameter("page") != null){
					page=Integer.parseInt(request.getParameter("page"));    		 
				}
				AdminGongBean g=this.customservice.getGongjiCont(gongji_no);
				String gongji_cont=g.getGongji_cont().replace("\n","<br/>");
				/*
				 * textarea에서 엔터키 친부분을 웹상에서 줄바꿈
				 */
				this.customservice.updateHit(gongji_no);//조회수증가
				
				ModelAndView cm=new ModelAndView();
				cm.addObject("page",page);
				cm.addObject("g",g);
				cm.addObject("gongji_cont",gongji_cont);

				
					cm.setViewName("customcenter/customcenter_cont");
				
				return cm;
		}
}
