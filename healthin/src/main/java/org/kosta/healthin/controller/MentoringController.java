package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MentoringService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MentoringController {
	@Resource
	private MentoringService mentoringService;
	
	@RequestMapping("mentoringList.do")
	public String mentoringList(HttpServletRequest request,Model model){
		HttpSession session = request.getSession(false);
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:home.do";
		} else {
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			ListVO listVO = new ListVO();
			if(mvo.getIstrainer().equals("trainer")){
				listVO = mentoringService.findByTrainerMatchingMemberList(mvo.getId());
			} else if(mvo.getIstrainer().equals("user")){
				listVO = mentoringService.findByUserMatchingMemberList(mvo.getId());
			}
			model.addAttribute("listVO",listVO);
		}
		return "mentoring/mentoring_list.tiles";
	}
	
}
