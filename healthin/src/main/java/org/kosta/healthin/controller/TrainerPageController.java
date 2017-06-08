package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.TrainerPageService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrainerPageController {
	@Resource
	private TrainerPageService service;

	@RequestMapping("ptList.do")
	public String ptList(String id,Model model){
		model.addAttribute("ptList", service.trainerPtList(id));
		return "trainer/ptList.tiles";
	}
	@RequestMapping("trainer/ptListPopup.do")
	public String ptListPopup(){
		return "trainer/ptListPopup";
	}
	@RequestMapping("trainer/followingList.do")
	public String followingList(Model model,String pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			String id=mvo.getId();
			if(pageNo==null)
				pageNo="1";
			ListVO list=service.getFollowerList(pageNo,id);
			model.addAttribute("list",list );
		
		return "trainer/followingList.tiles";
	}
}
