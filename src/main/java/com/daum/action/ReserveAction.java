package com.daum.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.daum.model.HotelBean;
import com.daum.model.ReserveBean;
import com.daum.service.HotelService;
import com.daum.service.ReserveService;

@Controller
public class ReserveAction {
	
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private HotelService hotelService;
	
	//예약페이지열기
		@RequestMapping("/reserve1.kkc")
		public ModelAndView reservation(HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session,
				@RequestParam("h_no") int h_no) throws Exception{
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			String logid=(String)session.getAttribute("id");
			
			if(logid==null){
				out.println("<script>");
				out.println("alert('로그인해야 예약이 가능합니다.');");
				out.println("location='login.kkc';");
				out.println("</script>");
			}else{
				
				//호텔 번호,이름가져오기
				List<HotelBean> ho_info=this.hotelService.getDetail(h_no);
				
				//예약가능 사이트, 호텔 개수 가져오기
				HotelBean ok_num=this.hotelService.getokNum(h_no);
				
				//예약된목록 가져오기(룸갯수, 예약날짜, 예약일수)
				List<ReserveBean> res_list=new ArrayList<ReserveBean>();
				
				res_list=this.reserveService.getReslist(h_no);
				
				request.setAttribute("reslist", res_list);
				
			    ModelAndView res=new ModelAndView();
			    
			    res.addObject("ho_info",ho_info); //호텔번호, 이름
			    res.addObject("ok_num",ok_num); //예약가능 정보
			    res.addObject("h_no",h_no); //호텔번호
			   
			    res.setViewName("reserve/reserve1");
			    
				return res;
			}
			return null;		
		}
		
		
		//예약2번째단계
		@RequestMapping("/reserve2.kkc")
		public ModelAndView reservation2(HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session,
				@RequestParam("h_no") int h_no,
				@RequestParam("resdate") int resdate, //숙박 머무는날짜?
				@RequestParam("reserve_roomfind") int roomfind, // 호텔 추가 구분값 미리 만들어둿음
				@RequestParam("day") int day)throws Exception{
			
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			String logid=(String)session.getAttribute("id");
			
			if(logid==null){
				out.println("<script>");
				out.println("alert('세션만료, 다시로그인해주세요.');");
				out.println("location='index.kkc';");
				out.println("</script>");
			}else{			
				if(roomfind==1){
					for(int k=0;k<5;k++){
						List<ReserveBean> resdatelist=this.reserveService.getresdatelist(resdate+k); //최대5일
						
						List<HotelBean> hb2=this.hotelService.getDetail(h_no);
						
						for(int i=0;i<hb2.size();i++){
							int room=hb2.get(i).getH_room_ok();
							
							for(int j=0;j<resdatelist.size();j++){
								if(hb2.get(i).getH_no()==resdatelist.get(j).getReserve_hno()){
									room--;
									
									if(room==0){
										int cantresdate=resdatelist.get(j).getReserve_date();
										
										int seloption=cantresdate-resdate;
										
										List<HotelBean> ho_info=this.hotelService.getDetail(h_no);
										
										ModelAndView res2=new ModelAndView();
										res2.addObject("ho_info",ho_info);//호텔정보
										
										res2.addObject("h_no",h_no);
										res2.addObject("resdate",resdate);
										res2.addObject("roomfind",roomfind); //호텔 방구분값
										
										res2.addObject("day",day);
										res2.addObject("seloption",seloption);
										res2.setViewName("reserve/reserve2");
										
										return res2;
									}
								}
								
							}
						}
			
					}
					int seloption=5;
					
					List<HotelBean> ho_info=this.hotelService.getDetail(h_no);
					
					ModelAndView res2=new ModelAndView();					
					
					res2.addObject("ho_info",ho_info);//호텔정보
					res2.addObject("h_no",h_no);
					res2.addObject("resdate",resdate);
					res2.addObject("roomfind",roomfind);
					
					res2.addObject("day",day);
					res2.addObject("seloption",seloption);
					
					res2.setViewName("reserve/reserve2");
					return res2;
				} // if ==1 끝
			}
			return null; //룸 추가할시 여기서 복사 ㄱ
		}

		
		
