package com.daum.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.daum.model.ReserveBean;
import com.daum.service.AdminReserveService;

@Controller
public class AdminReserveAction {

	@Autowired
	private AdminReserveService adminreserve;

	@RequestMapping("/admin_reserve_list.kkc")
	public ModelAndView reserve_list(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String admin_id = (String) session.getAttribute("admin_id");
		// 관리자 로그인 인증 세션 아이디를 구함.

		if (admin_id == null) {
			out.println("<script>");
			out.println("alert('관리자로 로그인 하세요!');");
			out.println("location='admin_login.kkc';");
			out.println("</script>");
		} else {
			ReserveBean bean = new ReserveBean();

			int page = 1;
			int limit = 10;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}

			String find_field = null;
			String find_name = null;

			find_field = request.getParameter("find_field");
			find_name = request.getParameter("find_name");
			bean.setFind_field(find_field);
			bean.setFind_name("%" + find_name + "%");
			//검색 전 후 레코드를 구한다. 총 개수
			int totalCount = this.adminreserve.getReserveListCount(bean);

			bean.setStartrow((page - 1) * 10 + 1);// 시작행번호
			bean.setEndrow(bean.getStartrow() + limit - 1);// 끝행번호

			List<ReserveBean> list = this.adminreserve.getReserveList(bean);

			// 총페이지수
			int maxpage = (int) ((double) totalCount / limit + 0.95);// 총페이지수
			int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;// 시작페이지
			int endpage = maxpage;// 마지막페이지
			if (endpage > startpage + 10 - 1) {
				endpage = startpage + 10 - 1;
			}

			ModelAndView listR = new ModelAndView();
			listR.addObject("listR", list);
			listR.addObject("page", page);// 현재쪽번호 저장
			listR.addObject("startpage", startpage);// 시작페이지
			listR.addObject("endpage", endpage);// 마지막페이지
			listR.addObject("maxpage", maxpage);// 총 페이지수
			listR.addObject("totalCount", totalCount);// 총 레코드 개수
			listR.addObject("find_field", find_field);
			listR.addObject("find_name", find_name);

			listR.setViewName("admin/admin_reserve_list");
			return listR;
		}
		return null;
	}
	
	
	
	
	

}


