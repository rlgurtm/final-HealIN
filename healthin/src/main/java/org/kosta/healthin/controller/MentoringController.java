package org.kosta.healthin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MentoringService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.MentoringVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
			ListVO listVO = null;
			if(mvo.getIstrainer().equals("trainer")){
				listVO = mentoringService.findByTrainerMatchingMemberList(mvo.getId());
			} else if(mvo.getIstrainer().equals("user")){
				listVO = mentoringService.findByUserMatchingMemberList(mvo.getId());
			}
			model.addAttribute("listVO",listVO);
			// System.out.println(listVO);
		}
		return "mentoring/mentoring_list.tiles";
	}
	
	@RequestMapping("mentoringDetail.do")
	@Transactional
	public String mentoringDetail(HttpServletRequest request,Model model){
		HttpSession session = request.getSession(false);
		ListVO listVO = new ListVO();
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:home.do";
		} else {
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			int nowPage;
			PagingBean pb;
			int mentoringTotalCount; 
			if(request.getParameter("nowPage")!=null){
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			} else {
				nowPage = 1;
			}
			String sendId = request.getParameter("sendId");
			//System.out.println(sendId);
			String receiveId = mvo.getId();
			MentoringVO mentoring = new MentoringVO();
			mentoring.setSendId(sendId);
			mentoring.setReceiveId(receiveId);
			//System.out.println(mentoring);
			mentoringTotalCount = mentoringService.mentoringTotalCount(mentoring);
			pb = new PagingBean(mentoringTotalCount,nowPage);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pb", pb);
			map.put("mentoring", mentoring);
			mentoringService.mentoringDetailHits(mentoring);
			listVO = mentoringService.mentoringDetail(map);
			listVO.setPb(pb);
			model.addAttribute("mentoringId",sendId);
		}
		model.addAttribute("listVO",listVO);
		//System.out.println(listVO);
		return "mentoring/mentoring_detail.tiles";
	}
	
	@RequestMapping("insertMentoring.do")
	public String insertMentoring(MentoringVO mentoring,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		String sendId = null;
		if(session==null||session.getAttribute("mvo")==null){
			return "redirect:home.do";
		} else {
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			sendId = mvo.getId();
			mentoring.setSendId(sendId);
			//System.out.println(mentoring);
			mentoringService.insertMentoring(mentoring);
		}
		return "redirect:mentoringDetail.do?sendId="+mentoring.getReceiveId();
	}
	
}
