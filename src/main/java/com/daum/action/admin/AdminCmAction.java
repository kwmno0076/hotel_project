package com.daum.action.admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daum.model.community.CmBean;
import com.daum.service.admin.AdminCmService;

@Controller
public class AdminCmAction {
	
	@Autowired
	private AdminCmService admincmService;
	
	//관리자 게시판 목록
	@RequestMapping("/admin_cm_list")
	public String admin_cm_list(Model listM, @ModelAttribute CmBean cm, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String admin_id=(String)session.getAttribute("admin_id");
		
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			int limit=10;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			String find_name=null;
			String find_field=null;
			
			if(request.getParameter("find_name") != null){
				find_name=request.getParameter("find_name").trim();
				find_name=new String(find_name.getBytes("ISO-8859-1"),"UTF-8");
			}
			
			find_field=request.getParameter("find_field");
			cm.setFind_field(find_field);
			cm.setFind_name("%"+find_name+"%");
			
			int listcount=this.admincmService.getListCount(cm);
			
			cm.setStartrow((page-1)*10+1);
			cm.setEndrow(cm.getStartrow()+limit-1);
			
			List<CmBean> adclist=this.admincmService.getCmList(cm);
			
			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=(((int)((double)page/ 10+0.9)) -1) * 10 +1;
			int endpage= maxpage;
			
			if(endpage>startpage+10-1) endpage=startpage+10-1;
			
			listM.addAttribute("adclist", adclist);
			listM.addAttribute("page", page);
			listM.addAttribute("startpage", startpage);
			listM.addAttribute("endpage", endpage);
			listM.addAttribute("maxpage", maxpage);
			listM.addAttribute("listcount",listcount);	
			listM.addAttribute("find_field",find_field);
			listM.addAttribute("find_name", find_name);
			
			return"admin/admin_cm_list";
		}
		
		return null;
	}
	
	//관리자 글쓰기 폼
	@RequestMapping("/admin_cm_write.kkc")
	public ModelAndView admin_cm_write(HttpServletRequest request, HttpServletResponse response,
			CmBean c, HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		
		if(admin_id==null){
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
		int page=1;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		ModelAndView wm=new ModelAndView();
		
		wm.addObject("page",page);
		wm.setViewName("admin/admin_cm_write");
		return wm;
		}
		return null;
	}
	
	//관리자 게시판 저장
	@RequestMapping("/admin_cm_write_ok.kkc")
    public String admin_cm_write_ok(@ModelAttribute CmBean cb, HttpServletResponse response,
    		HttpServletRequest request,HttpSession session) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		
    	session=request.getSession();
    	String admin_id=(String)session.getAttribute("admin_id");
    	
    	if(admin_id == null){
    		out.println("<script>");
    		out.println("alert('다시 로그인 하세요!');");
    		out.println("location='admin_index.do';");
    		out.println("</script>");
    	}else{
    	this.admincmService.insertBoard(cb);
    	return "redirect:/admin_cm_list.kkc";
    	}
    	return null;
    }
	
	//내용보기
	@RequestMapping("/admin_cm_cont")
    public ModelAndView admin_cm_cont(@RequestParam("cm_no") int cm_no,@RequestParam("state") String state, @ModelAttribute CmBean adcb,
    		HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
    	response.setContentType("text/html;charset=UTF-8");
    	PrintWriter out=response.getWriter();
    	session=request.getSession();
    	String admin_id=(String)session.getAttribute("admin_id");
		
    	if(admin_id == null){
    		out.println("<script>");
    		out.println("alert('다시 로그인 하세요!');");
    		out.println("location='admin_index.do';");
    		out.println("</script>");
    	}else{
    		
    	int page=1;
    	
    	if(request.getParameter("page") != null){
        page=Integer.parseInt(request.getParameter("page"));    		
    	}
    	adcb=this.admincmService.getCont(cm_no);
    	String cm_cont=adcb.getCm_cont().replace("\n","<br/>");
    	//textarea 박스에서 엔터키 친 부분을 다음줄로 개행
    	
    	ModelAndView bm=new ModelAndView();
    	bm.addObject("adcb",adcb);
    	bm.addObject("cm_cont",cm_cont);
    	bm.addObject("page",page);
    	
        if(state.equals("cont")){
        	bm.setViewName("admin/admin_cm_cont");
        }else if(state.equals("edit")){
        	bm.setViewName("admin/admin_cm_edit");
        }else if(state.equals("del")){
        	bm.setViewName("admin/admin_cm_del");
        }
    	return bm;
    	}
    	return null;
    }
	
	//수정
	@RequestMapping("/admin_cm_edit_ok")
	public String admin_cm_edit_ok(@ModelAttribute CmBean cb,HttpServletResponse response,
		HttpServletRequest request,HttpSession session) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		  
		String admin_id=(String)session.getAttribute("admin_id");
		
		if(admin_id ==null){
			  out.println("<script>");
			  out.println("alert('다시 로그인 하세요!');");
			  out.println("location='admin_login.kkc';");
			  out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				  page=Integer.parseInt(request.getParameter("page"));
			}
			
			this.admincmService.editCm(cb);
			return "redirect:admin_cm_list.kkc?page="+page;
		}
		  return null;
	}
	
	//삭제
	@RequestMapping("/admin_cm_del.kkc")
	  public String admin_cm_del( @RequestParam("cm_no") int cm_no, @ModelAttribute CmBean cb,
			  HttpServletResponse response,HttpServletRequest request, HttpSession session) throws Exception{
		
		  response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  
		  session=request.getSession();
		  String admin_id=(String)session.getAttribute("admin_id");
		  
		  if(admin_id==null){
			  out.println("<script>");
			  out.println("alert('다시 로그인 하세요!');");
			  out.println("location='admin_login.kkc';");
			  out.println("</script>");
		  }else{
			  int page=1;
			  if(request.getParameter("page") != null){
				  page=Integer.parseInt(request.getParameter("page"));
			  }
			  cb=this.admincmService.getCont(cm_no);
			  //디비로 부터 비번을 가져옴.
			  this.admincmService.delCm(cm_no);
			  return "redirect:/admin_cm_list.kkc?page="+page;
		  }
		  return null;
	  }
	
}
