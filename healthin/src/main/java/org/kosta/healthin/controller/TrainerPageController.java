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
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String matchinsg(){
		return "redirect:trainerDetail.do";
	}
	@RequestMapping("followerList.do")
	public String followerList(Model model,String pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String id=mvo.getId();
			int follower=service.getFollowerCount(id);
			model.addAttribute("follower",follower);
			if(pageNo==null)
				pageNo="1";
			ListVO list=service.getFollowerList(pageNo,id);
			model.addAttribute("list",list );
		}
		else{
			return "home.do";
		}
		return "trainer/followerList.tiles";
	}
	
	@RequestMapping("updateAcceptState.do")
	public String updateAcceptState(Model model,String userId,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String trainerId=mvo.getId();
			service.updateAcceptState(trainerId,userId);
		}
		return "redirect:followerList.do";
	}
	@RequestMapping("trainerfollowing.do")
	@ResponseBody
	public Object trainerfollowing(Model model,String pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String trainerid=mvo.getId();
			if(pageNo==null)
				pageNo="1";
			return service.getBothFollowList(pageNo,trainerid);
		}
		else{
			return "home.do";
		}
	}
}