		@RequestMapping("/reserve3.kkc")
		public ModelAndView reservation3(HttpServletRequest request,
				HttpServletResponse response,HttpSession session,
				@RequestParam("h_no") int h_no,
				@RequestParam("resdate") int resdate,
				@RequestParam("reserve_roomfind") int roomfind,
				@RequestParam("day") int day,
				@RequestParam("price_option") int price_option)
		
						
						throws Exception{
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			String logid ="";
			System.out.println("실험*------>"+price_option);
			System.out.println(session.getAttribute("id")); 
			
			if( session.getAttribute("id") == null )
			{
				out.println("<script>");
				out.println("alert('세션만료, 다시로그인해주세요.');");
				out.println("location='index.kkc';");
				out.println("</script>");
			}else{
				
				logid = (String)session.getAttribute("id");
				
				System.out.println(request.getParameter("selday"));
				
				int selday=Integer.parseInt(request.getParameter("selday"));//이용기간 이게 널이다보니까 형변환 실패
				
				
				System.out.println(request.getParameter("reserve_pwd"));				
				
				int respwd=Integer.parseInt(request.getParameter("reserve_pwd")); // 예약 비밀번호
								//호텔 bean에 들어있는 값입니다.			
				
				System.out.println("h_price_option : " + request.getParameter("h_price_option"));		
									
				
				String username=request.getParameter("reserve_username");//입금자명
				
				System.out.println("reserve_username : " + request.getParameter("reserve_username"));
				
				String addr=request.getParameter("reserve_addr");//연락처
				
				String resid=(String)session.getAttribute("id");//세션아이디
				String payment=request.getParameter("reserve_payment");//결제방법
				
				//B-계좌,C-카드
				
				List<HotelBean> ho_info=this.hotelService.getDetail(h_no);
				
				/*PublicCoCBean pcb=new PublicCoCBean();
				PublicCoCBean pcb2=this.reservationService.getInfo(pcb);*/
				
				ModelAndView res3=new ModelAndView();
				
				res3.addObject("ho_info",ho_info);
				res3.addObject("h_no",h_no);
				res3.addObject("resdate",resdate);
				res3.addObject("roomfind",roomfind);
				res3.addObject("day",day);
				res3.addObject("selday",selday);
				res3.addObject("price_option",price_option);
				res3.addObject("username",username);
				res3.addObject("addr",addr);
				res3.addObject("resid",resid);
				res3.addObject("payment",payment);
				res3.addObject("respwd",respwd);
				
				res3.setViewName("reserve/reserve3");
				
				return res3;
			}
			return null;
		}
		
