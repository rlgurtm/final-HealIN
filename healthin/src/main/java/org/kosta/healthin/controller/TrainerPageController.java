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

	@RequestMapping("trainerPtList.do")
	public String ptList(String id,String nowpage,String pageNo,Model model,HttpServletRequest request){
		if(nowpage==null)
			nowpage="1";
		if(pageNo==null)
			pageNo="1";
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			model.addAttribute("ptList",service.trainerPtList(mvo.getId(), nowpage));
			model.addAttribute("mList",service.trainerMatchingList(mvo.getId(), pageNo));
			return "trainer/trainerPtList.tiles";
		}else{
			return "home.do";
		}
	}
	@RequestMapping("trainer/userInfoPopup.do")
	public String ptListPopup(String id,Model model){
		model.addAttribute("id", id);
		return "trainer/userInfoPopup";
	}
	@RequestMapping("trainerMatching.do")
	public String matching(String userId,String trainerId){
		service.trainerMatchingUpdate(userId, trainerId);
		return "redirect:/ptList.do?id="+trainerId;
	}
	@RequestMapping("matching.do")
	public String matchinsg(String trainerId,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			service.payInsert(mvo.getId(), trainerId, request.getParameter("period"));
			service.userMatchingInsert(mvo.getId(), trainerId);
			return "redirect:/trainer/trainerDetail.do?trainerId="+trainerId;
		}else{
			return "home.do";
		}
	}
	@RequestMapping("userPtList.do")
	public String matchingList(String id,String nowpage,Model model,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			if(nowpage==null)
				nowpage="1";
			model.addAttribute("list",service.userPtList(mvo.getId(), nowpage));
			return "trainer/userPtList.tiles";
		
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
