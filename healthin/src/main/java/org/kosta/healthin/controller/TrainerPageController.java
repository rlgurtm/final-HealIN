package org.kosta.healthin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.TrainerPageService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TrainerPageController {
	@Resource
	private TrainerPageService service;

	@RequestMapping("trainerPtList.do")
	public String ptList(String nowpage,String pageNo,Model model,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			if(nowpage==null)
				nowpage="1";
			if(pageNo==null)
				pageNo="1";
			model.addAttribute("ptList",service.trainerPtList(mvo.getId(), nowpage));
			model.addAttribute("mList",service.trainerMatchingList(mvo.getId(), pageNo));
			return "trainer/trainerPtList.tiles";
		}else{
			return "redirect:home.do";
		}
	}
	@RequestMapping("trainer/userInfoPopup.do")
	public String ptListPopup(String id,String result,Model model,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null){
			MemberVO mvo=(MemberVO)session.getAttribute("mvo");
			model.addAttribute("result", result);
			model.addAttribute("pvo", service.userTrainerPay(id, mvo.getId()));
			return "trainer/userInfoPopup";
		}else{
			return "redirect:home.do";
		}
		
	}
	@RequestMapping("trainerMatching.do")
	public String matching(String userId,String trainerId){
		service.trainerMatchingUpdate(userId, trainerId);
		service.trainerPayUpdate(userId, trainerId);
		return "redirect:trainerPtList.do";
	}
	@RequestMapping("userMatching.do")
	public String matchinsg(String trainerId,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			if((service.countExistMatching(mvo.getId(), trainerId))==0){
				service.payInsert(mvo.getId(), trainerId, request.getParameter("period"));
				service.userMatchingInsert(mvo.getId(), trainerId);
				return "redirect:userPtList.do?id="+mvo.getId();
			}
		}
		return "redirect:home.do";
	}
	@RequestMapping("userPtList.do")
	public String matchingList(String id,String pageNo,String nowpage,Model model,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			MemberVO mvo = (MemberVO) session.getAttribute("mvo");
			if(nowpage==null)
				nowpage="1";
			if(pageNo==null)
				pageNo="1";
			model.addAttribute("list",service.userPtList(mvo.getId(), nowpage));
			model.addAttribute("mList",service.userPtMatchingList(mvo.getId(), pageNo));
			return "trainer/userPtList.tiles";
		}else{
			return "redirect:home.do";
		}
	}
	@RequestMapping("trainerInfoPopup.do")
	public String trainerInfoPopup(String id,Model model,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null){
			MemberVO mvo=(MemberVO)session.getAttribute("mvo");
			model.addAttribute("pvo", service.userTrainerPay(mvo.getId(),id));
			return "trainer/trainerInfoPopup";
		}else{
			return "redirect:home.do";
		}
	}
	@RequestMapping("userDeposit.do")
	public String userDeposit(String userId,String trainerId,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		if(session!=null){
			service.userDepositUpate(userId, trainerId);
			return "redirect:userPtList.do";
		}else{
			return "redirect:home.do";
		}
	}
	@RequestMapping("countExistMatching.do")
	@ResponseBody
	public int countExistMatching(String userId,String trainerId){
		if(service.countExistMatching(userId, trainerId)==0&&
		   service.countExistMatching1(userId, trainerId)==0&&
		   service.countExistFollowing(userId, trainerId)==1){
			return 0;
		}
		return 1;
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
			return "redirect:home.do";
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
			return "redirect:home.do";
		}
	}
	
	@RequestMapping("insertTrainerFieldForm.do")
	public String insertTrainerFieldForm(Model model,String id,String istrainer){
		List<String> list = service.findFieldCategory();
		model.addAttribute("fieldList",list);
		model.addAttribute("mvoId",id);
		model.addAttribute("istrainer",istrainer);
		return "trainer/insertTrainerFieldForm";
	}
	
	@Transactional
	@RequestMapping("insertTrainerField.do")
	@ResponseBody
	public String insertTrainerField(HttpServletRequest request,@RequestParam(value="field[]") List<String> arrayParams,@RequestParam(value="istrainer") String istrainer, @RequestParam(value="mvoId") String mvoId){
		//System.out.println(arrayParams.toString()+mvoId+istrainer);
		service.deleteTrainerField(mvoId);
		Map<String,String> map = new HashMap<String,String>();
		for(int i=0; i<arrayParams.size(); i++){
			map.put("fieldName", arrayParams.get(i));
			map.put("mvoId", mvoId);
			map.put("mvoIstrainer", istrainer);
			//System.out.println(map);
			service.insertTrainerField(map);
		}
		if(istrainer.equals("trainer")){
			service.trainerRankUp(mvoId);
			HttpSession session = request.getSession(false);
			TrainerVO tvo = (TrainerVO) session.getAttribute("tvo");
			tvo.setRank(1);
			session.setAttribute("tvo",tvo);
		}
		return "ok";
	}
}
