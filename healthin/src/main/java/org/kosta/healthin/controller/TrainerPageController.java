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
	public String ptList(String id,String nowpage,String pageNo,Model model){
		if(nowpage==null)
			nowpage="1";
		if(pageNo==null)
			pageNo="1";
		model.addAttribute("ptList",service.trainerPtList(id, nowpage));
		model.addAttribute("mList",service.trainerMatchingList(id, pageNo));
		return "trainer/ptList.tiles";
	}
	@RequestMapping("trainer/ptListPopup.do")
	public String ptListPopup(String id){
		System.out.println("아이디 넘어옵니다"+id);
		return "trainer/ptListPopup";
	}
	@RequestMapping("trainer/followingList.do")
	public String followingList(Model model,String pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String id=mvo.getId();
			int follower=service.getFollowerList(id);
			model.addAttribute("follower",follower);
			if(pageNo==null)
				pageNo="1";
			ListVO list=service.getFollowerList(pageNo,id);
			model.addAttribute("list",list );
		}
		else{
			return "home.do";
		}
		return "trainer/followingList.tiles";
	}
	
	@RequestMapping("updateAcceptState.do")
	public String updateAcceptState(Model model,String userId,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String trainerId=mvo.getId();
			service.updateAcceptState(trainerId,userId);
		}
		return "redirect:trainer/followingList.do";
	}
}
