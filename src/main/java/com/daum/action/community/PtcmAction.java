package com.daum.action.community;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
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

import com.daum.model.community.PtcmBean;
import com.daum.model.community.PtcommentBean;
import com.daum.service.community.PtcmService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class PtcmAction {
	
	@Autowired
	private PtcmService ptcmService;
	
	//게시판 글쓰기
	@RequestMapping("/ptcm_write")
	public String cm_write(HttpServletRequest request, Model m){
		int page= 1;
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		m.addAttribute("page",page);//쪽번호 저장
		return "community/ptcm_write";//뷰페이지 폴더와 파일명 설정
	}
	
	//멀티 이진파일 업로드
	@RequestMapping("ptcm_write_ok")
	public ModelAndView ptcm_write_ok(@ModelAttribute PtcmBean pb, HttpServletRequest request, HttpSession session) throws Exception{
		
		
		String savePath="D:/Spring_program/STS_Project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project/upload";
		//이진파일 업로드 서버 경로
		
		int fileSize=5*1024*1024;
		//이진파일 업로드 최대크기
		
		List<String> saveFiles=new ArrayList<String>();
		List<String> ori_saveFiles=new ArrayList<String>();
		
		MultipartRequest multi=null; //이진파일 업로드 변수 선언
		
		multi=new MultipartRequest(request,savePath,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		//이진파일 업로드 객체 생성
		//5번째 인자값 new DefaultFileRenamePolicy()라고 
		//지정하면 파일 중복 처리를 하는 인자값이다.
		//만약 a.txt 
		//중복 파일을 업로드 하면 두번째 첨부된 동일 파일명은
		//a1.txt로 처리한다.
		
		String pt_name=multi.getParameter("pt_name").trim();
		String pt_title=multi.getParameter("pt_title").trim();
		String pt_pwd=multi.getParameter("pt_pwd").trim();
		String pt_cont=multi.getParameter("pt_cont").trim();
		
		Enumeration files=multi.getFileNames();		
		
		while(files.hasMoreElements()){
			String name=(String)files.nextElement();
			//input type="file" 의 피라미터 이름을 가져옴.
			if(files.hasMoreElements()){
				saveFiles.add(multi.getFilesystemName(name)+",");//하나이상의 type="file"일 경우 ,로 구분해서 저장
				ori_saveFiles.add(multi.getOriginalFileName(name)+",");
			}else{
				saveFiles.add(multi.getFilesystemName(name));    
				ori_saveFiles.add(multi.getOriginalFileName(name));
			}
		}
		
		StringBuffer f=new StringBuffer();
		StringBuffer f2=new StringBuffer();
		
		
		for(int i=0;i<saveFiles.size();i++){
			f.append(saveFiles.get(i));//업로드 된 실제 파일을 버퍼에 누적해서 저장.
		}//일반 for
		
		for(int i=0;i<saveFiles.size();i++){
			f2.append(ori_saveFiles.get(i));//업로드 되기전 원래파일을 버퍼에 누적해서 저장
		}
		
		pb.setPt_file(f.toString());
		pb.setOri_pt_file(f2.toString());
		
		
		pb.setPt_name(pt_name); pb.setPt_title(pt_title);
		pb.setPt_pwd(pt_pwd); pb.setPt_cont(pt_cont);
		
		this.ptcmService.insertPtcmfile(pb);
		
		ModelAndView m=new ModelAndView("redirect:/ptcm_list.kkc");
		return m;
	}
	
	//목록보기
	@RequestMapping("/ptcm_list")
	public String ptcm_list(Model listM,
			HttpServletRequest request,
			@ModelAttribute PtcmBean pb) throws Exception{
		
		int page=1;
		int limit=12;
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
			
		return "community/ptcm_list";
	}
	
	//내용보기
	@RequestMapping("/ptcm_cont")
	public  ModelAndView ptcm_cont(@RequestParam("no") int pt_no, @RequestParam("state") String state,
			HttpServletRequest request,HttpSession session) throws Exception{
		session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		int page=1;
		
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int ptcom_count=0;//댓글 개수를 저장하기위한 변수
		
		if(state.equals("cont")){//내용보기 일때만 실행
			this.ptcmService.updateHit(pt_no);//조회수증가
			ptcom_count=this.ptcmService.getPtComCount(pt_no);//댓글 개수를 저장
		}
		
		PtcmBean p=this.ptcmService.getPtcmCont(pt_no);
		String cont=p.getPt_cont().replace("\n","<br/>");
		
		List<PtcommentBean> pclist=this.ptcmService.getPtComList(pt_no);
		
		ModelAndView cm=new ModelAndView();
		cm.addObject("p",p); cm.addObject("page",page); cm.addObject("cont",cont);
		cm.addObject("ptcom_count",ptcom_count); cm.addObject("pclist",pclist);
		
		if(state.equals("cont")){//내용보기일때
			cm.setViewName("community/ptcm_cont");
		}else if(state.equals("edit")){//수정일때
			cm.setViewName("community/ptcm_edit");
		}else if(state.equals("del")){//삭제일때
			cm.setViewName("community/ptcm_del");
		}
		return cm;
	}
	
	//게시판 수정완료
	@RequestMapping(value="/ptcm_edit_ok")
	public ModelAndView ptcm_edit_ok(HttpServletRequest request,HttpServletResponse response,
			@ModelAttribute PtcmBean pb) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String savePath="D:/Spring_program/STS_Project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/project/upload";
		//이진파일 업로드 서버 경로
		int fileSize=5*1024*1024;
		
		List<String> saveFiles=new ArrayList<String>();
		List<String> ori_saveFiles=new ArrayList<String>();

		MultipartRequest multi=null;//이진파일을 받을수 있는 레퍼런스
		multi=new MultipartRequest(request,savePath,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		//이진파일 업로드 객체 생성
		//request는 사용자폼에서 입력한 정보를 서버로 가져온다.
		//saveFoder는 이진파일 업로드 서버 경로
		//fileSize는 이진파일 업로드 최대크기,UTF-8은 언어코딩 타입
 
		int pt_no=Integer.parseInt(multi.getParameter("pt_no"));
		int page=1;
		if(multi.getParameter("page") != null){
			page=Integer.parseInt(multi.getParameter("page"));
		}
		String pt_name=multi.getParameter("pt_name").trim();
		String pt_title=multi.getParameter("pt_title").trim();
		String pt_pwd=multi.getParameter("pt_pwd").trim();
		String pt_cont=multi.getParameter("pt_cont").trim();
 
		pb=this.ptcmService.getPtcmCont(pt_no);//디비로 부터 비번을 가져옴.
		if(!pb.getPt_pwd().equals(pt_pwd)){
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else{
			Enumeration files=multi.getFileNames();		
			
			while(files.hasMoreElements()){
				String name=(String)files.nextElement();
				//input type="file" 의 피라미터 이름을 가져옴.
				if(files.hasMoreElements()){
					saveFiles.add(multi.getFilesystemName(name)+",");//하나이상의 type="file"일 경우 ,로 구분해서 저장
					ori_saveFiles.add(multi.getOriginalFileName(name)+",");
				}else{
					saveFiles.add(multi.getFilesystemName(name));    
					ori_saveFiles.add(multi.getOriginalFileName(name));
				}
			}
			
			StringBuffer f=new StringBuffer();
			StringBuffer f2=new StringBuffer();
			
			
			for(int i=0;i<saveFiles.size();i++){
				f.append(saveFiles.get(i));//업로드 된 실제 파일을 버퍼에 누적해서 저장.
			}//일반 for
			
			for(int i=0;i<saveFiles.size();i++){
				f2.append(ori_saveFiles.get(i));//업로드 되기전 원래파일을 버퍼에 누적해서 저장
			}
			
			pb.setPt_file(f.toString());
			pb.setOri_pt_file(f2.toString());
			
			
			pb.setPt_name(pt_name); pb.setPt_title(pt_title);
			pb.setPt_pwd(pt_pwd); pb.setPt_cont(pt_cont);
			
			this.ptcmService.editPtcm(pb);
			
			ModelAndView m=new ModelAndView("redirect:/ptcm_cont.kkc?no="+pb.getPt_no()+"&page="+page+"&state=cont");
			return m;
		}		 
		return null;
	}
		
		//게시판 삭제
		@RequestMapping("/ptcm_del")
		public ModelAndView ptcm_del(@RequestParam("pt_no") int pt_no, @RequestParam("del_pwd") String del_pwd,
				HttpServletRequest request, HttpServletResponse response) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out= response.getWriter();
			
			int page=1;
			
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			PtcmBean db_pwd=this.ptcmService.getPtcmCont(pt_no);
			
			if(!db_pwd.getPt_pwd().equals(del_pwd)){
				out.println("<script>");
		    	out.println("alert('비번이 다릅니다!');");
		    	out.println("history.go(-1);");
		    	out.println("</script>");
			}else{
				this.ptcmService.deletePtcm(pt_no);//삭제
				return new ModelAndView("redirect:/ptcm_list.kkc?=page"+page);
			}
			return null;
		}
		
		//댓글 저장
		@RequestMapping(value="/ptcomment_ok.kkc")
		public String ptcom_ok(@ModelAttribute PtcommentBean pcb, HttpServletResponse response,
				HttpServletRequest request) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			if(pcb.getPc_cont().length() > 200){
				out.println("<script>");
				out.println("alert('댓글은 200자 초과를 못합니다!')");
				out.println("history.go(-1)");
				out.println("</script>");
			}else{
				this.ptcmService.insertPtCom(pcb);//댓글 저장
				
				return "redirect:/ptcm_cont.kkc?no="+pcb.getPt_no()+"&state=cont&page="+page;
				//get 방식으로 *.do?no=번호값&state=cont&page=쪽번호 3개의 피라미터값을 넘김
			}
			return null;
		}
		
		//댓글 삭제
		@RequestMapping(value="/ptcom_del_ok.kkc")
		public String ptcom_del_ok(@RequestParam("pc_no") int pc_no, @RequestParam("pt_no") int pt_no,
				@RequestParam("state") String state,HttpServletRequest request){

			int page=1;
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			this.ptcmService.Ptcom_del(pc_no);//댓글 삭제
			
			return "redirect:/ptcm_cont.kkc?no="+pt_no+"&state="+state+"&page="+page;
		}
}
