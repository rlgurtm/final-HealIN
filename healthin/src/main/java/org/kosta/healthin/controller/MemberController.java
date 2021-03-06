package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MemberService;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	private String uploadPath 
	//송희
	//="C:\\Users\\KOSTA\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\trainerPic\\";
	//지선
	//= "C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\trainerPic\\";
	//기혁
	= "C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\trainerPic\\";
	
	@Resource
	private MemberService memberService;

	@RequestMapping("register_form.do")
	public String register_form() {
		return "member/register_form";
	}

	@RequestMapping("register_step1.do")
	public String register_step1() {
		return "member/register_step1";
	}

	@RequestMapping("register_step2.do")
	public String register_step2() {
		return "member/register_step2";
	}
	@Transactional
	@RequestMapping("register_step3.do")
	public String register_step3(MemberVO vo, TrainerVO tvo, HttpServletRequest req, MultipartFile uploadfile) {
		String type = req.getParameter("type");
		String password = req.getParameter("password1");
		String tel = req.getParameter("mobile");

		vo.setPassword(password);
		vo.setTel(tel);
		memberService.registerStep3(vo);

		HttpSession session = req.getSession();
		session.setAttribute("mvo", vo);

		if (type.equals("n")) {
			memberService.registerStudent(vo);
		} else {
			// 실제 운영시에 사용할 서버 경로
			// String uploadPath =
			// req.getSession().getServletContext().getRealPath("/resources/trainerPic/");
			// file path upload
			
			//session.setAttribute("tvo", tvo);

			if (uploadfile != null) {
				
				String fileName = uploadfile.getOriginalFilename();
				tvo.setTrainerPhoto(fileName);
				//System.out.println(tvo);
				memberService.registerTrainer(tvo);
				try {
					// 2. File 사용
					File file = new File(uploadPath + fileName);
					uploadfile.transferTo(file);
					session.setAttribute("tvo", tvo);
				} catch (IOException e) {
					e.printStackTrace();
				} // try - catch
			} // if

		}
		return "redirect:member/register_sucess.do";
	}

	@ResponseBody
	@RequestMapping("findById.do")
	public String findById(String id) {
		String result = memberService.findById(id);
		return result;
	}
	@RequestMapping("idSearchform.do")
	public String idSearchform() {
		return "member/idSearchform";
	}
	@RequestMapping("passwordSearchform.do")
	public String passwordSearchform() {
		return "member/passwordSearchform";
	}
	
	@RequestMapping("findByIdLostPassword.do") 
	public String findByIdLostPassword(String searchId,HttpServletRequest req ) {
		MemberVO mvo = memberService.findByIdLostPassword(searchId);
		
		HttpSession session = req.getSession();
		session.setAttribute("mvo_password", mvo);
		return "member/findByIdLostPassword";
	}
	
	@RequestMapping("findByIdLostPasswordAuth.do") 
	public String findByIdLostPasswordAuth(HttpServletRequest req ) {
		String hiddenAuthType = req.getParameter("contactType");
		String name = req.getParameter("smsNumName");
		String smsNum = req.getParameter("smsNum");
		String otherMailName = req.getParameter("otherMailName");
		String otherMail = req.getParameter("otherMail");
		HttpSession session = req.getSession();
		MemberVO mvo = null;
		//System.out.println(hiddenAuthType);
		switch (hiddenAuthType) {
		case "smsNum":
			mvo = memberService.findPasswordByPhone(name,smsNum);
			
			if(mvo != null){
				session.setAttribute("findmvo", mvo);
				return "member/findByIdLostPasswordAuth";
			}else{
				return "member/findByIdLostPassword";
			}
			
		case "otherMail":
			mvo = memberService.findPasswordByMail(otherMailName, otherMail);
			
			if(mvo != null){
				session.setAttribute("findmvo", mvo);
				return "member/findByIdLostPasswordAuth";
			}else{
				return "member/findByIdLostPassword";
			}

		default:
			break;
		}
		
		if(hiddenAuthType.equals("tel")){
			mvo = memberService.findPasswordByPhone(name,smsNum);
			
			if(mvo != null){
				session.setAttribute("mvo", mvo);
				return "member/findByIdLostPasswordAuth";
			}else{
				return "member/findByIdLostPassword";
			}
		}else{
			mvo =  memberService.findPasswordByMail(otherMailName,otherMail);
			
			if(mvo != null){
				session.setAttribute("mvo", mvo);
				return "member/findByIdLostPasswordAuth";
			}else{
				return "member/findByIdLostPassword";
			}
		}
		
	}
	
	@RequestMapping("passwordSearchPasswordResult.do") 
	public String modifyPassword(String id,String newPassword,HttpServletRequest req ) {
		String result = memberService.modifyPassword(id,newPassword);
		return "member/passwordSearchPasswordResult";
	}
	
	@RequestMapping("idSearchResult.do") 
	public String idSearchResult(HttpServletRequest req ) {
		String hiddenAuthType = req.getParameter("contactType");
		String smsName = req.getParameter("smsNumName");
		String smsNum = req.getParameter("smsNum");
		
		String otherName = req.getParameter("otherMailName");
		String otherMail = req.getParameter("otherMail");
		//System.out.println(hiddenAuthType);
		
		//System.out.println(smsName);
		//System.out.println(smsNum);
		//System.out.println(otherName);
		//System.out.println(otherMail);
		
		//System.out.println("이름"+otherName);
		//System.out.println("메일"+otherMail);
		
		String id="";
		
		if(hiddenAuthType.equals("smsNum") ){
			id = memberService.idSearchByNumResult(smsName,smsNum);
		}else if(hiddenAuthType.equals("otherMail") ){
			System.out.println("여기로 들어왔다");
			id = memberService.idSearchByMailResult(otherName,otherMail);
		}
		
		HttpSession session = req.getSession();
		
		if(id != null){
			session.setAttribute("id", id);
			System.out.println("id"+id);
		}else{
			session.setAttribute("id", "정보가 없습니다");
		}
		
		return "member/idSearchResult";
	}

	@ResponseBody
	@RequestMapping(value = "findByNickname.do", produces = "application/text; charset=utf8")
	public String findByNickname(String nickname) {
		String result = memberService.findByNickname(nickname);
		return result;
	}
	
	@RequestMapping("login_form.do")
	public String login_form() {
		return "member/login_form";
	}

	@RequestMapping("login.do")
	public String login(HttpServletRequest request, String id, String password) {
		if(id.equals("admin")&&password.equals("rhksflwk")){
			HttpSession session = request.getSession();
			MemberVO vo = new MemberVO();
			vo.setIstrainer("admin");
			session.setAttribute("mvo", vo);
			
			//System.out.println(session.getAttribute("mvo"));
			return "redirect:adminAuthority.do";
		} else if (memberService.login(id, password)==null) {
			return "member/login_fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", memberService.login(id, password));
			//System.out.println(memberService.login(id, password));

			MemberVO vo = memberService.login(id, password);
			if (vo.getIstrainer().equals("trainer")) {
				TrainerVO tvo = memberService.trainerInfo(id);
				session.setAttribute("tvo", tvo);
				//System.out.println(tvo);
			}
			
			return "redirect:home.do";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request, String id, String password, HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}

	@RequestMapping("modify_form.do")
	public String modify_form() {
		return "member/modify_form";
	}

	@RequestMapping("modify.do")
	public String modify(MemberVO vo, TrainerVO tvo, HttpServletRequest req, MultipartFile uploadFile) {
		
		//memberService.trainerInfo(vo.getId());
		//System.out.println("xml 작업 후");

		String id = vo.getId();
		String password = req.getParameter("password1");
		String tel = req.getParameter("mobile");

		vo.setPassword(password);
		vo.setTel(tel);

		//memberService.modify(vo);
		//System.out.println("트레이너 냐?? 유저냐??"+vo.getIstrainer());
		if (vo.getIstrainer().equals("user")) {
			//System.out.println("유저정보"+vo);
			memberService.modify(vo);
			//System.out.println("user 기본 정보 저장 후"+vo);
		} else {
			MultipartFile file = uploadFile;
			UUID uuid = UUID.randomUUID();

			String trainerPicFile = uuid.toString() + "_" + uploadFile.getOriginalFilename();
			//System.out.println(trainerPicFile);
			//System.out.println(uploadFile.getOriginalFilename()=="");
			if (uploadFile.getOriginalFilename()=="") {
				//System.out.println(req.getParameter("trainerPhoto"));
				tvo.setTrainerPhoto(req.getParameter("trainerPhoto"));
				//System.out.println("트레이너 파일 저장..이즈 엠티"+req.getParameter("trainerPhoto"));
			} else {
				try {
					file.transferTo(new File(uploadPath + trainerPicFile));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				tvo.setTrainerPhoto(trainerPicFile);
				//System.out.println("트레이너 파일 저장..낫 엠티"+uuid.toString() + "_" + uploadFile.getOriginalFilename());
			}
			tvo.setMembervo(vo);
			//System.out.println(tvo);
			memberService.modifyTrainer(tvo);
			
			//System.out.println("트레이너modifyTrainer xml 작업 후"+tvo);
		}
		//System.out.println(vo);
		//System.out.println(tvo);
		HttpSession session = req.getSession(false);
		session.setAttribute("mvo", vo);
		if (vo.getIstrainer().equals("trainer")) {
			session.setAttribute("tvo", memberService.trainerInfo(vo.getId()));
			//System.out.println(tvo);
		}
		return "redirect:home.do";
	}
	
	
	@RequestMapping("withdraw_form.do")
	public String withdraw_form() {
		return "member/withdraw_form";
	}
	
	@RequestMapping("withdraw_step2.do")
	public String withdraw_step2() {
		return "member/withdraw_step2";
	}
	
	
	@RequestMapping("withdraw_result.do")
	public String withdraw(String id,String reconfirmPassword,HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		System.out.println("id"+id);
		System.out.println("reconfirmPassword"+reconfirmPassword);
		
		MemberVO vo = memberService.login(id, reconfirmPassword);
		if (vo != null) {
			memberService.withdraw(id);
			session.invalidate();
		}

		return "redirect:home.do";
	}

	

}
