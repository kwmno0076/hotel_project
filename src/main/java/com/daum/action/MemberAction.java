package com.daum.action;

import java.io.PrintWriter;
import java.util.Random;

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
import com.daum.service.MemberService;

@Controller
public class MemberAction {

	@Autowired
	private MemberService memberService;


	@RequestMapping("member_join")
	public ModelAndView member_login(){
		ModelAndView loginM=new ModelAndView();
		loginM.setViewName("member/join");
		return loginM;

	}

	//회원저장
	@RequestMapping("member_join_ok")
	public ModelAndView member_join_ok(MemberBean m,
			
			HttpServletResponse response)throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		//System.out.println(m.getC_id());
		//System.out.println(m.getC_email());
		
		MemberBean dm=this.memberService.idCheck(m.getMem_id());
		//System.out.println("반환값 아이디:"+dm.getC_id());			
		
		if(dm !=null ){
				out.println("<script>");
				out.println("alert('중복된 아이디 입니다.');");
				out.println("history.back();");
				out.println("</script>");
			}
		else{
			MemberBean dm2=this.memberService.emailCheck(m.getMem_email());
			//System.out.println("반환된 멜주소:"+dm2.getC_email());
				if(dm2!=null){
					out.println("<script>");
					out.println("alert('중복된 이메일주소 입니다.');");
					out.println("history.back();");
					out.println("</script>");
				}else{
					
					m.setMem_pwd(PwdChange.getPassWordToXEMD5String(
							m.getMem_pwd()));
					this.memberService.insertMember(m);
					return new ModelAndView("redirect:/login.kkc");
				}
				
			}
			
