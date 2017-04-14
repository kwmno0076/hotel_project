package com.daum.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.daum.model.HotelBean;
import com.daum.service.HotelService;


@Controller
public class HotelAction {

	@Autowired // HotelService에 있는 변수 선언명이랑 일치할시 사용가능
	private HotelService hotelService;

	// //호텔 메인페이지
	// @RequestMapping("/h_list")
	// public String hotel(){
	// return "hotel/h_list";
	// }
	//

	// 자료실 글쓰기
	/*@RequestMapping("/h_write")
	public String h_write(HttpServletRequest request, Model m) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page", page);// 쪽번호 저장
		return "hotel/h_write";
		// 뷰페이지 폴더와 파일명 설정
	}*/

	// 호텔 정보 저장

	/*@RequestMapping("/h_write_ok")
	public String h_write_ok(@ModelAttribute HotelBean h, HttpServletRequest request) throws Exception {
		String saveFolder = request.getSession().getServletContext().getRealPath("");

		// 이진파일 업로드 서버 경로
		int fileSize = 5 * 1024 * 1024;// 이진파일 업로드 최대크기,
		// 5M

		MultipartRequest multi = null;// 이진파일 업로드 참조변수
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");
		
		 * 1. 생성자의 첫번째 전달인자 request는 사용자폼에서 입 력한 정보를 서버로 가져오는 역할 2.saveFolder는
		 * 이진파일 업로드 서버경로 3.fileSize는 이진파일 업로드 최대크기 4.UTF-8은 언어코딩 타입
		 
		String h_name = multi.getParameter("h_name"); // 작성자
		String h_phone = multi.getParameter("h_phone"); // 작성자 즉 호텔번호
		
		String h_title = multi.getParameter("h_title"); // 호텔 이름
		

		String h_room = multi.getParameter("h_room"); // 호텔 방이름

		int h_price_room = Integer.parseInt(multi.getParameter("h_price_room")); // 호텔
																					// 금액

		String h_option = multi.getParameter("h_option"); // 호텔 옵션명

		int h_price_option = Integer.parseInt(multi.getParameter("h_price_option")); // 호텔 옵션 금액 
																						
		String h_bank = multi.getParameter("h_bank"); // 은행명
		String h_anumber = multi.getParameter("h_anumber"); // 계좌번호
		
		String h_local = multi.getParameter("h_local");

		String h_pwd = multi.getParameter("h_pwd"); // 패스워드
		String h_cont = multi.getParameter("h_cont"); // 내용

		File UpFile = multi.getFile("h_file");// 첨부한이진파일
		// 을 가져옴.
		if (UpFile != null) {// 첨부한 이진파일이 있다면
			String fileName = UpFile.getName();// 첨부한 파일명
			// 저장
			Calendar c = Calendar.getInstance();
			// Calendar는 추상클래스로서 년월일 시분초를 구함.
			int year = c.get(Calendar.YEAR);// 년도값
			int month = c.get(Calendar.MONTH) + 1;// 월값.+1을 한
			// 이유는 1월이 0으로 반환도기 때문이다.
			int date = c.get(Calendar.DATE);// 일값
			String homedir = saveFolder + "upload/" + year + "-" + month + "-" + date;
			// 새로운 이진파일 업로드 폴더 경로를 저장
			File path1 = new File(homedir);
			if (!(path1.exists())) {
				path1.mkdir();// 새로운 폴더를 생성
			}
			Random r = new Random();
			int random = r.nextInt(100000000);// 1억사이 임의의
			// 정수 난수를 발생
			 확장자 구하기 
			int index = fileName.lastIndexOf(".");// 첨부한 파일
			// 에서 마침표 위치번호를 구함
			String fileExtension = fileName.substring(index + 1);
			// 첨부한 파일에서 확장자만 구함
			String refileName = "hotel" + year + month + date + random + "." + fileExtension;// 새로운
																								// 파일명
																								// 저장
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;// 오라클에
																							// 저장될
																							// 레코드값
			UpFile.renameTo(new File(homedir + "/" + refileName));
			// 바뀌어진 이진파일로 폴더에 업로드
			h.setH_file(fileDBName);
		} else {// 파일을 첨부하지 않았을때
			String fileDBName = "";
			h.setH_file(fileDBName);
		}

		h.setH_name(h_name);
		h.setH_phone(h_phone);
		h.setH_title(h_title);
		h.setH_room(h_room);
		h.setH_price_room(h_price_room);
		h.setH_option(h_option);
		h.setH_price_option(h_price_option);
		h.setH_bank(h_bank);
		h.setH_anumber(h_anumber);
		
		h.setH_local(h_local);
		
		h.setH_cont(h_cont);

		this.hotelService.insertHotel(h);// 자료실 저장

		return "redirect:/h_list.kkc";
	}*/

