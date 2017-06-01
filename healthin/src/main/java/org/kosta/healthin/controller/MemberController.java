package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MemberService;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
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
		return "member/register_step2.do";
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
			String uploadPath = "C:\\Users\\Administrator\\git\\final-HealIN2017\\healthin\\src\\main\\webapp\\resources\\trainerPic\\";
			
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
				TrainerVO tvo= memberService.trainerInfo(id);
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
	public String modify(MemberVO vo, TrainerVO tvo,HttpServletRequest req) {
		memberService.trainerInfo(vo.getId());
		
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
			
			String uploadPath = "C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\trainerPic\\";
			
			
			String originalPath =tvo.getTrainerPhoto();
			tvo.setTrainerPhoto("book1.jpg");
			memberService.modifyTrainer(tvo);	
		}

		return "redirect:home.do";
	}

}
