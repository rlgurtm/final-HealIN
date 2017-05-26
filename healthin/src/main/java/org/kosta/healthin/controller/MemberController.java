package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public  class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("login_form.do")
	public String login_form() { 
		return "member/login_form.do";
	}
	
	@RequestMapping("login.do")
	public String login(HttpServletRequest request,String id,String password,HttpSession session) {
		System.out.println("로그인 들어왔다" + id +"/"+ password);
		
		if(memberService.login(id,password) == null){
			return "member/login_fail.do";
		}else{
			session.setAttribute("mvo", memberService.login(id,password));
			return "home.do";
		}
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request,String id,String password,HttpSession session) {
		System.out.println("로그아웃" + id + password);
		session.invalidate();
		return "home.do";
	}

}
