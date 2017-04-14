package com.daum.action.community;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

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

import com.daum.dao.PhotoVo;
import com.daum.model.community.CmBean;
import com.daum.model.community.CommentBean;
import com.daum.service.community.CmService;

@Controller
public class CmAction {
	
	@Autowired
	private CmService cmService;
	
	//게시판 글쓰기
	@RequestMapping("/cm_write")
	public String cm_write(HttpServletRequest request, Model m){
		int page= 1;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page",page);//쪽번호 저장
		return "community/cm_write";//뷰페이지 폴더와 파일명 설정
	}
	
	//게시판 저장
	@RequestMapping("/cm_write_ok")
	public ModelAndView cm_write_ok(@ModelAttribute CmBean c,HttpServletRequest request, HttpSession session)throws Exception{
		
//		session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		c.setCm_mem_id(id);
		
		this.cmService.insertCm(c);
		return new ModelAndView("redirect:/cm_list.kkc");
	}
	
	//게시판 목록
	@RequestMapping("/cm_list")
	public ModelAndView cm_list(HttpServletRequest request,@ModelAttribute CmBean c){
		int page=1;//쪽번호
		int limit=10;//한페이지에 보여질 목록개수
		
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		String find_field=request.getParameter("find_field");//검색필드
		String find_name=request.getParameter("find_name");//검색어
		
		c.setFind_field(find_field);
		c.setFind_name("%"+find_name+"%");//%는 오라클에서 사용하는 하나이상의 임의의 문자와 매핑대응하는 와일드 카드문자
		
		int listcount=this.cmService.getListCount(c);
		
		c.setStartrow((page-1)*10+1);
		c.setEndrow(c.getStartrow()+limit-1);
		
		List<CmBean> clist=this.cmService.getCmList(c);//검색전후 목록
		
		int maxpage=(int)((double)listcount/limit+0.95);//총페이지수
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재페이지에 보여질 시작페이지
		
		int endpage=maxpage;
		if(endpage>startpage+10-1){
			endpage=startpage+10-1;
		}
		
		ModelAndView listM=new ModelAndView();
		listM.addObject("clist",clist);
		listM.addObject("listcount",listcount);
		listM.addObject("page",page);//쪽번호
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
		listM.addObject("find_field",find_field);//검색필드
		listM.addObject("find_name",find_name);//검색어

		listM.setViewName("community/cm_list");
		return listM;
	}
	
	//내용보기,수정,삭제,조회수증가,댓글
	@RequestMapping("/cm_cont")
	public ModelAndView cm_cont(@RequestParam("no") int cm_no,@RequestParam("state") String state,
			CmBean c,HttpServletRequest request,HttpSession session)throws Exception{
		
		int page=1;
		
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int com_count=0;//댓글 개수를 저장하기위한 변수
		
		if(state.equals("cont")){//내용보기 일때만 실행
			this.cmService.updateHit(cm_no);//조회수증가
			com_count=this.cmService.getComCount(cm_no);//댓글 개수를 저장
		}
		
		c=this.cmService.getCmCont(cm_no);
		String cont=c.getCm_cont().replace("\n","<br/>");
		
		List<CommentBean> cmlist=this.cmService.getComList(cm_no);
		
		ModelAndView cm=new ModelAndView();
		cm.addObject("c",c); cm.addObject("page",page); cm.addObject("cont",cont);
		cm.addObject("com_count",com_count); cm.addObject("cmlist",cmlist);
		
		if(state.equals("cont")){//내용보기일때
			cm.setViewName("community/cm_cont");
		}else if(state.equals("edit")){//수정일때
			cm.setViewName("community/cm_edit");
		}else if(state.equals("del")){//삭제일때
			cm.setViewName("community/cm_del");
		}
		return cm;
	}
	
	//게시판 수정완료
	@RequestMapping("/cm_edit_ok")
	public ModelAndView cm_edit_ok(@ModelAttribute CmBean cb,HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int page=1;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		CmBean db_pwd=this.cmService.getCmCont(cb.getCm_no());
		
		if(!db_pwd.getCm_pwd().equals(cb.getCm_pwd())){
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else{
			this.cmService.editCm(cb);//게시판수정
			return new ModelAndView("redirect:/cm_cont.kkc?no="+cb.getCm_no()+"&page="+page+"&state=cont");
		}
		return null;
	}
	
	//게시판 삭제
	@RequestMapping("/cm_del_ok")
	public ModelAndView cm_del_ok(@RequestParam("cm_no") int cm_no, @RequestParam("del_pwd") String del_pwd,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out= response.getWriter();
		
		int page=1;
		
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		CmBean db_pwd=this.cmService.getCmCont(cm_no);
		
		if(!db_pwd.getCm_pwd().equals(del_pwd)){
			out.println("<script>");
	    	out.println("alert('비번이 다릅니다!');");
	    	out.println("history.go(-1);");
	    	out.println("</script>");
		}else{
			this.cmService.deleteCm(cm_no);//삭제
			return new ModelAndView("redirect:/cm_list.kkc?=page"+page);
		}
		return null;
	}
	
	//댓글 저장
	@RequestMapping(value="/comment_ok.kkc")
	public String com_ok(@ModelAttribute CommentBean cb, HttpServletResponse response,
			HttpServletRequest request) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int page=1;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		if(cb.getC_cont().length() > 200){
			out.println("<script>");
			out.println("alert('댓글은 200자 초과를 못합니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		}else{
			this.cmService.insertCom(cb);//댓글 저장
			
			return "redirect:/cm_cont.kkc?no="+cb.getCm_no()+"&state=cont&page="+page;
			//get 방식으로 *.do?no=번호값&state=cont&page=쪽번호 3개의 피라미터값을 넘김
		}
		return null;
	}
	
	//댓글 삭제
	@RequestMapping(value="/comment_del_ok.kkc")
	public String com_del_ok(@RequestParam("c_no") int c_no, @RequestParam("cm_no") int cm_no,
			@RequestParam("state") String state,HttpServletRequest request){

		int page=1;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		this.cmService.com_del(c_no);//댓글 삭제
		
		return "redirect:/cm_cont.kkc?no="+cm_no+"&state="+state+"&page="+page;
	}
	
	
	//단일파일업로드
	@RequestMapping("/photoUpload")
	public String photoUpload(HttpServletRequest request, PhotoVo vo){
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "photo_upload" + File.separator;             
	            File file = new File(path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 /////////////////
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/project/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
		//다중파일업로드
	@RequestMapping("/multiplePhotoUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "photo_upload" + File.separator;//filePath파일경로 
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         System.out.println(rlFileNm);
	         ///////////////// 서버에 파일쓰기 /////////////////
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/project/photo_upload/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	
}
