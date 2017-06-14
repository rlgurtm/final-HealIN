package org.kosta.healthin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MyPageService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	@Resource
	private MyPageService myPageService;

	@RequestMapping("insertUserPhysicalInfo.do")
	public String insertUserPhysicalInfo(PhysicalInfoVO pivo, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		pivo.setUser_Id(mvo.getId());
		//System.out.println(pivo);
		myPageService.insertUserPhysicalInfo(pivo);
		return "redirect:bmi_list.do";
	}

	@RequestMapping("bmi_list.do")
	public String selectUserPhyicalInfo(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = null;
		ListVO listVO = null;
		if(session.getAttribute("mvo")!=null){
		mvo = (MemberVO) session.getAttribute("mvo");
		}
		int nowPage;
		PagingBean pb;
		int valueTotalCount; 
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		} else {
			nowPage = 1;
		}
		if(mvo!=null){
			valueTotalCount=myPageService.graphContentCount(mvo.getId());
			//System.out.println(valueTotalCount);
			pb=new PagingBean(valueTotalCount,nowPage);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pb", pb);
			map.put("user_id",mvo.getId());
			listVO = myPageService.selectUserPhysicalInfo(map);
			listVO.setPb(pb);
			//System.out.println(listVO);
		}
		model.addAttribute("listVO", listVO);
		return "mypage/bmi_list.tiles";
	}
	/*@RequestMapping("tip/tip.do")
	public String getTipBoardList(Model model,String nowpage){
		if(nowpage==null)
			nowpage="1";
		ListVO list=tipService.getTipBoardList(nowpage);
		model.addAttribute("list",list );
		return "tip/tip.tiles";
	}*/
	/*@RequestMapping("bmi_list1.do")
	public ModelAndView graphPagingBean(String pageNo) {	
		return new ModelAndView("mypage/bmi_list.tiles","lvo",myPageService.graphContentCount(pageNo));
	}*/
	@RequestMapping("bmiListDelete.do")
	public String bmiListDelete(String physical_no){
		myPageService.bmiListDelete(physical_no);
		return "redirect:bmi_list.do";
	}
	@RequestMapping("userfollowingList.do")
	public String userfollowingList(Model model,String pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String userid=mvo.getId();
			int following=myPageService.getFollowingTotalCount(userid);
			model.addAttribute("following",following);
			if(pageNo==null)
				pageNo="1";
			ListVO list=myPageService.getFollowingList(pageNo,userid);
			System.out.println(list);
			model.addAttribute("list",list);
		}
		else{
			return "redirect:home.do";
		}
		return "mypage/followingList.tiles";
	}
	
	@RequestMapping("unfollow.do")
	public String updateAcceptState(Model model,String trainerId,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String userId=mvo.getId();
			myPageService.unfollow(trainerId,userId);
		}
		return "redirect:userfollowingList.do";
	}
	@RequestMapping("mypageBothfollow.do")
	@ResponseBody
	public Object trainerfollowing(Model model,String pageNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String userId=mvo.getId();
			if(pageNo==null)
				pageNo="1";
			return myPageService.getmypageBothFollowList(pageNo,userId);
		}
		else{
			return "redirect:home.do";
		}
	}
}
