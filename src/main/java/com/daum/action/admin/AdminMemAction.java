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

import com.daum.model.MemberBean;
import com.daum.pwdconv.PwdChange;
import com.daum.service.admin.AdminMemService;

@Controller
public class AdminMemAction {

	@Autowired
	private AdminMemService adminMemService;

	//관리자 회원 목록
	@RequestMapping("/admin_mem_list.kkc")
	public ModelAndView admin_mem_list(
			HttpServletResponse response,
			HttpSession session,
			HttpServletRequest request,
			@ModelAttribute MemberBean m)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");

		if(admin_id==null){
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
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
			m.setFind_field(find_field);
			m.setFind_name("%"+find_name+"%");
			//%는 오라클에서 사용하는 하나이상의 임의의 문자와
			//매핑 대응하는 와일드 카드문자

			int listcount=this.adminMemService.getListCount(m);
			//검색전후 회원수

			m.setStartrow((page-1)*5+1);
			m.setEndrow(m.getStartrow()+limit-1);

			List<MemberBean> blist=this.adminMemService.getBbsList(m);
			//검색전후 회원목록

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

			listM.setViewName("admin/admin_mem_list");
			return listM;    	 
		}
		return null;
	}
	//관리자 회원상세정보+수정폼
	@RequestMapping("/admin_mem_info.kkc")
	public ModelAndView admin_mem_info(
			@RequestParam("id") String id,
			@RequestParam("state") String state,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");
		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));    	   
			}
			MemberBean m=this.adminMemService.getMember(id);
			//오라클로 부터 회원정보를 가져옴

			ModelAndView em=new ModelAndView();
			em.addObject("m",m);
			em.addObject("page",page);

			if(state.equals("cont")){//회원상세정보
				em.setViewName("admin/admin_mem_info");
			}else if(state.equals("edit")){//수정폼
				em.setViewName("admin/admin_mem_edit");
			}
			return em;
		}
		return null;
	}
	//회원정보 수정 완료.
	//관리자 회원정보수정 완료
	@RequestMapping("/admin_mem_edit_ok.kkc")
	public ModelAndView admin_mem_edit_ok(
			@ModelAttribute MemberBean m,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");

		if(admin_id==null){
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));    	
			}
			m.setMem_pwd(
					PwdChange.getPassWordToXEMD5String(m.getMem_pwd()));
			//비번 암호화
			this.adminMemService.editMem(m);//정보수정

			out.println("<script>");
			out.println("alert('정보 수정했습니다!');");
			out.println("location='admin_mem_info.kkc?id="+m.getMem_id()+"&state="
					+"edit&page="+page+"';");
			out.println("</script>");
		}
		return null;
	}

	//회원 삭제
	@RequestMapping("/admin_mem_del.kkc")
	public ModelAndView admin_mem_del(
			@RequestParam("id") String id,
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String admin_id=(String)session.getAttribute("admin_id");

		if(admin_id == null){
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));    	  
			}
			this.adminMemService.delMem(id);//회원삭제
			
			ModelAndView m=new ModelAndView();
			m.setViewName("redirect:/admin_mem_list.kkc");
			m.addObject("page",page);
			return m;
			//admin_member_list.do?page=쪽번호 형태의 get방식으
			//로 이동한다.
		}
		return null;
	}


}
