package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.MyPageService;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {
	@Resource
	private MyPageService service;
		@RequestMapping("bmi.do")
		public String bmi(PhysicalInfoVO pivo,HttpServletRequest request){
			service.insertUserPhysicalInfo(pivo);
			HttpSession session=request.getSession();
			session.setAttribute("pivo",pivo);
			
			 /*bmi_height = bmi_height.value / 100
			 Square = bmi_height * bmi_height
			 var bmi_num= F.bmi_weight.value/Square
		     var strBmi = Math.round(bmi_num*100)/100*/
			
			return "redirect:mypage/bmi.do";
		}
		
}
