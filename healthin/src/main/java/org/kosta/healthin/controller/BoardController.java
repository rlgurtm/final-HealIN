package org.kosta.healthin.controller;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	
	@Resource
	private TipService tipService;
	@Resource
	private TrainerService trainerService;	
	
	@RequestMapping("tip/tip.do")
	public String getTipBoardList(Model model,String nowpage){
		if(nowpage==null)
			nowpage="1";
		ListVO list=tipService.getTipBoardList(nowpage);
		model.addAttribute("list",list );
		return "tip/tip.tiles";
	}
	@RequestMapping("tipcategory.do")
	@ResponseBody
	public Object tipBoardCategoryList(String category,String nowpage){
		if(nowpage==null)
			nowpage="1";
		System.out.println(tipService.tipBoardCategoryList(category, nowpage));
		return tipService.tipBoardCategoryList(category, nowpage);
	}

	
	@RequestMapping("trainer/trainerList.do")
	public String gettrainerList(Model model,String pageNo){
		if(pageNo==null)
			pageNo="1";
		ListVO list=trainerService.getTrainerList(pageNo);
		model.addAttribute("list",list);
		return "trainer/trainerList.tiles";
	}
	@RequestMapping("order.do")
	@ResponseBody
	public Object trainerListOrder(String category,String nowpage){
		if(nowpage==null)
			nowpage="1";
		System.out.println(tipService.tipBoardCategoryList(category, nowpage));
		return tipService.tipBoardCategoryList(category, nowpage);
	}
}
