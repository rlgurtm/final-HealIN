package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MentoringService;
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
		}
		MemberVO mvo = (MemberVO) request.getAttribute("mvo");
		if(mvo.getIstrainer().equals("trainer")){
			
		} else if(mvo.getIstrainer().equals("user")){
			
		}
		return "mentoring/mentoring_list.tiles";
	}
	
}
