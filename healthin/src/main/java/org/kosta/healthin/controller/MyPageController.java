package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MyPageService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	@Resource
	private MyPageService myPageService;

	@RequestMapping("insertUserPhysicalInfo.do")
	public String insertUserPhysicalInfo(PhysicalInfoVO pivo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		pivo.setUser_Id(mvo.getId());
		// System.out.println(pivo);
		myPageService.insertUserPhysicalInfo(pivo);
		return "redirect:bmi_list.do";
	}

	@RequestMapping("bmi_list.do")
	public String selectUserPhyicalInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		ListVO listVO = myPageService.selectUserPhysicalInfo(mvo);
		System.out.println(listVO);
		model.addAttribute("listVO", listVO);
		
		return "mypage/bmi_list.tiles";
	}
	/*int height = Integer.parseInt(request.getParameter("height"));
	int weight = Integer.parseInt(request.getParameter("weight"));

	double bmiTest = (height * 2) / weight;
	System.out.println(bmiTest);
	model.addAttribute("bmiTest", bmiTest);*/
}
