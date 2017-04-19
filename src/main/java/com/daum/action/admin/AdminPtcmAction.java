package com.daum.action.admin;

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
import com.daum.service.admin.AdminPtcmService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AdminPtcmAction {
	
	@Autowired
	private AdminPtcmService adminptcmService;
	
	//포토 목록
	@RequestMapping("/admin_ptcm_list")
	public String admin_ptcm_list(Model listp, @ModelAttribute PtcmBean pb, HttpServletRequest request, 
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
			int limit=12;
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
			pb.setFind_field(find_field);
			pb.setFind_name("%"+find_name+"%");
			
			int listcount=this.adminptcmService.getListCount(pb);
			
			pb.setStartrow((page-1)*10+1);
			pb.setEndrow(pb.getStartrow()+limit-1);
			
			List<PtcmBean> adplist=this.adminptcmService.getPtcmList(pb);
			
			int maxpage=(int)((double)listcount/limit+0.95);
			int startpage=(((int)((double)page/ 10+0.9)) -1) * 10 +1;
			int endpage= maxpage;
			
			if(endpage>startpage+10-1) endpage=startpage+10-1;
			
			listp.addAttribute("adplist", adplist);
			listp.addAttribute("page", page);
			listp.addAttribute("startpage", startpage);
			listp.addAttribute("endpage", endpage);
			listp.addAttribute("maxpage", maxpage);
			listp.addAttribute("listcount",listcount);	
			listp.addAttribute("find_field",find_field);
			listp.addAttribute("find_name", find_name);
			
			return"admin/admin_ptcm_list";
		}
		
		return null;
	}
	
	//관리자 글쓰기 폼
	@RequestMapping("/admin_ptcm_write.kkc")
	public ModelAndView admin_ptcm_write(HttpServletRequest request, HttpServletResponse response,
			PtcmBean pb, HttpSession session) throws Exception{
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
		wm.setViewName("admin/admin_ptcm_write");
		return wm;
		}
		return null;
	}

	//저장
	@RequestMapping("/admin_ptcm_write_ok.kkc")
	public ModelAndView admin_ptcm_write_ok(HttpServletRequest request, HttpServletResponse response,
			PtcmBean pb, HttpSession session) throws Exception{
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
			
			this.adminptcmService.insertPtcmf(pb);
			
			ModelAndView m=new ModelAndView("redirect:/admin_ptcm_list.kkc");
			return m;
		
		}
		return null;
	}
	//내용보기
	@RequestMapping("/admin_ptcm_cont")
    public ModelAndView admin_pt_cont(@RequestParam("pt_no") int pt_no,@RequestParam("state") String state, @ModelAttribute PtcmBean adpb,
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
    	adpb=this.adminptcmService.getCont(pt_no);
    	String pt_cont=adpb.getPt_cont().replace("\n","<br/>");
    	//textarea 박스에서 엔터키 친 부분을 다음줄로 개행
    	
    	ModelAndView bm=new ModelAndView();
    	bm.addObject("adpb",adpb);
    	bm.addObject("pt_cont",pt_cont);
    	bm.addObject("page",page);
    	
        if(state.equals("cont")){
        	bm.setViewName("admin/admin_ptcm_cont");
        }else if(state.equals("edit")){
        	bm.setViewName("admin/admin_ptcm_edit");
        }else if(state.equals("del")){
        	bm.setViewName("admin/admin_ptcm_del");
        }
    	return bm;
    	}
    	return null;
    }
	
	//수정
	@RequestMapping("/admin_ptcm_edit_ok")
	public ModelAndView admin_ptcm_edit_ok(@ModelAttribute PtcmBean pb,HttpServletResponse response,
		HttpServletRequest request,HttpSession session) throws Exception{
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		  
		String admin_id=(String)session.getAttribute("admin_id");
		
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
		
		pb=this.adminptcmService.getCont(pt_no);
		if(!pb.getPt_pwd().equals(pt_pwd)){
			out.println("<script>");
			out.println("alert('비번이 다릅니다!');");
			out.println("history.go(-1);");
			out.println("</script>");
		}else if(admin_id ==null){
			  out.println("<script>");
			  out.println("alert('다시 로그인 하세요!');");
			  out.println("location='admin_login.kkc';");
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
			
			this.adminptcmService.editPtcm(pb);
			
			ModelAndView m=new ModelAndView("redirect:/admin_ptcm_list.kkc");
			return m;
		}
		  return null;
	}
	
	//삭제
	@RequestMapping("/admin_ptcm_del.kkc")
	  public String admin_ptcm_del( @RequestParam("pt_no") int pt_no, @ModelAttribute PtcmBean pb,
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
//			  pb=this.adminptcmService.getCont(pt_no);
			  this.adminptcmService.delPtcm(pt_no);
			  return "redirect:/admin_ptcm_list.kkc?page="+page;
		  }
		  return null;
	  }
}
