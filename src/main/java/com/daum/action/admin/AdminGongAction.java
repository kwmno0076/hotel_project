package com.daum.action.admin;

import java.io.PrintWriter;
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
import com.daum.service.admin.AdminGongService;

@Controller
public class AdminGongAction {
	@Autowired
	private AdminGongService adminGongjiService;

	//관리자 공지작성 폼
	@RequestMapping("/admin_gongji_write.kkc")
	public ModelAndView admin_gongji_write(
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			@ModelAttribute AdminGongBean g) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			g.setGongji_name(admin_id);
			ModelAndView wm=new ModelAndView("admin/admin_gongji_write");
			wm.addObject("page",page);
			return wm;
		}
		return null;
	}
	//관리자 공지 저장
	@RequestMapping("/admin_gongji_write_ok")
	public ModelAndView admin_gongji_write_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session,
			@ModelAttribute AdminGongBean g) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			g.setGongji_name(admin_id);
			g.getGongji_name();
			this.adminGongjiService.insertGongji(g);
			return new ModelAndView("redirect:/admin_gongji_list.kkc");			
		}
		return null;
	}

	//관리자 공지목록
	@RequestMapping("/admin_gongji_list")
	public ModelAndView admin_gongji_list(
			@ModelAttribute AdminGongBean g,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
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

			int listcount=this.adminGongjiService.getListCount(g);
			//검색전후 레코드 개수

			g.setStartrow((page-1)*5+1);
			g.setEndrow(g.getStartrow()+limit-1);

			List<AdminGongBean> blist=this.adminGongjiService.getGongjiList(g);
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

			listM.setViewName("admin/admin_gongji_list");
			return listM;
		}
		return null;
	}
	//관리자 공지상세정보+수정폼
	@RequestMapping("/admin_gongji_cont")
	public ModelAndView admin_gongji_cont(
			@RequestParam("no") int gongji_no,
			@RequestParam("state") String state,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");    	
		PrintWriter out=response.getWriter();
		session=request.getSession();

		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));    		 
			}
			AdminGongBean g=this.adminGongjiService.getGongjiCont(gongji_no);
			String gongji_cont=g.getGongji_cont().replace("\n","<br/>");
			/*
			 * textarea에서 엔터키 친부분을 웹상에서 줄바꿈
			 */

			ModelAndView cm=new ModelAndView();
			cm.addObject("page",page);
			cm.addObject("g",g);
			cm.addObject("gongji_cont",gongji_cont);

			if(state.equals("cont")){
				cm.setViewName("admin/admin_gongji_cont");
			}else if(state.equals("edit")){
				cm.setViewName("admin/admin_gongji_edit");
			}
			return cm;
		}
		return null;
	}

	//관리자 공지 수정
	@RequestMapping("/admin_gongji_edit_ok")
	public ModelAndView admin_gongji_edit_ok(
			@ModelAttribute AdminGongBean eb,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");    	
		PrintWriter out=response.getWriter();
		session=request.getSession();

		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}

			this.adminGongjiService.editBoard(eb);//게시판 수정
			return new ModelAndView(
					"redirect:/admin_gongji_list.kkc?page="+page);			
		}
		return null;
	}

	//관리자 공지삭제	
	@RequestMapping("/admin_gongji_del")
	public ModelAndView admin_gongji_del(
			@RequestParam("no") int no,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();

		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			this.adminGongjiService.deleteGongji(no);//게시판 삭제

			return new ModelAndView(
					"redirect:/admin_gongji_list.kkc?page="+page);
		}
		return null;
	}
}