		@RequestMapping("/reserveOk.kkc")
		public ModelAndView reservation4(HttpServletRequest request,
				HttpSession session,
				HttpServletResponse response,
				@RequestParam("h_no") int h_no,
				@RequestParam("resdate") int resdate,
				@RequestParam("reserve_roomfind") int roomfind,
				@RequestParam("selday") int selday,
				@RequestParam("state") String state,
				@RequestParam("username") String username,
				@RequestParam("respwd") String respwd,
				@RequestParam("reserve_addr") String addr
				
				) throws Exception{
			
			String resid=(String)session.getAttribute("id");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			if(resid==null){
				out.println("<script>");
				out.println("alert('세션만료, 다시로그인해주세요.');");
				out.println("location='index.coc';");
				out.println("</script>");
			}else{
				int allPrice=Integer.parseInt(request.getParameter("reserve_price"));
				HotelBean hb_name=this.hotelService.getName(h_no);
				
				ReserveBean rb=new ReserveBean();
				if(state.equals("B")){  //무통장입
					
					rb.setReserve_name(hb_name.getH_title()); //호텔이름을 reserve에 저장
					rb.setReserve_roomfind(roomfind);//룸 종류 정해주는 놈 구분해주는 놈임
					rb.setReserve_hno(h_no);
					rb.setReserve_userid(resid);//예약자ID
					rb.setReserve_date(resdate);//이용날짜
					rb.setReserve_username(username);//입금자명
					rb.setReserve_pwd(respwd);//예약비번
					rb.setReserve_addr(addr);
					rb.setReserve_price(allPrice);
					rb.setReserve_payname(""); //입금자명
					rb.setReserve_paynum(""); // 계좌번호
					rb.setReserve_payment(state); // 결제 방법
					rb.setReserve_night(selday+"박"+(selday+1)+"일");
					//예약자명(입금자명),예약자연락처,예약비번,결제금액,
					//예약자연락처, 예약비밀번호
					//결제금액
					
					int re=this.reserveService.res_in(rb);
					
					String resdate2=Integer.toString(resdate);
					String finalday=resdate2.substring(4,8);
					 //ㅅㅂ 빈 클라스랑 테이블 이름 줜나 잘 적어놔서 너무 길어서 미치겠네 
					if(re>0){ //re는 음 ... 호텔 예약번호 넣겠음
						if(selday>1){ //이용기간이 1이상 일때
							ReserveBean rb2=new ReserveBean();
							int seq=rb2.getReserve_no(); //예약번호^^ 현우보다 좋은 한우^^
							for(int i=1;i<selday;i++){
								rb.setReserve_ref(seq); // 예약번호묶음^^
								rb.setReserve_date(resdate+i); // 예약 날짜
								
								String resdate3=Integer.toString(resdate+i);
								
								String finalday2=resdate3.substring(5,8);
								
								int finalday3=Integer.parseInt(finalday2);
								
								String finalday4=resdate3.substring(4,8);
								
								int finalday5=Integer.parseInt(finalday4);
								
								if(finalday.equals("0430")||finalday.equals("0630")||finalday.equals("0930")||
										finalday.equals("1130")){
										rb.setReserve_date(resdate+70+i);
										
								}else if(finalday.equals("0131")||finalday.equals("0331")||finalday.equals("0531")||
											finalday.equals("0731")||finalday.equals("0831")||finalday.equals("1031")){
										rb.setReserve_date(resdate+69+i);
								}else if(finalday.equals("1231")){
										rb.setReserve_date(resdate-8869+i);
								}else if(finalday.equals("0228")){
										rb.setReserve_date(resdate+72+i);
								}else if((finalday3>430&&finalday3<437)||(finalday3>630&&finalday3<637)||(finalday3>930&&finalday3<937)||
										(finalday5>1130&&finalday5<1137)){
										rb.setReserve_date(resdate+70+i);
								}else if((finalday3>131&&finalday3<138)||(finalday3>331&&finalday3<338)||(finalday3>531&&finalday3<538)||
										(finalday3>731&&finalday3<738)||(finalday3>831&&finalday3<838)||(finalday5>1031&&finalday5<1038)){
									rb.setReserve_date(resdate+69+i);
								}else if(finalday5>1231&&finalday5<1238){
									rb.setReserve_date(resdate-8869+i);
								}else if(finalday3>228&&finalday3<237){
									rb.setReserve_date(resdate+72+i);
								}
		
								this.reserveService.res_in2(rb);
							}	
							
							ModelAndView bank=new ModelAndView();
							bank.setViewName("reserve/reserve5");
							
							return bank;
						}else{

							ModelAndView bank=new ModelAndView();
							bank.setViewName("reserve/reserve5");
							
							return bank;
						}
					}else{
						out.println("<script>");
						out.println("alert('에러야 이 새퀴야 만약 이게 뜨면 지금바로 ReserveAction으로 이동해서 reserveOk를 확인하도록해');");
						out.println("location='index.kkc'");
						out.println("</script>");
					}
				} // 여기까지 무통장 입금 끝!! 아 눈아파 ㅅㅂ 지금 1시냐 ㅡㅡ 얼마나 더 써야되 ㅅㅂ 졸립다 자고싶다 
				//어려워 하기싫어 ㅡㅡ 난 아직도 테이블을 고민한다... 계좌를 글쓰기란에서 쓰게할까.. 아니면 관리자 시작페이지에 띄울까..
				//또한 내가 해야할 일이 뭐가있냐.. 맞다 방 여러개 만드는거 ㅅㅂ 그거 알아봐야되.. 덕형한테 가야겠다.
				//실행 해보고 오류나면 컴터끄고 자야겠다
				
				
				//ㅅㅂ 카드결제방식은 뱅크방식 복사해서
				else if(state.equals("C")){
					
					rb.setReserve_name(hb_name.getH_title()); //호텔이름을 reserve에 저장
					rb.setReserve_roomfind(roomfind);//룸 종류 정해주는 놈 구분해주는 놈임
					rb.setReserve_hno(h_no);
					rb.setReserve_userid(resid);//예약자ID
					rb.setReserve_date(resdate);//이용날짜
					rb.setReserve_username(username);//입금자명
					rb.setReserve_pwd(respwd);//예약비번
					rb.setReserve_addr(addr);
					rb.setReserve_price(allPrice);
					rb.setReserve_payname(""); //입금자명
					rb.setReserve_paynum(""); // 계좌번호
					rb.setReserve_payment(state); // 결제 방법
					rb.setReserve_night(selday+"박"+(selday+1)+"일");
					
					int re=this.reserveService.res_in(rb);
					
					String resdate2=Integer.toString(resdate);
					String finalday=resdate2.substring(4,8);

					if(re>0){
						if(selday>1){
							ReserveBean rb2=new ReserveBean();
							int seq=rb2.getReserve_no();
							for(int i=1;i<selday;i++){
								rb.setReserve_ref(seq);
								rb.setReserve_date(resdate+i);
								
								String resdate3=Integer.toString(resdate+i);
								
								String finalday2=resdate3.substring(5,8);
								int finalday3=Integer.parseInt(finalday2);
								String finalday4=resdate3.substring(4,8);
								int finalday5=Integer.parseInt(finalday4);
								
								if(finalday.equals("0430")||finalday.equals("0630")||finalday.equals("0930")||
										finalday.equals("1130")){
										rb.setReserve_date(resdate+70+i);
								}else if(finalday.equals("0131")||finalday.equals("0331")||finalday.equals("0531")||
											finalday.equals("0731")||finalday.equals("0831")||finalday.equals("1031")){
										rb.setReserve_date(resdate+69+i);
								}else if(finalday.equals("1231")){
										rb.setReserve_date(resdate-8869+i);
								}else if(finalday.equals("0228")){
										rb.setReserve_date(resdate+72+i);
								}else if((finalday3>430&&finalday3<437)||(finalday3>630&&finalday3<637)||(finalday3>930&&finalday3<937)||
										(finalday5>1130&&finalday5<1137)){
										rb.setReserve_date(resdate+70+i);
								}else if((finalday3>131&&finalday3<138)||(finalday3>331&&finalday3<338)||(finalday3>531&&finalday3<538)||
										(finalday3>731&&finalday3<738)||(finalday3>831&&finalday3<838)||(finalday5>1031&&finalday5<1038)){
									rb.setReserve_date(resdate+69+i);
								}else if(finalday5>1231&&finalday5<1238){
									rb.setReserve_date(resdate-8869+i);
								}else if(finalday3>228&&finalday3<237){
									rb.setReserve_date(resdate+72+i);
								}
								
								this.reserveService.res_in2(rb);
							}			
							
							rb.setReserve_username(username);
							rb.setReserve_pwd(respwd);
							rb.setReserve_date(resdate);
							int r_resref=this.reserveService.getNopayinfo(rb);
							
							ModelAndView card=new ModelAndView();
							card.addObject("r_resref",r_resref);
							card.addObject("allPrice",allPrice);
							card.setViewName("reserve/reserve4");
							
							return card;
						}else{
							rb.setReserve_username(username);
							rb.setReserve_pwd(respwd);
							rb.setReserve_date(resdate);
							int r_resref=this.reserveService.getNopayinfo(rb);
							ModelAndView card=new ModelAndView();
							card.addObject("r_resref",r_resref);
							card.addObject("allPrice",allPrice);
							card.setViewName("reserve/reserve4");
							
							return card;
						}
					}else{
						out.println("<script>");
						out.println("alert('ERROR!');");
						out.println("location='index.kkc'");
						out.println("</script>");
					}
				}		
			}
			
			return null;
		}
		
		
		//마이페이지->카드결제 진행매핑
		/*@RequestMapping("/cardPay.kkc")
		public ModelAndView cardpay(HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session,
				@RequestParam("r_resref") int r_resref,
				@RequestParam("r_price") int allPrice) throws Exception{
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			String logid=(String)session.getAttribute("id");
			
			if(logid==null){
				out.println("<script>");
				out.println("alert('세션만료, 다시로그인해주세요.');");
				out.println("location='index.coc';");
				out.println("</script>");
			}else{
				ReservationBean rb=new ReservationBean();
				
				rb.setR_price(allPrice);
				rb.setR_resref(r_resref);
				
				ModelAndView cardpay=new ModelAndView();
				
				cardpay.addObject("allPrice",rb.getR_price());
				cardpay.addObject("r_resref",rb.getR_resref());
				cardpay.setViewName("reservation/reservation4");
				
				return cardpay;
			}
			return null;
		}*/
		//카드결제 ok매핑
		/*@RequestMapping("/cardPayok.kkc")
		public ModelAndView Payok(HttpServletRequest request,
				HttpServletResponse response,
				HttpSession session) throws Exception{
			
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			String resid=(String)session.getAttribute("id");
			
			if(resid==null){
				out.println("<script>");
				out.println("alert('세션만료, 다시로그인해주세요.');");
				out.println("location='index.coc';");
				out.println("</script>");
			}else{
				String payname=request.getParameter("r_payname");
				int r_resref=Integer.parseInt(request.getParameter("r_resref"));
				
				ReservationBean rb=new ReservationBean();
				rb.setR_payok("Y");
				rb.setR_resref(r_resref);
				rb.setR_memid(resid);
				rb.setR_payname(payname);
				
				int re=this.reservationService.payok(rb);
				
				if(re>0){
					ModelAndView resok=new ModelAndView();
					
					resok.setViewName("reservation/reservation5");
					
					return resok;
				}else{
					out.println("<script>");
					out.println("alert('ERROR!');");
					out.println("location='index.coc'");
					out.println("</script>");
				}
			}		
			return null;
		}
	*/

}
