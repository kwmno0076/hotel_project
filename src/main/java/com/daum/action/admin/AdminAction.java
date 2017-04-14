package com.daum.action.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.daum.model.admin.AdminBean;

import com.daum.service.admin.AdminService;

@Controller
public class AdminAction {

	@Autowired
	private AdminService adminService;

	//관리자 로그인 
	@RequestMapping("/admin_login.kkc")
	public ModelAndView admin_login(){
		ModelAndView am=new ModelAndView("admin/admin_login");
		return am;
	}

	//관리자 로그인 인증
	@RequestMapping("/admin_login_ok.kkc")
	public ModelAndView admin_login_ok(@ModelAttribute AdminBean ab,
			HttpServletResponse response,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		System.out.println(ab.getAdmin_id());

		AdminBean dm=this.adminService.adminCheck(ab.getAdmin_id());
		//관리자 아이디에 대한 관리자 정보를 오라클로 부터 가져온다.
		System.out.println("d11561");
		//System.out.println(dm.getAdmin_name());

		if(dm==null){
			out.println("<script>");
			out.println("alert('관리자 정보가 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}else{
			if(!dm.getAdmin_pwd().equals(ab.getAdmin_pwd())){
				out.println("<script>");
				out.println("alert('관리자 비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else{
				session.setAttribute("admin_id",dm.getAdmin_id());
				//세션 admin_id키이름에 관리자 아이디 저장
				session.setAttribute("admin_name",dm.getAdmin_name());
				//세션 admin_name키이름에 관리자 이름 저장
				//세션은 서버에서 실행되고 관리자 로그인 인증을 할 때 사용

//				List<PublickkcBean> pcb=this.adminService.getPcb(); 성수기 등 주말관리

				ModelAndView loginM=new ModelAndView("redirect:/admin_main.kkc");
				//loginM.addObject("pcb",pcb);
				//loginM.setViewName("admin/admin_main");

				return loginM;
			}
		}
		return null;
	}//admin_login_ok() end

	//관리자 메인
	@RequestMapping("/admin_main.kkc")
	public ModelAndView admin_main(
			HttpServletResponse response,
			HttpSession session) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String admin_id=(String)session.getAttribute("admin_id");
		//관리자 세션 아이디를 구함.
		if(admin_id==null){
			out.println("<script>");
			out.println("alert('관리자 로그인을 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		}else{
//			List<PublickkcBean> pcb=this.adminService.getPcb(); 성수기등 주말 관리
			ModelAndView wm=new ModelAndView();

//			wm.addObject("pcb",pcb); 성수기 등 주말관리
			wm.setViewName("admin/admin_main");
			return wm;//WEB-INF/jsp/admin/admin_main.jsp 해당 뷰페이지가
			//웹브라우저에 출력
		}
		return null;
	}//admin_main() end

	//관리자 로그아웃
	@RequestMapping("/admin_logout.kkc")
	public ModelAndView admin_logout(HttpServletResponse response,
			HttpSession session) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		session.invalidate();//세션 만료

		out.println("<script>");
		out.println("alert('관리자 로그아웃 되었습니다!');");
		out.println("location='admin_login.kkc';");
		out.println("</script>");

		return null;
	}
}
