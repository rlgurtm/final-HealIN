package org.kosta.healthin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.service.UserFieldService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserFieldController {
	@Resource
	private UserFieldService userFieldService;
	@Resource
	private TrainerService trainerService;	
	
	@RequestMapping("userFieldForm.do")
	public String userFieldForm(Model model,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		// 관심분야 카테고리
		List<String> flist = userFieldService.selectFieldCategory();
		model.addAttribute("flist",flist);
		// 나의 관심분야 등록 되있는지 판별
		ListVO fieldList = userFieldService.selectUserField(mvo.getId());
		if(fieldList.getLVO().isEmpty()){
			
		} else {
			// 관심분야가 있을시 관심분야에 매칭되는 강사 list 출력
			ListVO trainerList = userFieldService.findByIdField(mvo.getId());
			model.addAttribute("trainerList",trainerList);
		}
		return "field/insertUserFieldForm.tiles";
	}
	
	@RequestMapping("insertUserField.do")
	public String insertUserField(HttpServletRequest request){
		String[] fieldList = request.getParameterValues("field");
		String mvoIstrainer = request.getParameter("istrainer");
		String mvoId = request.getParameter("mvoId");
		userFieldService.deleteUserField(mvoId);
		Map<String,String> map = new HashMap<String,String>();
		for(int i=0; i<fieldList.length; i++){
			map.put("field", fieldList[i]);
			map.put("mvoIstrainer", mvoIstrainer);
			map.put("mvoId", mvoId);
			//System.out.println(map);
			userFieldService.insertUserField(map);
		}
		return "redirect:userFieldForm.do";
	}
}
