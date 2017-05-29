package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MemberService;
import org.kosta.healthin.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public  class MemberController {
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
	public String register_step2( ) {
		System.out.println("회원 가입2>>>" );
		return "member/register_step2.do";
	}
	
	@RequestMapping("register_step3.do")
	public String register_step3(MemberVO vo, HttpServletRequest req ) {
		String type = req.getParameter("type");
		String id = req.getParameter("id");
		
		memberService.registerStep3(vo);
		
		HttpSession session=req.getSession();
		session.setAttribute("mvo", vo);
		System.out.println("step2 기본정보 공통 저장??"+vo);
		
		if(type.equals("n")){
			memberService.registerStudent(vo);
		}else{
			System.out.println("trainer 회원 가입>>>" +vo);
			
			MultipartFile uploadfile = vo.getUploadfile();
	        if (uploadfile != null) {
	            String fileName = uploadfile.getOriginalFilename();
	            vo.setFileName(fileName);
	            System.out.println("fileName>>>"+fileName);
	            try {
	                // 1. FileOutputStream 사용
	                // byte[] fileData = file.getBytes();
	                // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
	                // output.write(fileData);
	            	
	            	String uploadPath = req.getSession().getServletContext().getRealPath("/resources/upload/");
	        		System.out.println("업로드 경로:" + uploadPath);
	                // 2. File 사용
	                File file = new File(uploadPath + fileName);
	                uploadfile.transferTo(file);
	                memberService.registerTrainer(vo);
	                System.out.println("트레이너 회원 가입 完了>>>" );
	            } catch (IOException e) {
	                e.printStackTrace();
	            } // try - catch
	        } // if
			
			
		}
		return "redirect:member/register_sucess.do";
	}
	
/*	@RequestMapping("register_sucess.do")
	public String register_sucess() { 
		return "member/register_sucess.do";
	}*/
	
	@RequestMapping("login_form.do")
	public String login_form() { 
		return "member/login_form";
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
	
	@RequestMapping("modify_form.do")
	public String modify_form() { 
		return "member/modify_form";
	}
	
	@RequestMapping("modify.do")
	public String modify(MemberVO vo, HttpServletRequest req ) {
		System.out.println("회원정보 수정 들어왔다" +vo);
		memberService.modify(vo);
		HttpSession session=req.getSession();
		session.setAttribute("mvo", vo);
		return "redirect:home.do";
	}

}