		return null;
	}
	
	//로그인 인증
	@RequestMapping("/member_login_ok")
	public ModelAndView member_login_ok(
			@RequestParam("login_id") String login_id,
			@RequestParam("login_pwd") String login_pwd,
			HttpServletResponse response,
			HttpSession session,
			HttpServletRequest request)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();

		MemberBean dm=this.memberService.loginCheck(login_id);
		if(dm==null){
			out.println("<script>");
			out.println("alert('해당 회원정보가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else{
			if(!dm.getMem_pwd().equals(
					PwdChange.getPassWordToXEMD5String(login_pwd))){
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.');");
				out.println("history.back();");
				out.println("</script>");
			}else{
				session.setAttribute("id", login_id);
				session.setAttribute("name",dm.getMem_name());
				return new ModelAndView("redirect:/index.kkc");
			}
		}
		return null;
	}
	
	//로그아웃
	@RequestMapping("/m_logout")
	public String m_out(HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session)throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		session = request.getSession();
		
		session.invalidate();
		
		out.println("<script>");
		out.println("alert('로그아웃 되었습니다.');");
		out.println("location='index.kkc';");
		out.println("</script>");
		
		return null;	
	}
	
	
	//아이디 찾기
	
	@RequestMapping("/find_id_ok")
	public ModelAndView find_id_ok(@RequestParam("p_email") String email,
			HttpServletResponse response,
			@ModelAttribute MemberBean m)throws Exception{
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			m.setMem_email(email);
			
			MemberBean pm = this.memberService.findid(m);
		
			if(pm==null){
				out.println("<script>");
				out.println("alert('해당 이메일로 가입한 회원정보가 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
			}else{
				String to=pm.getMem_email();
				String subject = "잠자리닷컴 아이디찾기 정보입니다.";
				String mail_cont = "<html><body><h2>"+pm.getMem_name()+" 회원님의 아이디 정보는 <br/><b>"
				+pm.getMem_id()+"</b> 입니다.</h2></body></html>";
				this.memberService.sendMail(to,subject,mail_cont);
				
				out.println("<script>");
				out.println("alert('요청하신 이메일로 아이디가 발송되었습니다.');");
				out.println("location='login.kkc';");
				out.println("</script>");
			
				
				
			}
		return null;
	}
	//비밀번호 찾기
	@RequestMapping("/findpwd_ok")
	public ModelAndView findpwd_ok(
			@RequestParam("mem_id") String id,
			@RequestParam("mem_email") String email,
			HttpServletResponse response,
			@ModelAttribute MemberBean m)
					throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		m.setMem_id(id); m.setMem_email(email); 
		MemberBean pm=this.memberService.pwdFind(m);
		//오라클로 부터 회원검색
		if(pm==null){
			out.println("<script>");
			out.println("alert('해당 이메일,아이디로 가입한 정보가 없습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}else{
			Random r=new Random();
			int pwd_random=r.nextInt(100000);
			String ran_pwd=Integer.toString(pwd_random);//임시비번을
			//문자열로 바꿔서 저장
			
			/* 임시비번 메일 발송 */
			String to=pm.getMem_email();
			String subject = "잠자리닷컴 비밀번호 찾기 정보입니다.";
			String mail_cont = "<html><body><h2>"+pm.getMem_name()+" 회원님의 임시비밀번호는 <br/><b>"
			+ran_pwd+"</b> 입니다.</h2></body></html>";
			this.memberService.sendMail(to,subject,mail_cont);
			
			m.setMem_pwd(PwdChange.getPassWordToXEMD5String(
					ran_pwd));//임시비번을 암호화해서 저장
			this.memberService.updatePwd(m);//임시비번 수정

			ModelAndView pm2=
					new ModelAndView("member/findpwd_ok.kkc");
			pm2.addObject("ran_pwd",ran_pwd);
			out.println("<script>");
			out.println("alert('요청하신 이메일로 임시 비밀번호가 발송되었습니다.');");
			out.println("location='login.kkc';");
			out.println("</script>");
		}
		return null;
	}
	//회원정보보기
	@RequestMapping("/m_info")
	public ModelAndView m_info(
			HttpServletResponse response,
			HttpServletRequest request,
			HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		session=request.getSession();
		String id=(String)session.getAttribute("id");

		if(id==null){
			out.println("<script>");
			out.println("alert('다시 로그인 해주세요.');");
			out.println("location='login.kkc';");
			out.println("</script>");
		}else{
			MemberBean em=this.memberService.getMem(id);
			//오라클로 부터 회원정보를 가져옴.
			ModelAndView um=
					new ModelAndView("member/m_info");
			um.addObject("m",em);
			return um;
		}
		return null;
	}
	//회원수정 인증
		@RequestMapping("/mem_ed_p")
		public ModelAndView mem_ed_p(
				HttpServletResponse response,
				HttpServletRequest request,
				HttpSession session) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();
			String id=(String)session.getAttribute("id");

			if(id==null){
				out.println("<script>");
				out.println("alert('다시 로그인 해주세요.');");
				out.println("location='login.kkc';");
				out.println("</script>");
			}else{
				MemberBean em=this.memberService.getMem(id);
				//오라클로 부터 회원정보를 가져옴.
				ModelAndView um=
						new ModelAndView("member/mem_ed_p");
				um.addObject("m",em);
				return um;
			}
			return null;
		}
	 //회원정보 인증 확인.
		@RequestMapping("/mem_ed_p_ok")
		public ModelAndView mem_ed_p_ok(
				@RequestParam("mem_pwd") String mem_pwd,
				HttpServletResponse response,
				HttpSession session,
				HttpServletRequest request)
						throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();
			String id=(String)session.getAttribute("id");
			
			MemberBean em=this.memberService.getMem(id);
			
			
				if(!em.getMem_pwd().equals(
						PwdChange.getPassWordToXEMD5String(mem_pwd))){
					out.println("<script>");
					out.println("alert('비밀번호가 틀립니다 다시 입력해주세요.');");
					out.println("history.back();");
					out.println("</script>");
				}else{
					return new ModelAndView("redirect:/mem_edit.kkc");
				}
			return null;
		}
		//회원정보보기
		@RequestMapping("/mem_edit")
		public ModelAndView mem_edit(
				HttpServletResponse response,
				HttpServletRequest request,
				HttpSession session) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();
			String id=(String)session.getAttribute("id");

			if(id==null){
				out.println("<script>");
				out.println("alert('다시 로그인 해주세요.');");
				out.println("location='login.kkc';");
				out.println("</script>");
			}else{
				MemberBean em=this.memberService.getMem(id);
				//오라클로 부터 회원정보를 가져옴.
				ModelAndView um=
						new ModelAndView("member/mem_edit");
				um.addObject("m",em);
				return um;
			}
			return null;
		}
		
		//정보수정 완료
		@RequestMapping("/mem_edit_ok")
		public ModelAndView mem_edit_ok(
				@ModelAttribute MemberBean m,
				HttpServletResponse response,
				HttpServletRequest request,
				@RequestParam("mem_email")String email,
				HttpSession session) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			session=request.getSession();
			String id=(String)session.getAttribute("id");

			if(id==null){
				out.println("<script>");
				out.println("alert('다시 로그인 해주세요.');");
				out.println("location='login.kkc';");
				out.println("</script>");
			}else{
				
				m.setMem_pwd(PwdChange.getPassWordToXEMD5String(
						m.getMem_pwd()));//비번 암호화

				this.memberService.updateMem(m);//정보수정
				out.println("<script>");
				out.println("alert('정보 수정완료 했습니다!');");
				out.println("location='login.kkc';");
				out.println("</script>");
				session.invalidate();
			}
			return null;
		}
	
		//회원탈퇴정보보기
				@RequestMapping("/mem_del")
				public ModelAndView mem_del(
						HttpServletResponse response,
						HttpServletRequest request,
						HttpSession session) throws Exception{
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					session=request.getSession();
					String id=(String)session.getAttribute("id");

					if(id==null){
						out.println("<script>");
						out.println("alert('다시 로그인 해주세요.');");
						out.println("location='login.kkc';");
						out.println("</script>");
					}else{
						MemberBean em=this.memberService.getMem(id);
						//오라클로 부터 회원정보를 가져옴.
						ModelAndView um=
								new ModelAndView("member/mem_del");
						um.addObject("m",em);
						return um;
					}
					return null;
		}
				
				
				//회원수정 인증
				@RequestMapping("/mem_del_p")
				public ModelAndView mem_del_p(
						HttpServletResponse response,
						HttpServletRequest request,
						HttpSession session) throws Exception{
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					session=request.getSession();
					String id=(String)session.getAttribute("id");

					if(id==null){
						out.println("<script>");
						out.println("alert('다시 로그인 해주세요.');");
						out.println("location='login.kkc';");
						out.println("</script>");
					}else{
						MemberBean em=this.memberService.getMem(id);
						//오라클로 부터 회원정보를 가져옴.
						ModelAndView um=
								new ModelAndView("member/mem_del_p");
						um.addObject("m",em);
						return um;
					}
					return null;
				}
				
				//회원탈퇴
				@RequestMapping("/mem_del_ok")
				public ModelAndView mem_del_ok(
						@RequestParam("mem_pwd") String mem_pwd,
						HttpServletResponse response,
						HttpSession session,
						@ModelAttribute MemberBean m,
						HttpServletRequest request)
								throws Exception{
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out=response.getWriter();
					session=request.getSession();
					String id=(String)session.getAttribute("id");
					
					MemberBean em=this.memberService.getMem(id);
					
					
						if(!em.getMem_pwd().equals(
								PwdChange.getPassWordToXEMD5String(mem_pwd))){
							out.println("<script>");
							out.println("alert('비밀번호가 틀립니다 다시 입력해주세요.');");
							out.println("history.back();");
							out.println("</script>");
						}else{
							MemberBean dm=new MemberBean();
							dm.setMem_id(id);
							this.memberService.delM(dm);//회원탈퇴

							session.invalidate();//세션 만료

							out.println("<script>");
							out.println("alert('이용해주셔서 감사합니다.');");
							out.println("location='login.kkc';");
							out.println("</script>");
						}
					return null;
				}
				
}