	// 호텔 목록 보기
	@RequestMapping("/h_list")
	public ModelAndView h_list(HttpServletRequest request, @ModelAttribute HotelBean h) {

		int page = 1;// 쪽번호
		int limit = 5;// 한페이지에 보여질 목록개수
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			// get으로 넘어온 쪽번호는 문자열이기 때문에 정수 숫자
			// 로 바꿔서 저장
		}
		String find_field = request.getParameter("find_field");
		// 검색 필드
		String find_name = request.getParameter("find_name");
		// 검색어
		h.setFind_field(find_field);
		h.setFind_name("%" + find_name + "%");
		// %는 오라클에서 사용하는 하나이상의 임의의 문자와
		// 매핑 대응하는 와일드 카드문자

		int listcount = this.hotelService.getListCount(h);
		// 검색전후 레코드 개수

		h.setStartrow((page - 1) * 5 + 1);
		h.setEndrow(h.getStartrow() + limit - 1);

		List<HotelBean> hlist = this.hotelService.getHotelList(h);
		// 검색전후 목록

		String path = "upload";
		
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 총페이지 수
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재페이지에 보여질 시작 페이지(1,11,21...)
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1) {
			endpage = startpage + 10 - 1;
		}

		ModelAndView listH = new ModelAndView();
		listH.addObject("hlist", hlist);
		listH.addObject("page", page);// 쪽번호
		listH.addObject("startpage", startpage);
		listH.addObject("endpage", endpage);
		listH.addObject("maxpage", maxpage);
		listH.addObject("find_field", find_field);// 검색
		// 필드
		listH.addObject("find_name", find_name);// 검색어
		listH.addObject("path", path);
		listH.addObject("listcount", listcount);
		listH.setViewName("/hotel/h_list");

		return listH;
	}

	// 내용상세보기,수정폼,삭제폼,답변폼

	/*@RequestMapping("/h_cont")
	public ModelAndView h_cont(@RequestParam("no") int h_no, @RequestParam("state") String state,
			HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		this.hotelService.updateHit(h_no);// 조회수 증가 == 나중에 즐겨찾는 목록 만들수도?
		HotelBean h = this.hotelService.getHotelCont(h_no);

		ModelAndView hm = new ModelAndView();
		hm.addObject("h", h);
		hm.addObject("page", page);

		if (state.equals("cont")) {// 내용보기일때
			hm.setViewName("hotel/h_cont");
		} else if (state.equals("edit")) {// 수정폼
			hm.setViewName("hotel/h_edit");
		} else if (state.equals("del")) {// 삭제폼
			hm.setViewName("hotel/h_del");
		}
		return hm;
	}*/

	/*// 수정완료
	@RequestMapping("/h_edit_ok")
	public ModelAndView h_edit_ok(HttpServletRequest request, HttpServletResponse response, @ModelAttribute HotelBean h)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String saveFolder = request.getSession().getServletContext().getRealPath("");
		// 이진파일 업로드 서버경로
		int fileSize = 5 * 1024 * 1024;// 이진파일 최대크기,5메가바이트

		MultipartRequest multi = null;// 이진파일 업로드 참조변수
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8");

		int h_no = Integer.parseInt(multi.getParameter("h_no"));
		int page = 1;
		if (multi.getParameter("page") != null) {
			page = Integer.parseInt(multi.getParameter("page"));
		}
		String h_name = multi.getParameter("h_name").trim();
		String h_phone = multi.getParameter("h_phone").trim(); // 호텔번호
		String h_title = multi.getParameter("h_title").trim();

		String h_room = multi.getParameter("h_room"); // 호텔 방이름

		int h_price_room = Integer.parseInt(multi.getParameter("h_price_room")); // 금액
		String h_option = multi.getParameter("h_option").trim(); // 호텔 옵션
		int h_price_option = Integer.parseInt(multi.getParameter("h_price_option")); // 옵션 금액
		
		String h_bank = multi.getParameter("h_bank").trim(); // 은행명
		String h_anumber = multi.getParameter("h_anumber").trim(); // 계좌번호
		
		String h_local = multi.getParameter("h_local").trim(); //지역 

		String h_pwd = multi.getParameter("h_pwd").trim();
		String h_cont = multi.getParameter("h_cont").trim();
		
		HotelBean db_pwd = this.hotelService.getHotelCont(h_no);
		
		if (!db_pwd.getH_pwd().equals(h_pwd)) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			File upFile = multi.getFile("h_file");// 첨부한 이진파
			// 일을 가져옴.
			if (upFile != null) {// 첨부한 파일이 있는 경우
				String fileName = upFile.getName();// 첨부한파일명
				File DelFile = new File(saveFolder + db_pwd.getH_file());
				// 삭제할 파일 객체 생성
				if (DelFile.exists()) {
					DelFile.delete();// 기존 이진파일 삭제
				}
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				int month = c.get(Calendar.MONTH) + 1;
				int date = c.get(Calendar.DATE);

				String homedir = saveFolder + "upload/" + year + "-" + month + "-" + date;
				File path1 = new File(homedir);
				if (!(path1.exists())) {
					path1.mkdir();// 오늘날짜 폴더 생성
				}
				Random r = new Random();
				int random = r.nextInt(100000000);
				 수정 첨부한 파일 확장자 구함 
				int index = fileName.lastIndexOf(".");// 마침표 위치번호
				String fileExtension = fileName.substring(index + 1);
				// 파일 확장자
				String refileName = "hotel" + year + month + date + random + "." + fileExtension;// 바뀌어질
																									// 이진파일명
				String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;// 오라클에
																								// 저장될
																								// 레코드값
				upFile.renameTo(new File(homedir + "/" + refileName));
				// 바뀌어진 이진파일로 실제파일 업로드
				h.setH_file(fileDBName);
			} else {// 파일을 첨부하지 않았을때
				String fileDBName = "";
				if (db_pwd.getH_file() != null) {// 기존 이진파일
					// 이 있는 경우
					h.setH_file(db_pwd.getH_file());
				} else {
					h.setH_file(fileDBName);
				}
			}
			h.setH_no(h_no);
			
			h.setH_name(h_name);
			h.setH_phone(h_phone);
			h.setH_title(h_title);
			h.setH_room(h_room);
			h.setH_price_room(h_price_room);
			h.setH_option(h_option);
			h.setH_price_option(h_price_option);
			h.setH_bank(h_bank);
			h.setH_anumber(h_anumber);
			h.setH_local(h_local);
			h.setH_cont(h_cont);

			this.hotelService.Hoteledit(h);// 자료실 수정

			ModelAndView em = new ModelAndView("redirect:/h_cont.kkc");
			em.addObject("no", h_no);
			em.addObject("page", page);
			em.addObject("state", "cont");
			return em;
			// h_cont.do?no=번호값&page=쪽번호&state=cont 3 개의 인자
			// 값이 웹주소창에 노출되는 get방식으로 이동한다.
	}

	// 자료실 삭제완료
	@RequestMapping("/h_del_ok")
	public ModelAndView h_del_ok(@RequestParam("h_no") int h_no, @RequestParam("del_pwd") String del_pwd,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String up = request.getSession().getServletContext().getRealPath("");
		// 이진파일 서버 업로드 경로
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		HotelBean db_pwd = this.hotelService.getHotelCont(h_no);

		if (!db_pwd.getH_pwd().equals(del_pwd)) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			this.hotelService.Hoteldel(h_no);// 자료실 삭제
			if (db_pwd.getH_file() != null) {
				// 첨부한 이진파일이 있는 경우
				File file = new File(up + db_pwd.getH_file());
				file.delete();// 이진파일을 폴더로 부터 삭제
			}
			return new ModelAndView("redirect:/h_list.kkc?page=" + page);
		
	}
	*/
	
	
	
	
	//호텔 예약페이지 연동과정
	/*@RequestMapping("/h_reserve")
	public ModelAndView h_reserve(@RequestParam("h_no") int h_no, @RequestParam("state") String state,
			HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		
		HotelBean h = this.hotelService.getHotelCont(h_no);
		String path = "/upload";
		
		ModelAndView hmr = new ModelAndView();
		hmr.addObject("h", h);
		hmr.addObject("page", page);
		hmr.addObject("path", path);
		
		if (state.equals("reserve")) {// 예약연동
			hmr.setViewName("reserve/h_reserve");
		}
		return hmr;
	}
	*/
	
	//호텔 예약공간
			
	

} // end
