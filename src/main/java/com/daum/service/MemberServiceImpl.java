package com.daum.service;




import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.daum.dao.MemDAO;
import com.daum.model.community.CmBean;
import com.daum.model.community.PtcmBean;
import com.daum.model.MemberBean;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemDAO memDao;

	@Autowired
	private JavaMailSender mailSender;
	
	public void insertMember(MemberBean m) {
			memDao.insertmember(m);
	}

	public MemberBean idCheck(String id) {
		return memDao.idchk(id);
	}

	public MemberBean loginCheck(String login_id) {
		return memDao.loginchk(login_id);
	}

	public MemberBean findid(MemberBean m) {
		return memDao.find_id(m);
	}

	public void sendMail(String to, String subject, String mail_cont) throws MessagingException {
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
		String from = "mistral314@gmail.com";			
		helper.setFrom(from);//보내는 관리자 메일주소
		helper.setTo(to);//받는 사람 메일 주소
		helper.setSubject(subject);//메일 제목
		helper.setText(mail_cont, true);//메일 내용
		mailSender.send(msg);//실제 메일 발송
		
	}

		public MemberBean emailCheck(String email) {
			return memDao.emailchk(email);
		}

		public MemberBean getMem(String id) {
			return memDao.getMem(id);
		}

		public void updateMem(MemberBean m) {
			memDao.updateMem(m);
		}

		public MemberBean pwdFind(MemberBean m) {
			return memDao.pwdFine(m);
		}

		public void updatePwd(MemberBean m) {

				memDao.updatePwd(m);
		}

		public void delM(MemberBean dm) {
				memDao.delM(dm);
		}

		@Override
		public int getListCount(CmBean c) {
			return memDao.Listc(c);
		}

		@Override
		public List<CmBean> getMyBoardList(CmBean c) {
			return memDao.getMyList(c);
		}

		@Override
		public int getListPcount(PtcmBean c) {
			return memDao.ListPt(c);
		}

		@Override
		public List<PtcmBean> getMyPBoardList(PtcmBean c) {
			return memDao.getPtList(c);
		}
		
}
