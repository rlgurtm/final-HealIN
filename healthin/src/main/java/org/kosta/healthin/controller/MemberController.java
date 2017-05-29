package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MemberService;
import org.kosta.healthin.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public  class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("register_step1.do")
	public String register_step1() { 
		return "member/register_step1";
	}
	
	@RequestMapping("login_form.do")
	public String login_form() { 
		return "member/login_form";
	}
	
	@RequestMapping("modify_form.do")
	public String modify_form() { 
		return "member/modify_form";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request,String id,String password) {
		System.out.println("로그인 들어왔다" + id +"/"+ password);
		if(memberService.login(id,password) == null){
			return "member/login_fail.do";
		}else{
			HttpSession session=request.getSession();
			session.setAttribute("mvo", memberService.login(id,password));
			return "redirect:home.do";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,String id,String password,HttpSession session) {
		System.out.println("로그아웃" + id + password+password);
		session.invalidate();
		return "redirect:home.do";
	}
	
	@RequestMapping("modify.do")
	public String modify(MemberVO vo, HttpServletRequest req ) {
		System.out.println("회원정보 수정 들어왔다" +vo);
		memberService.modify(vo);
		HttpSession session=req.getSession();
		session.setAttribute("mvo", vo);
		return "redirect:home.do";
	}
	
	
	@RequestMapping("register_form.do")
	public String register_form() { 
		return "member/register_form";
	}
	
	@RequestMapping("registerTrainer.do")
	public String registerTrainer(MemberVO vo, HttpServletRequest req ) {
		System.out.println("회원 가입>>>" +vo);
		memberService.registerTrainer(vo);
		HttpSession session=req.getSession();
		session.setAttribute("mvo", vo);
		return "redirect:home.do";
	}
	
	
	@RequestMapping("register_step2.do")
	public String register_step2( ) {
		System.out.println("회원 가입2>>>" );
		return "member/register_step2.do";
	}
	
	@RequestMapping("registerStudent.do")
	public String registerStudent(MemberVO vo, HttpServletRequest req ) {
		System.out.println("회원 가입>>>" +vo);
		memberService.registerStudent(vo);
		HttpSession session=req.getSession();
		session.setAttribute("mvo", vo);
		return "redirect:home.do";
	}

}
