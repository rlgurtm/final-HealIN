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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	private String uploadPath = "C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\trainerPic\\";

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

			if (uploadfile != null) {
				String fileName = uploadfile.getOriginalFilename();
				tvo.setTrainerPhoto(fileName);
				try {
					// 2. File 사용
					File file = new File(uploadPath + fileName);
					uploadfile.transferTo(file);
					memberService.registerTrainer(tvo);
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
		session.setAttribute("mvo", mvo);
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
		
		switch (hiddenAuthType) {
		case "smsNum":
			mvo = memberService.findPasswordByPhone(name,smsNum);
			
			if(mvo != null){
				session.setAttribute("mvo", mvo);
				return "member/findByIdLostPasswordAuth";
			}else{
				return "member/findByIdLostPassword";
			}
			
		case "otherMail":
			mvo = memberService.findPasswordByPhone(name,smsNum);
			
			if(mvo != null){
				session.setAttribute("mvo", mvo);
				return "member/findByIdLostPasswordAuth";
			}else{
				mvo =  memberService.findPasswordByMail(otherMailName,otherMail);
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

	@ResponseBody
	@RequestMapping(value = "findByNickname.do", produces = "application/text; charset=utf8")
	public String findByNickname(String nickname) {
		String result = memberService.findByNickname(nickname);
		return result;
	}
	
//	@ResponseBody
//	@RequestMapping(value = "findByPassword.do", produces = "application/text; charset=utf8")
//	public String findByPassword(String id,String name,String nickname) {
//		String result = memberService.findByPassword(nickname);
//		System.out.println("result" + result);
//		return result;
//	}

	@RequestMapping("login_form.do")
	public String login_form() {
		return "member/login_form";
	}

	@RequestMapping("login.do")
	public String login(HttpServletRequest request, String id, String password) {
		if (memberService.login(id, password) == null) {
			return "member/login_fail";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("mvo", memberService.login(id, password));

			MemberVO vo = memberService.login(id, password);
			if (vo.getIstrainer().equals("trainer")) {
				TrainerVO tvo = memberService.trainerInfo(id);
				session.setAttribute("tvo", tvo);
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
		memberService.trainerInfo(vo.getId());

		String id = vo.getId();
		String password = req.getParameter("password1");
		String tel = req.getParameter("mobile");

		vo.setPassword(password);
		vo.setTel(tel);

		memberService.modify(vo);
		HttpSession session = req.getSession();
		session.setAttribute("mvo", vo);

		if (vo.getIstrainer().equals("user")) {
			memberService.modifyStudent(vo);
		} else {
			MultipartFile file = uploadFile;
			UUID uuid = UUID.randomUUID();

//			String uploadPath = "C:\\Users\\Administrator\\git\\final-HealIN2017\\healthin\\src\\main\\webapp\\resources\\trainerPic\\";
//
//			String originalPath = tvo.getTrainerPhoto();
//			String trainerPicFile = uuid.toString() + "_" + uploadFile.getOriginalFilename();
			
			if (file.isEmpty() == false) {
				tvo.setTrainerPhoto(uuid.toString() + "_" + uploadFile.getOriginalFilename());
			} else {
				tvo.setTrainerPhoto(req.getParameter("trainerPhoto"));
			}

			memberService.modifyTrainer(tvo);
		}

		return "redirect:home.do";
	}

}
